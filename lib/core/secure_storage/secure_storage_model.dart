import 'package:dart_mappable/dart_mappable.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';

part 'secure_storage_model.mapper.dart';

@MappableClass()
class SecureStorageModel with SecureStorageModelMappable {
  final bool isFirstLaunch;
  final AuthResponseModel? authResponseModel;

  const SecureStorageModel({
    required this.isFirstLaunch,
    required this.authResponseModel,
  });
}
