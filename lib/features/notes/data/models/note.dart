import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/note_entity.dart';
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

  Note({
    required this.id,
    required this.folderId,
    required this.title,
    required this.content,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  //toEntity method
  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      folderId: folderId,
      title: title,
      content: content,
      synced: true,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}