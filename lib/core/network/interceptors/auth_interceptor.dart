import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  final String? _accessToken;
  final String? _refreshToken;
  final Function(String) _saveAccessToken;
  final Future<void> Function() _clearTokens;
  final Dio _dio;

  AuthInterceptor({
    required String? accessToken,
    required String? refreshToken,
    required Function(String) saveAccessToken,
    required Future<void> Function() clearTokens,
    required Dio dio,
  }) : _accessToken = accessToken,
        _refreshToken = refreshToken,
       _saveAccessToken = saveAccessToken,
       _clearTokens = clearTokens,
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

    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
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
        final newAccessToken = await _fetchAccessToken();

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

  Future<String?> _fetchAccessToken() async {
    try {
      if (_refreshToken == null) {
        throw AuthenticationFailure('Refresh token is null');
      }

      final response = await _dio.post(
        ApiEndpoints.refreshAccessToken,
        data: {'refresh_token': _refreshToken},
      );

      final newAccessToken = response.data['data']['access_token'] as String?;

      if (newAccessToken != null) _saveAccessToken(newAccessToken);

      return newAccessToken;
    } catch (e) {
      rethrow;
    }
  }

  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.register,
      ApiEndpoints.refreshAccessToken,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
