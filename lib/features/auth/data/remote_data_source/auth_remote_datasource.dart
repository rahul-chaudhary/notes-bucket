import 'package:dio/dio.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/api_endpoints.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';

abstract interface class AuthRemoteDatasource {
  Future<GenericResponseModel> doesUserExist(String email);

  Future<SendOtpResponseModel> sendOtp(String email);

  Future<AuthResponseModel> register(String email, String otp);

  Future<AuthResponseModel> login(String email, String otp);

  Future<AuthResponseModel> googleSignIn(String email);

  Future<String> refreshToken();

  Future<void> logout();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient _apiClient;

  AuthRemoteDatasourceImpl(this._apiClient);

  @override
  Future<GenericResponseModel> doesUserExist(String email) {
    // TODO: implement doesUserExist
    throw UnimplementedError();
  }

  @override
  Future<SendOtpResponseModel> sendOtp(String email) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.sendOtp,
        data: {'email': email},
      );
      return SendOtpResponseModelMapper.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponseModel> register(String email, String otp) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: {'email': email, 'otp': otp},
      );

      return AuthResponseModelMapper.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponseModel> login(String email, String otp) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: {'email': email, 'otp': otp},
      );

      return AuthResponseModelMapper.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponseModel> googleSignIn(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<String> refreshToken() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {
      await _apiClient.post(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    if (error.response != null) {
      final message = error.response?.data['message'] ?? error.error.toString();
      return Exception(message);
    }
    return Exception(error.error.toString());
  }
}
