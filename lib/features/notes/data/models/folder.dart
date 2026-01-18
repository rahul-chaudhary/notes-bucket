import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/folder_entity.dart';
part 'folder.mapper.dart';

@MappableClass()
class Folder with FolderMappable {
  final String id;
  final String? parentId; // null = root folder
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Folder({
    required this.id,
    this.parentId,
    required this.name,
    required this.createdAt,
    this.updatedAt,
  });

  //toEntity method
  FolderEntity toEntity() {
    return FolderEntity(
      id: id,
      parentId: parentId,
      name: name,
      synced: true,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}