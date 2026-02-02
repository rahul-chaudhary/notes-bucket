import 'package:dart_mappable/dart_mappable.dart';

part 'note_entity.mapper.dart';

@MappableClass()
class NoteEntity with NoteEntityMappable {
  final String id;
  final String folderId;
  final String? title;
  final String? content;
  final bool synced;
  final int retryCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  NoteEntity({
    required this.id,
    required this.folderId,
    required this.title,
    required this.content,
    required this.synced,
    required this.retryCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
