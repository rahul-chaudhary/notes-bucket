import 'package:dart_mappable/dart_mappable.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

part 'response_models.mapper.dart';

@MappableClass()
class GenericResponseModel with GenericResponseModelMappable {
  final bool status;
  final String message;

  const GenericResponseModel({
    required this.status,
    required this.message,
  });
}

@MappableClass()
class SendOtpResponseModel with SendOtpResponseModelMappable {
  final String otp;
  final String message;

  const SendOtpResponseModel({
    required this.otp,
    required this.message,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class AuthResponseModel with AuthResponseModelMappable {
  final String message;
  final String? accessToken;
  final String? refreshToken;
  final User user;

  const AuthResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
}