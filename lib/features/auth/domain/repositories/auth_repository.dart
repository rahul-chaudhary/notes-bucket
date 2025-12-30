import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
import 'package:notes_bucket/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {

  Future<Either<Failure, GenericResponseModel>> doesUserExist(String email);

  Future<Either<Failure, AuthResponseModel>> login(String email, String otp);

  Future<Either<Failure, AuthResponseModel>> register(String email, String otp);

  Future<Either<Failure, SendOtpResponseModel>> sendOtp(String email);

  Future<Either<Failure, void>> logout();

}