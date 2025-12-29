import 'package:dart_mappable/dart_mappable.dart';

part 'generic_response_model.mapper.dart';

@MappableClass()
class GenericResponseModel {
  final bool status;
  final String message;

  const GenericResponseModel({
    required this.status,
    required this.message,
  });
}