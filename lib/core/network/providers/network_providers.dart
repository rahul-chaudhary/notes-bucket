import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/core/network/interceptors/auth_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/error_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/logger_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/retry_interceptor.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_providers.g.dart';

// Base Dio instance without interceptors
@riverpod
Dio baseDio(Ref ref) {
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
}

// Dio with all interceptors
@riverpod
Future<Dio> dio(Ref ref) async {
  final baseDio = ref.watch(baseDioProvider);
  final secureStorageHelper = ref.read(secureStorageHelperProvider);
  final secureData = await secureStorageHelper.get();

  baseDio.interceptors.addAll([
    LoggerInterceptor(),
    RetryInterceptor(dio: baseDio),
    AuthInterceptor(
      accessToken: secureData?.authResponseModel?.accessToken,
      refreshToken: secureData?.authResponseModel?.refreshToken,
      saveAccessToken: (accessToken) async {
        if (secureData?.authResponseModel != null) {
          final updated = secureData!.copyWith(
            authResponseModel: secureData.authResponseModel!.copyWith(
              accessToken: accessToken,
            ),
          );
          await secureStorageHelper.save(updated);
        }
      },
      clearTokens: () async => await secureStorageHelper.deleteAll(),
      dio: baseDio,
    ),
    ErrorInterceptor(),
  ]);

  return baseDio;
}

// API Client provider
@riverpod
Future<ApiClient> apiClient(Ref ref) async {
  final dio = await ref.watch(dioProvider.future);
  return ApiClient(dio);
}
