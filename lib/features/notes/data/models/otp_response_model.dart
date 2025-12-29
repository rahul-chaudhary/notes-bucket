import 'package:dart_mappable/dart_mappable.dart';

part 'otp_response_model.mapper.dart';


@MappableClass()
class OtpResponseModel {
  final String message;
  final String otp;

  const OtpResponseModel({
    required this.message,
    required this.otp,
});
}