import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params folderParentId);
}