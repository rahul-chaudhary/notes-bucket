import 'package:dart_mappable/dart_mappable.dart';
part 'note.mapper.dart';

@MappableClass()
class Note with NoteMappable {
  final String id;
  final String folderId;
  final String? title;
  final String? content;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Note({
    required this.id,
    required this.folderId,
    required this.title,
    required this.content,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
}