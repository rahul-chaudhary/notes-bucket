import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('╔════════════════════════════════════════════════════════════════');
      print('║ 🌐 REQUEST');
      print('╠════════════════════════════════════════════════════════════════');
      print('║ URL: ${options.uri}');
      print('║ Method: ${options.method}');
      print('║ Headers: ${_sanitizeHeaders(options.headers)}');
      if (options.data != null) {
        print('║ Body: ${_sanitizeBody(options.data)}');
      }
      if (options.queryParameters.isNotEmpty) {
        print('║ Query Parameters: ${options.queryParameters}');
      }
      print('╚════════════════════════════════════════════════════════════════');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('╔════════════════════════════════════════════════════════════════');
      print('║ ✅ RESPONSE');
      print('╠════════════════════════════════════════════════════════════════');
      print('║ URL: ${response.requestOptions.uri}');
      print('║ Status Code: ${response.statusCode}');
      print('║ Headers: ${response.headers}');
      print('║ Response: ${response.data}');
      print('╚════════════════════════════════════════════════════════════════');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('╔════════════════════════════════════════════════════════════════');
      print('║ ❌ ERROR');
      print('╠════════════════════════════════════════════════════════════════');
      print('║ URL: ${err.requestOptions.uri}');
      print('║ Status Code: ${err.response?.statusCode}');
      print('║ Error Type: ${err.type}');
      print('║ Error Message: ${err.message}');
      print('║ Error Stacktrace: ${err.stackTrace}');
      print('║ Error Request Options: ${err.requestOptions.data}');
      if (err.response != null) {
        print('║ Response Data: ${err.response?.data}');
      }
      print('╚════════════════════════════════════════════════════════════════');
    }
    super.onError(err, handler);
  }

  Map<String, dynamic> _sanitizeHeaders(Map<String, dynamic> headers) {
    final sanitized = Map<String, dynamic>.from(headers);
    // Hide sensitive information
    // if (sanitized.containsKey('Authorization')) {
    //   sanitized['Authorization'] = 'Bearer ***';
    // }
    return sanitized;
  }

  dynamic _sanitizeBody(dynamic body) {
    if (body is Map<String, dynamic>) {
      final sanitized = Map<String, dynamic>.from(body);
      // Hide sensitive fields
      // final sensitiveFields = ['password', 'token', 'secret', 'apiKey'];
      // for (final field in sensitiveFields) {
      //   if (sanitized.containsKey(field)) {
      //     sanitized[field] = '***';
      //   }
      // }
      return sanitized;
    }
    return body;
  }
}
