import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  final String? _accessToken;
  final String? _refreshToken;
  final Function(String) _saveAccessToken;
  final Function(String) _saveRefreshToken;
  final Future<void> Function() _clearTokens;
  final Dio _dio;

  AuthInterceptor({
    required String? accessToken,
    required String? refreshToken,
    required Function(String) saveAccessToken,
    required Function(String) saveRefreshToken,
    required Future<void> Function() clearTokens,
    required Dio dio,
  })  :
        _accessToken = accessToken,
        _refreshToken = refreshToken,
        _saveAccessToken = saveAccessToken,
        _saveRefreshToken = saveRefreshToken,
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
        final newAccessToken = await _fetchRefreshToken();

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

  Future<String?> _fetchRefreshToken() async {
    try {

      if (_refreshToken == null) return null;

      final response = await _dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': _refreshToken},
      );

      final newAccessToken = response.data['data']['accessToken'] as String?;
      final newRefreshToken = response.data['data']['refreshToken'] as String?;

      if (newAccessToken != null) _saveAccessToken(newAccessToken);

      if (newRefreshToken != null) _saveRefreshToken(newRefreshToken);

      return newAccessToken;
    } catch (e) {
      return null;
    }
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