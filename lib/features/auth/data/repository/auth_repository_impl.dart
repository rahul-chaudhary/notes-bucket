import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/constants/api_constants.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDataSource;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<Either<Failure, GenericResponseModel>> doesEmailExist(String email) async {
    try {
      final response = await _remoteDataSource.doesEmailExist(email);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SendOtpResponseModel>> sendOtp(String email) async {
    try {
      final response = await _remoteDataSource.sendOtp(email);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(String email, String otp) async {
    try {
      final response = await _remoteDataSource.register(email, otp);

      // Save tokens
      await _secureStorage.write(
        key: ApiConstants.accessTokenKey,
        value: response.accessToken,
      );
      await _secureStorage.write(
        key: ApiConstants.refreshTokenKey,
        value: response.refreshToken,
      );

      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> login(String email, String otp) async {
    try {
      final response = await _remoteDataSource.login(email, otp);

      // Save tokens
      await _secureStorage.write(
        key: ApiConstants.accessTokenKey,
        value: response.accessToken,
      );
      await _secureStorage.write(
        key: ApiConstants.refreshTokenKey,
        value: response.refreshToken,
      );

      // Parse and return user
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> googleSignIn(String email) async {
    try {
      final response = await _remoteDataSource.googleSignIn(email);
      return Right(response);
      } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    try {
      final response = await _remoteDataSource.refreshToken();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _secureStorage.delete(key: ApiConstants.accessTokenKey);
      await _secureStorage.delete(key: ApiConstants.refreshTokenKey);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}