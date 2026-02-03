import 'package:dart_mappable/dart_mappable.dart';
part 'sync_status_enum.mapper.dart';

@MappableEnum()
enum SyncStatus {
  synced,        // clean, matches server
  pendingCreate, // created locally, never on server
  pendingUpdate, // exists on server but changed locally
  pendingDelete, // deleted locally, needs server delete
  conflict,      // needs resolution
}