import 'package:dart_mappable/dart_mappable.dart';

part 'folder_entity.mapper.dart';

@MappableClass()
class FolderEntity with FolderEntityMappable {
  final String id;
  final String? parentId; // null = root folder
  final String name;
  final bool synced;
  final int retryCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  FolderEntity({
    required this.id,
    this.parentId,
    required this.name,
    required this.synced,
    required this.retryCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
