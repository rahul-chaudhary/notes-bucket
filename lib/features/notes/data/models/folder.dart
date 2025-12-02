import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/folder_entity.dart';
part 'folder.mapper.dart';

@MappableClass()
class Folder with FolderMappable {
  final int id;
  final int? parentId; // null = root folder
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
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
  //fromEntity method
  factory Folder.fromEntity(FolderEntity entity) {
    return Folder(
      id: entity.id,
      parentId: entity.parentId,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}