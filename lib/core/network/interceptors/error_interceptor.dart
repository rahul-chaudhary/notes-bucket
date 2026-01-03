import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can log to crash reporting service here (e.g., Firebase Crashlytics)
    // FirebaseCrashlytics.instance.recordError(err, err.stackTrace);

    super.onError(err, handler);
  }
}
