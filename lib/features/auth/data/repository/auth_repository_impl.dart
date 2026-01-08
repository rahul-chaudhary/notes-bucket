import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
import 'package:notes_bucket/features/auth/data/models/user.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorageHelper _secureStorageHelper;

  AuthRepositoryImpl(this._remoteDatasource, this._secureStorageHelper);

  @override
  Future<Either<Failure, GenericResponseModel>> doesEmailExist(String email) async {
    try {
      final response = await _remoteDatasource.doesEmailExist(email);
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
      final response = await _remoteDatasource.sendOtp(email);
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
      final response = await _remoteDatasource.login(email, otp);
      await _saveAuthToStorage(response);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(String email, String otp) async {
    try {
      final response = await _remoteDatasource.register(email, otp);
      await _saveAuthToStorage(response);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> _saveAuthToStorage(AuthResponseModel authResponse) async {
    final ssModel = SecureStorageModel(
      isFirstLaunch: false,
      authResponseModel: authResponse,
    );
    await _secureStorageHelper.save(SecureStorageKeys.secureStorageKey,ssModel);
  }

  @override
  Future<Either<Failure, AuthResponseModel>> googleSignIn(String email) async {
    try {
      final response = await _remoteDatasource.googleSignIn(email);
      return Right(response);
      } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> refreshAccessToken() async {
    try {
      final accessToken = await _remoteDatasource.refreshAccessToken();
      if (accessToken == null) throw 'Access token is null';
      return Right(accessToken);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> fetchUser() async {
    try {
      final response = await _remoteDatasource.fetchUser();
      return Right(response);
  } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDatasource.logout();
      await _secureStorageHelper.deleteAll();
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
    catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}