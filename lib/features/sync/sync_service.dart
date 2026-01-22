import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/folder_remote_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/note_remote_datasource.dart';

enum SyncStatus { idle, syncingFolders, syncingNotes, success, failure }

const maxRetries = 3;

class SyncState {
  final SyncStatus status;
  final String? message;

  const SyncState(this.status, {this.message});

  const SyncState.idle() : this(SyncStatus.idle);

  const SyncState.syncingFolders() : this(SyncStatus.syncingFolders);

  const SyncState.syncingNotes() : this(SyncStatus.syncingNotes);

  const SyncState.success() : this(SyncStatus.success);

  const SyncState.failure(String msg) : this(SyncStatus.failure, message: msg);
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

      final unsyncedNotes = await noteLocal.fetchUnsyncedNotesCount();
      if(unsyncedFolders == 0 && unsyncedNotes == 0) {
        onStateChanged(const SyncState.success());
      }
      
    } catch (e) {
      onStateChanged(SyncState.failure(e.toString()));
      throw SyncFailure(e.toString());
    }
  }

  Future<void> _syncFolder() async {
    var unsyncedFolders = await folderLocal.fetchUnsyncedFolders();

    while (unsyncedFolders.isNotEmpty) {
      for (final folder in unsyncedFolders) {
        if (folder.retryCount >= maxRetries) continue;
        try {
          if (folder.parentId == null) {
            await folderRemote.addFolder(folder.id, folder.name, folder.parentId);
            await folderLocal.markFolderAsSynced(folder.id);
          } else {
            final parent = await folderLocal.fetchFolderById(folder.parentId!);
            if (parent!.synced) {
              await folderRemote.addFolder(folder.id, folder.name, folder.parentId);
              await folderLocal.markFolderAsSynced(folder.id);
            }
          }
        } catch (e) {
          dbPrint("Failed to sync folder: ${folder.id}", e: e);
          await folderLocal.incrementRetryCount(folder.id);
        }
      }
      unsyncedFolders = await folderLocal.fetchUnsyncedFolders();
    }
  }

  Future<void> _syncNotes() async {
    try {
      final unsyncedNotes = await noteLocal.fetchUnsyncedNotes();
      for (final note in unsyncedNotes) {
        if (note.retryCount >= maxRetries) continue;
        final parent = await folderLocal.fetchFolderById(note.folderId);
        if (parent!.synced) {
          try {
            await noteRemote.addNote(
              note.id,
              note.folderId,
              note.title,
              note.content,
            );
            await noteLocal.markNoteAsSynced(note.id);
          } catch (e) {
            dbPrint("Failed to sync note: ${note.id}", e: e);
            await noteLocal.incrementRetryCount(note.id);
          }
        }
      }
    } catch (e) {
      throw SyncFailure(e.toString());
    }
  }
}
