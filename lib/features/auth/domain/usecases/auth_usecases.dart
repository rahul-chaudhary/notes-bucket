import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/auth/data/models/user.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';
import 'package:notes_bucket/features/auth/presentation/widgets/common_auth_widget.dart';

class DoesEmailExist implements UseCase<bool, String> {
  final AuthRepository repository;

  DoesEmailExist(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    final res = await repository.doesEmailExist(params);
    return res.fold((l) => Left(l), (r) => Right(r.status));
  }
}

class SendOtp implements UseCase<String, String> {
  final AuthRepository repository;

  SendOtp(this.repository);

  @override
  Future<Either<Failure, String>> call(String params) async {
    final res = await repository.sendOtp(params);
    return res.fold((l) => Left(l), (r) => Right(r.message));
  }
}

class AuthParams {
  final AuthType authType;
  final String email;
  final String otp;

  AuthParams({required this.authType, required this.email, required this.otp});
}

class Authentication implements UseCase<User, AuthParams> {
  final SecureStorageHelper secureStorageHelper;
  final AuthRepository repository;

  Authentication(this.secureStorageHelper, this.repository);

  @override
  Future<Either<Failure, User>> call(AuthParams params) async {
    final res = params.authType == AuthType.signIn
        ? await repository.login(params.email, params.otp)
        : await repository.register(params.email, params.otp);

    return res.fold((l) => Left(l), (r) => Right(r.user));
  }
}
