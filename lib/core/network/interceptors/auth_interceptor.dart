import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/network/api_endpoints.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;
  final Dio _dio;

  AuthInterceptor({
    required FlutterSecureStorage secureStorage,
    required Dio dio,
  })  : _secureStorage = secureStorage,
        _dio = dio;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Skip auth for public endpoints
    if (_isPublicEndpoint(options.path)) {
      return handler.next(options);
    }

    // Get access token from secure storage
    final accessToken = await _secureStorage.read(
      key: ApiConstants.accessTokenKey,
    );

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      try {
        // Try to refresh the token
        final newAccessToken = await _refreshToken();

        if (newAccessToken != null) {
          // Retry the original request with new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final response = await _dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        // Refresh failed - clear tokens and redirect to login
        await _clearTokens();
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(
        key: ApiConstants.refreshTokenKey,
      );

      if (refreshToken == null) return null;

      final response = await _dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final newAccessToken = response.data['data']['accessToken'] as String?;
      final newRefreshToken = response.data['data']['refreshToken'] as String?;

      if (newAccessToken != null) {
        await _secureStorage.write(
          key: ApiConstants.accessTokenKey,
          value: newAccessToken,
        );
      }

      if (newRefreshToken != null) {
        await _secureStorage.write(
          key: ApiConstants.refreshTokenKey,
          value: newRefreshToken,
        );
      }

      return newAccessToken;
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearTokens() async {
    await _secureStorage.delete(key: ApiConstants.accessTokenKey);
    await _secureStorage.delete(key: ApiConstants.refreshTokenKey);
  }

  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.register,
      ApiEndpoints.refreshToken,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}