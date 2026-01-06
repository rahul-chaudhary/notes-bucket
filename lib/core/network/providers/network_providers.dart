import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/core/network/interceptors/auth_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/error_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/logger_interceptor.dart';
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
  final secureData = await ref.watch(secureStorageControllerProvider.future);

  baseDio.interceptors.addAll([
    LoggerInterceptor(),
    AuthInterceptor(
      accessToken: secureData?.authResponseModel?.accessToken,
      refreshToken: secureData?.authResponseModel?.refreshToken,
      saveAccessToken: (accessToken) async {
        final notifier = ref.read(secureStorageControllerProvider.notifier);
        final current = await ref.read(secureStorageControllerProvider.future);
        if (current?.authResponseModel != null) {
          final updated = current!.copyWith(
            authResponseModel: current.authResponseModel!.copyWith(
              accessToken: accessToken,
            ),
          );
          await notifier.save(updated);
        }
      },
      clearTokens: () async {
        final notifier = ref.read(secureStorageControllerProvider.notifier);
        await notifier.clear();
      },
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
