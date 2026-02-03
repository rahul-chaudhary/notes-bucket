import 'package:dart_mappable/dart_mappable.dart';
import 'package:notes_bucket/features/sync/models/sync_status_enum.dart';

part 'folder_entity.mapper.dart';

@MappableClass()
class FolderEntity with FolderEntityMappable {
  final String id;
  final String? parentId; // null = root folder
  final String name;
  final SyncStatus syncStatus;
  final int retryCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  FolderEntity({
    required this.id,
    this.parentId,
    required this.name,
    required this.syncStatus,
    required this.retryCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
