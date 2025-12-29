import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:notes_bucket/features/auth/domain/entities/user_entity.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDataSource;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<Either<Failure, bool>> doesUserExist(String email) async {
    try {
      final response = await _remoteDataSource.doesUserExist(email);
      return Right(response.data['exists']);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(String email, String otp) async {
    try {
      final response = await _remoteDataSource.register(email, otp);
      return UserEntityMapper.fromJson(response);
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(String email, String otp) async {
    try {
      final response = await _remoteDataSource.login(email, otp);

      // Save tokens
      await _secureStorage.write(
        key: ApiConstants.accessTokenKey,
        value: response['data']['accessToken'],
      );
      await _secureStorage.write(
        key: ApiConstants.refreshTokenKey,
        value: response['data']['refreshToken'],
      );

      // Parse and return user
      return UserEntityMapper.fromJson(response['data']['user']);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<Either<Failure, void>> sendOtp(String email) async {
    try {
      await _remoteDataSource.sendOtp(email);
    } catch (e) {
      throw Exception('OTP sending failed: $e');
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _secureStorage.delete(key: ApiConstants.accessTokenKey);
      await _secureStorage.delete(key: ApiConstants.refreshTokenKey);
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }
}