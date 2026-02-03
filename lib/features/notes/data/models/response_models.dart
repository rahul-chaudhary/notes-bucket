import 'package:dart_mappable/dart_mappable.dart';
import 'folder.dart';

part 'response_models.mapper.dart';

@MappableClass()
class BulkFolderResModel with BulkFolderResModelMappable {
  final List<Folder>? folders;
  @MappableField(key:'failed')
  final List<FailedFolderModel>? failedFolders;

  BulkFolderResModel({required this.folders, this.failedFolders});
}


@MappableClass()
class FailedFolderModel with FailedFolderModelMappable {
  final String id;
  final String error;

  FailedFolderModel({required this.id, required this.error});
}