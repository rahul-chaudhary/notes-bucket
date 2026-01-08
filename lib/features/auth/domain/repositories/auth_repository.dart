import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
import 'package:notes_bucket/features/auth/data/models/user.dart';

abstract interface class AuthRepository {

  Future<Either<Failure, GenericResponseModel>> doesEmailExist(String email);

  Future<Either<Failure, SendOtpResponseModel>> sendOtp(String email);

  Future<Either<Failure, AuthResponseModel>> register(String email, String otp);

  Future<Either<Failure, AuthResponseModel>> login(String email, String otp);

  Future<Either<Failure, AuthResponseModel>> googleSignIn(String email);

  Future<Either<Failure, String>> refreshAccessToken();

  Future<Either<Failure, User>> fetchUser();

  Future<Either<Failure, void>> logout();

}