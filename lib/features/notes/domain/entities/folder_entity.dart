import 'package:dart_mappable/dart_mappable.dart';

part 'folder_entity.mapper.dart';

@MappableClass()
class FolderEntity with FolderEntityMappable {
  final String id;
  final String? parentId; // null = root folder
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FolderEntity({
    required this.id,
    this.parentId,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });
}