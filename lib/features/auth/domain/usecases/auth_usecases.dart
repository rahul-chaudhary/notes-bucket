import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/auth/domain/repositories/auth_repository.dart';

class DoesUserExist implements UseCase<bool, String> {
  final AuthRepository repository;

  DoesUserExist(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    final res = await repository.doesUserExist(params);
    return res.fold(
            (l) => Left(l),
            (r) => Right(r.status));
  }
}



class SendOtp implements UseCase<String, String> {
  final AuthRepository repository;

  SendOtp(this.repository);

  @override
  Future<Either<Failure, String>> call(String params) async {
    final res = await repository.sendOtp(params);
    return res.fold(
            (l) => Left(l),
            (r) => Right(r.message));

  }
}