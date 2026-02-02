import 'package:dart_mappable/dart_mappable.dart';
part 'folder.mapper.dart';

@MappableClass()
class Folder with FolderMappable {
  final String id;
  final String? parentId; // null = root folder
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Folder({
    required this.id,
    this.parentId,
    required this.name,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}