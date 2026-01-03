import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/providers/api_client_provider.dart';
import 'package:notes_bucket/features/auth/data/models/user.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:notes_bucket/features/auth/data/repository/auth_repository_impl.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';
import 'package:notes_bucket/features/auth/domain/usecases/auth_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDatasourceImpl(apiClient);
}

@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDatasourceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(remoteDataSource, secureStorage);
}

// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@riverpod
DoesEmailExist doesEmailExistUseCase(Ref ref) => DoesEmailExist(ref.watch(authRepositoryProvider));

@riverpod
SendOtp sendOtpUseCase(Ref ref) => SendOtp(ref.watch(authRepositoryProvider));

@riverpod
Authentication authUseCase(Ref ref) => Authentication(ref.watch(authRepositoryProvider));


// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<bool> doesEmailExist(String email) async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      final usecase = ref.read(doesEmailExistUseCaseProvider);
      final useCaseResult = await usecase.call(email);
      return useCaseResult.fold(
            (failure) => throw failure.toString(),
            (exists) => exists,
      );
    });

    // Update state
    state = result.map(data: (_) => const AsyncValue.data(null), error: (e) => e, loading: (l) => l);

    // Rethrow if error occurred
    if (result.hasError) {
      throw result.error!;
    }

    return result.requireValue;
  }

  Future<String> sendOtp(String email) async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      final usecase = ref.read(sendOtpUseCaseProvider);
      final useCaseResult = await usecase.call(email);
      return useCaseResult.fold(
            (failure) => throw failure.toString(),
            (message) => message,
      );
    });

    // Update state
    state = result.map(data: (_) => const AsyncValue.data(null), error: (e) => e, loading: (l) => l);

    if (result.hasError) {
      throw result.error!;
    }

    return result.requireValue;
  }

  Future<User> authenticate(AuthParams params) async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() async {
      final usecase = ref.read(authUseCaseProvider);
      final useCaseResult = await usecase.call(params);
      return useCaseResult.fold(
            (failure) => throw failure.toString(),
            (user) => user,
      );
    });

    if(result.hasError) {
      throw result.error!;
    }
    return result.requireValue;
  }
}
