import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/features/user/data/datasource/user_remote_datasource.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';
import 'package:notes_bucket/features/user/data/repository/user_repository_impl.dart';
import 'package:notes_bucket/features/user/domain/repository/user_repository.dart';
import 'package:notes_bucket/features/user/domain/usecases/user_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────
@Riverpod(keepAlive: true)
Future<UserRemoteDatasource> userRemoteDatasource(Ref ref) async {
  final apiClient = await ref.watch(apiClientProvider.future);
  return UserRemoteDatasourceImpl(apiClient);
}

@Riverpod(keepAlive: true)
Future<UserRepository> userRepository(Ref ref) async {
  final remoteDataSource = await ref.watch(userRemoteDatasourceProvider.future);
  return UserRepositoryImpl(remoteDataSource);
}


// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Future<FetchUser> fetchUserUseCase(Ref ref) async {
  final repository = await ref.watch(userRepositoryProvider.future);
  return FetchUser(repository);
}

@Riverpod(keepAlive: true)
Future<ActivateUserSubscription> activateUserSubscriptionUseCase(Ref ref) async {
  final repository = await ref.watch(userRepositoryProvider.future);
  return ActivateUserSubscription(repository);
}



// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() async {
    return await _getUser();
  }

  Future<User?> _getUser() async {
    final secureStorageHelper = ref.read(secureStorageHelperProvider);

    // Try fetching from API first
    try {
      final user = await _fetchFromApi();
      if (user != null) return user;
    } catch (_) {
      // Fall back to cached user if API fails
    }

    // Fallback to stored user
    final authResponse = await secureStorageHelper.get();
    return authResponse?.authResponseModel?.user;
  }

  Future<User?> _fetchFromApi() async {
    final usecase =  await ref.read(fetchUserUseCaseProvider.future);
    final res = await usecase.call(null);

    return res.fold(
          (_) => null,
          (user) {
        ref.read(secureStorageHelperProvider).updateUser(user);
        return user;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _fetchFromApi();
      return user ?? state.value;
    });
  }

  Future<void> activateUserSubscription() async {
    final usecase = await ref.read(activateUserSubscriptionUseCaseProvider.future);
    final res = await usecase.call(null);

    await res.fold(
          (failure) => throw failure.toString(),
          (_) async => await refresh(),
    );
  }
}

