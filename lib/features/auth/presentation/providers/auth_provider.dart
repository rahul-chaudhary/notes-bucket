import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:notes_bucket/features/auth/data/repository/auth_repository_impl.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';
import 'package:notes_bucket/features/auth/domain/usecases/auth_usecases.dart';
import 'package:notes_bucket/features/user/presentation/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Future<AuthRemoteDatasource> authRemoteDatasource(Ref ref) async {
  final apiClient = await ref.watch(apiClientProvider.future);
  return AuthRemoteDatasourceImpl(apiClient);
}

@Riverpod(keepAlive: true)
Future<AuthRepository> authRepository(Ref ref) async {
  final remoteDataSource = await ref.watch(authRemoteDatasourceProvider.future);
  final secureStorageHelper = ref.watch(secureStorageHelperProvider);
  return AuthRepositoryImpl(remoteDataSource, secureStorageHelper);
}

// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
Future<DoesEmailExist> doesEmailExistUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return DoesEmailExist(repository);
}

@Riverpod(keepAlive: true)
Future<SendOtp> sendOtpUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SendOtp(repository);
}

@Riverpod(keepAlive: true)
Future<Authentication> authUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  final secureStorageHelper = ref.watch(secureStorageHelperProvider);
  return Authentication(secureStorageHelper, repository);
}

// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<bool> doesEmailExist(String email) async {
    state = const AsyncValue.loading();

    try {
      final usecase = await ref.read(doesEmailExistUseCaseProvider.future);
      final useCaseResult = await usecase.call(email);

      return useCaseResult.fold(
        (failure) {
          state = AsyncValue.error(failure.toString(), StackTrace.current);
          throw Exception(failure.toString());
        },
        (exists) {
          state = const AsyncValue.data(null);
          return exists;
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<String> sendOtp(String email) async {
    state = const AsyncValue.loading();

    try {
      final usecase = await ref.read(sendOtpUseCaseProvider.future);
      final useCaseResult = await usecase.call(email);

      return useCaseResult.fold(
        (failure) {
          state = AsyncValue.error(failure.toString(), StackTrace.current);
          throw Exception(failure.toString());
        },
        (message) {
          state = const AsyncValue.data(null);
          return message;
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<User> authenticate(AuthParams params) async {
    state = const AsyncValue.loading();

    try {
      final usecase = await ref.read(authUseCaseProvider.future);
      final useCaseResult = await usecase.call(params);

      return useCaseResult.fold(
        (failure) {
          state = AsyncValue.error(failure.toString(), StackTrace.current);
          throw Exception(failure.toString());
        },
        (user) {
          state = const AsyncValue.data(null);
          return user;
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}

