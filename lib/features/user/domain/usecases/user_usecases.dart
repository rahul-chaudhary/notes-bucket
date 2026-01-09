import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';
import 'package:notes_bucket/features/user/domain/repository/user_repository.dart';

class FetchUser implements UseCase<User, void> {
  final UserRepository _userRepository;

  FetchUser(this._userRepository);

  @override
  Future<Either<Failure, User>> call(void params) =>
      _userRepository.fetchUser();
}

class ActivateUserSubscription implements UseCase<void, void> {
  final UserRepository _userRepository;

  ActivateUserSubscription(this._userRepository);

  @override
  Future<Either<Failure, void>> call(void params) =>
      _userRepository.activateUserSubscription();
}
