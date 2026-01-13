import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/core/network/interceptors/auth_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/error_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/logger_interceptor.dart';
import 'package:notes_bucket/core/network/interceptors/retry_interceptor.dart';
import 'package:notes_bucket/core/network/token_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_providers.g.dart';

// ============================================================================
// Base Dio (No Auth Interceptor - For Token Refresh)
// ============================================================================

@Riverpod(keepAlive: true)
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

  // Only add non-auth interceptors
  dio.interceptors.addAll([
    LoggerInterceptor(),
    ErrorInterceptor(),
  ]);

  return dio;
}

// ============================================================================
// STEP 2: Base API Client (For Token Service)
// ============================================================================

@Riverpod(keepAlive: true)
ApiClient baseApiClient(Ref ref) {
  final dio = ref.watch(baseDioProvider);
  return ApiClient(dio);
}

// ============================================================================
// Full API Client (For Regular App Usage)
// ============================================================================

@riverpod
Future<ApiClient> apiClient(Ref ref) async {
  final dio = await ref.watch(dioProvider.future);
  return ApiClient(dio);
}


// ============================================================================
// Full Dio (With Auth Interceptor - For Regular API Calls)
// ============================================================================

@Riverpod(keepAlive: true)
Future<Dio> dio(Ref ref) async {
  // Get base dio
  final baseDio = ref.watch(baseDioProvider);

  // Clone it to avoid modifying the base
  final dio = Dio(baseDio.options);

  // Get token service
  final tokenService = ref.watch(tokenServiceProvider);

  // Add ALL interceptors (including auth)
  dio.interceptors.addAll([
    LoggerInterceptor(),
    AuthInterceptor(
      accessToken: await tokenService.getAccessToken(),
      dio: baseDio, // ← Use BASE dio for refresh requests!
      fetchNewAccessToken: tokenService.refreshAccessToken,
      clearTokens: tokenService.clearTokens,
    ),
    RetryInterceptor(dio: dio),
    ErrorInterceptor(),
  ]);

  return dio;
}