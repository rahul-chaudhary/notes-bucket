import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/user/data/datasource/user_remote_datasource.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';
import 'package:notes_bucket/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDatasource _remoteDatasource;

  UserRepositoryImpl(this._remoteDatasource);

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
  Future<Either<Failure, void>> activateUserSubscription() async {
    try {
      await _remoteDatasource.activateUserSubscription();
      return const Right(null);
  } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}