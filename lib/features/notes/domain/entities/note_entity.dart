import 'package:dart_mappable/dart_mappable.dart';
import 'package:notes_bucket/features/sync/models/sync_status_enum.dart';

part 'note_entity.mapper.dart';

@MappableClass()
class NoteEntity with NoteEntityMappable {
  final String id;
  final String folderId;
  final String? title;
  final String? content;
  final SyncStatus syncStatus;
  final int retryCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  NoteEntity({
    required this.id,
    required this.folderId,
    required this.title,
    required this.content,
    required this.syncStatus,
    required this.retryCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
