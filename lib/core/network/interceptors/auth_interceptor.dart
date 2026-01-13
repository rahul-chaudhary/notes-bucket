import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getAccessToken; // Changed to a function
  final Dio dio;
  final Future<String?> Function() fetchNewAccessToken;
  final Future<void> Function() clearTokens;

  AuthInterceptor({
    required this.getAccessToken, // Now fetches token on each request
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

    // Get token at request time (not creation time)
    final token = await getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      try {
        final newAccessToken = await fetchNewAccessToken();

        if (newAccessToken != null) {
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
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
