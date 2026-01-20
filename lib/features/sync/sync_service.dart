import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/folder_remote_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/note_remote_datasource.dart';

enum SyncStatus {
  idle,
  syncingFolders,
  syncingNotes,
  success,
  failure,
}
class SyncState {
  final SyncStatus status;
  final String? message;

  const SyncState(this.status, {this.message});

  const SyncState.idle() : this(SyncStatus.idle);
  const SyncState.syncingFolders() : this(SyncStatus.syncingFolders);
  const SyncState.syncingNotes() : this(SyncStatus.syncingNotes);
  const SyncState.success() : this(SyncStatus.success);
  const SyncState.failure(String msg)
      : this(SyncStatus.failure, message: msg);
}


class SyncService {
  final NoteRemoteDatasource noteRemote;
  final NoteLocalDataSource noteLocal;
  final FolderRemoteDatasource folderRemote;
  final FolderLocalDataSource folderLocal;

  final void Function(SyncState) onStateChanged;

  SyncService({
    required this.noteRemote,
    required this.noteLocal,
    required this.folderRemote,
    required this.folderLocal,
    required this.onStateChanged,
  });

  Future<void> start() async {
    try {
      onStateChanged(const SyncState.syncingFolders());
      await _syncFolder();

      final unsyncedFolders = await folderLocal.fetchUnsyncedFoldersCount();
      if (unsyncedFolders == 0) {
        onStateChanged(const SyncState.syncingNotes());
        await _syncNotes();
      }

      onStateChanged(const SyncState.success());
    } catch (e) {
      onStateChanged(SyncState.failure(e.toString()));
      rethrow;
    }
  }

  Future<void> _syncFolder() async {
    final unsyncedFolders = await folderLocal.fetchUnsyncedFolders();
    for (final folder in unsyncedFolders) {
      await folderRemote.addFolder(folder.id, folder.name, folder.parentId);
      await folderLocal.markFolderAsSynced(folder.id);
    }
  }

  Future<void> _syncNotes() async {
    final unsyncedNotes = await noteLocal.fetchUnsyncedNotes();
    for (final note in unsyncedNotes) {
      await noteRemote.addNote(
        note.id,
        note.folderId,
        note.title,
        note.content,
      );
      await noteLocal.markNoteAsSynced(note.id);
    }
  }
}

