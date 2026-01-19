import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/folder_remote_datasource.dart';
import 'package:notes_bucket/features/notes/data/datasource/remote_datasources/note_remote_datasource.dart';

class SyncService {
  final NoteRemoteDatasource noteRemote;
  final NoteLocalDataSource noteLocal;
  final FolderRemoteDatasource folderRemote;
  final FolderLocalDataSource folderLocal;


  SyncService({required this.noteRemote, required this.noteLocal, required this.folderRemote, required this.folderLocal});

  Future<void> start() async {
    await _syncFolder();
    final unsyncedFolders = await folderLocal.fetchUnsyncedFoldersCount();
    if(unsyncedFolders == 0) _syncNotes();
  }

  Future<void> _syncFolder() async {
    try{
      final unsyncedFolders = await folderLocal.fetchUnsyncedFolders();
      for(final folder in unsyncedFolders){
        await folderRemote.addFolder(folder.id, folder.name, folder.parentId);
          folderLocal.markFolderAsSynced(folder.id);
      }
    } catch(e){
      throw SyncFailure('Failed to sync folders. Error: ${e.toString()}');
    }
  }

  Future<void> _syncNotes() async {
    try{
      final unsyncedNotes = await noteLocal.fetchUnsyncedNotes();
      for(final note in unsyncedNotes){
        await noteRemote.addNote(note.id, note.folderId, note.title, note.content);
        noteLocal.markNoteAsSynced(note.id);
      }
    } catch(e){
      throw SyncFailure('Failed to sync notes. Error: ${e.toString()}');
    }
  }
}
