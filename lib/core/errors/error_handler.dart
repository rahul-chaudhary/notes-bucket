import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/failures.dart';

abstract final class DioExceptionHandler {

  static Failure handleError(DioException error) {

    if (error.response != null) {
      final data = error.response?.data;
      // Check if data is a Map before accessing keys
      if (data is Map<String, dynamic>) {
        final message = data['message'] ?? data['error'] ?? error.message;
        return UnexpectedFailure(message);
      }
      // If data is a String or other type, use it directly
      return UnexpectedFailure(data.toString());
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure('Connection timeout. Please check your internet connection.');

      case DioExceptionType.badResponse:
        return BadResponseFailure(_handleStatusCode(error.response?.statusCode));

      case DioExceptionType.cancel:
        return CancelledFailure('Request was cancelled.');

      case DioExceptionType.connectionError:
        return ConnectionFailure('No internet connection. Please check your network.');

      case DioExceptionType.unknown:
        return UnknownFailure('An unexpected error occurred. Please try again.');

      default:
        return UnexpectedFailure('Something went wrong. Please try again.');
    }
  }

  static String _handleStatusCode(int? statusCode) {

    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input. Status code: $statusCode';
      case 401:
        return 'Unauthorized. Please login again. Status code: $statusCode';
      case 403:
        return 'Access forbidden. Status code: $statusCode';
      case 404:
        return 'Resource not found. Status code: $statusCode';
      case 405:
        return 'Method not allowed. Status code: $statusCode';
      case 409:
        return 'Conflict. Status code: $statusCode';
      case 500:
        return 'Server error. Please try again later. Status code: $statusCode';
      case 503:
        return 'Service unavailable. Please try again later. Status code: $statusCode';
      default:
        return 'Request failed with status code: $statusCode';
    }
  }
}