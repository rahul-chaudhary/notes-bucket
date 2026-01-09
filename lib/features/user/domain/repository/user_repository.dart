import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

abstract interface class UserRepository {

  Future<Either<Failure, User>> fetchUser();

  Future<Either<Failure, void>> activateUserSubscription();

}