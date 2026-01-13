import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/error_handler.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

abstract interface class AuthRemoteDatasource {
  Future<GenericResponseModel> doesEmailExist(String email);

  Future<SendOtpResponseModel> sendOtp(String email);

  Future<AuthResponseModel> register(String email, String otp);

  Future<AuthResponseModel> login(String email, String otp);

  Future<AuthResponseModel> googleSignIn(String email);

  Future<void> logout();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient _apiClient;

  AuthRemoteDatasourceImpl(this._apiClient);

  @override
  Future<GenericResponseModel> doesEmailExist(String email) async {
    try{
      final res =  await _apiClient.post(
        ApiEndpoints.doesEmailExist,
        data: {'email': email},
      );
      dbPrint(res.data);
      return GenericResponseModelMapper.fromMap(res.data);
      } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SendOtpResponseModel> sendOtp(String email) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.sendOtp,
        data: {'email': email},
      );
      return SendOtpResponseModelMapper.fromMap(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthResponseModel> register(String email, String otp) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.register,
        data: {'email': email, 'otp': otp},
      );

      return AuthResponseModelMapper.fromMap(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> login(String email, String otp) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.login,
        data: {'email': email, 'otp': otp},
      );

      return AuthResponseModelMapper.fromMap(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel> googleSignIn(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    try {
      await _apiClient.post(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
