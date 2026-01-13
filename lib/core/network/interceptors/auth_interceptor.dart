import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/core/network/token_service.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';

class AuthInterceptor extends Interceptor {
  final String? accessToken;
  final Dio dio;
  final Future<String?> Function() fetchNewAccessToken;
  final Future<void> Function() clearTokens;

  AuthInterceptor({
    required this.accessToken,
    required this.dio,
    required this.fetchNewAccessToken,
    required this.clearTokens,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for public endpoints
    if (_isPublicEndpoint(options.path)) {
      return handler.next(options);
    }

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
        final newAccessToken = await fetchNewAccessToken();

        if (newAccessToken != null) {
          // Retry the original request with new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        // Refresh failed - clear tokens and redirect to login
        await clearTokens();
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.register,
      ApiEndpoints.sendOtp,
      ApiEndpoints.doesEmailExist,
      ApiEndpoints.googleSignIn,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
