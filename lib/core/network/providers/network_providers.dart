import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/core/network/interceptors/auth_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/error_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/logger_interceptor.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_providers.g.dart';



// Base Dio instance without interceptors
@riverpod
Dio baseDio(Ref ref) {
  try{
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl + ApiConstants.apiVersion,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return dio;
  } catch(e){
    rethrow;
  }
}

// Dio with all interceptors
// Dio with all interceptors
@riverpod
Future<Dio> dio(Ref ref) async {
  try {
    final baseDio = ref.watch(baseDioProvider);
    final secureStorageHelper = ref.watch(secureStorageHelperProvider);
    final secureString = await secureStorageHelper.get(
      SecureStorageKeys.secureStorageKey,
    );
    final secureModel = secureString == null
        ? null
        : SecureStorageModelMapper.fromJson(secureString);

    // Add interceptors in order
    baseDio.interceptors.addAll([
      LoggerInterceptor(),
      AuthInterceptor(
        accessToken: secureModel?.authResponseModel?.accessToken,
        refreshToken: secureModel?.authResponseModel?.refreshToken,
        saveAccessToken: (accessToken) async {
          final currentString = await secureStorageHelper.get(
            SecureStorageKeys.secureStorageKey,
          );
          if (currentString != null) {
            final currentModel = SecureStorageModelMapper.fromJson(currentString);
            final updatedModel = currentModel.copyWith(
              authResponseModel: currentModel.authResponseModel?.copyWith(
                accessToken: accessToken,
              ),
            );
            await secureStorageHelper.save(
              SecureStorageKeys.secureStorageKey,
              updatedModel.toJson(),
            );
          }
        },
        saveRefreshToken: (refreshToken) async {
          final currentString = await secureStorageHelper.get(
            SecureStorageKeys.secureStorageKey,
          );
          if (currentString != null) {
            final currentModel = SecureStorageModelMapper.fromJson(currentString);
            final updatedModel = currentModel.copyWith(
              authResponseModel: currentModel.authResponseModel?.copyWith(
                refreshToken: refreshToken,
              ),
            );
            await secureStorageHelper.save(
              SecureStorageKeys.secureStorageKey,
              updatedModel.toJson(),
            );
          }
        },
        clearTokens: () async {
          await secureStorageHelper.delete(SecureStorageKeys.secureStorageKey);
        },
        dio: baseDio,
      ),
      ErrorInterceptor(),
    ]);

    return baseDio;
  } catch (e) {
    rethrow;
  }
}


// API Client provider
@riverpod
Future<ApiClient> apiClient(Ref ref) async {
  try{
    final dio = await ref.watch(dioProvider.future);
    return ApiClient(dio);
  } catch(e){
    rethrow;
  }
}
