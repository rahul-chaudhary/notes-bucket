import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/error_handler.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

abstract interface class UserRemoteDatasource {
  Future<User> fetchUser();

  Future<void> activateUserSubscription();

}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final ApiClient _apiClient;

  UserRemoteDatasourceImpl(this._apiClient);

  @override
  Future<User> fetchUser() async {
    try {
      final response = await _apiClient.get(ApiEndpoints.userDetail);
      return UserMapper.fromMap(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> activateUserSubscription() async {
    try{
      await _apiClient.post(ApiEndpoints.activateUserSubscription);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}