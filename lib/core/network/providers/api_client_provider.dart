import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/core/network/interceptors/auth_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/error_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/logger_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

// Secure storage provider
@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}

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
Dio dio(Ref ref) {
  final baseDio = ref.watch(baseDioProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  // Add interceptors in order
  baseDio.interceptors.addAll([
    LoggerInterceptor(),
    AuthInterceptor(
      secureStorage: secureStorage,
      dio: baseDio,
    ),
    ErrorInterceptor(),
  ]);

  return baseDio;
}

// API Client provider
@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}