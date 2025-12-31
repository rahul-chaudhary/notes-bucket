import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/providers/api_client_provider.dart';
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
DoesUserExist doesUserExistUseCase(Ref ref) => DoesUserExist(ref.watch(authRepositoryProvider));

@riverpod
SendOtp sendOtpUseCase(Ref ref) => SendOtp(ref.watch(authRepositoryProvider));

// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@riverpod
class DoesUserExistNotifier extends _$DoesUserExistNotifier {

  @override
  Future<bool> build(String email) async {
    final usecase = ref.read(doesUserExistUseCaseProvider);
    final result = await usecase.call(email);
    return result.fold(
        (l) => throw Exception(l.message),
        (status) => status);
  }
}

@riverpod
class SendOtpNotifier extends _$SendOtpNotifier {

  @override
  Future<String> build(String email) async {
    final usecase = ref.read(sendOtpUseCaseProvider);
    final result = await usecase.call(email);
    return result.fold(
        (l) => throw Exception(l.message),
        (message) => message);
  }
}