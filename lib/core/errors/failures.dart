import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class DatabaseFailure extends Failure {
  final StackTrace? stackTrace;
  const DatabaseFailure(super.message, this.stackTrace);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}