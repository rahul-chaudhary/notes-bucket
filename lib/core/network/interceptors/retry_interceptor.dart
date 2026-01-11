import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio _dio;
  final int _maxRetries;
  final Duration _retryDelay;

  RetryInterceptor({
    required Dio dio,
    int maxRetries = 2,
    Duration retryDelay = const Duration(seconds: 1),
  })  : _dio = dio,
        _maxRetries = maxRetries,
        _retryDelay = retryDelay;

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // Only retry on network errors and timeouts
    if (_shouldRetry(err)) {
      final extra = err.requestOptions.extra;
      final retries = extra['retries'] ?? 0;

      if (retries < _maxRetries) {
        extra['retries'] = retries + 1;

        // Wait before retrying
        await Future.delayed(_retryDelay * (retries + 1));

        try {
          final response = await _dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          // Continue to next interceptor or return error
        }
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}
