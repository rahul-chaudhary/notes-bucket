import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {

  Future<Either<Failure, bool>> doesUserExist(String email);

  Future<Either<Failure, UserEntity>> login(String email, String otp);

  Future<Either<Failure, UserEntity>> register(String email, String otp);

  Future<Either<Failure, void>> sendOtp(String email);

  Future<Either<Failure, void>> logout();

}