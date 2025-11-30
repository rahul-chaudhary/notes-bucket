
import 'package:notes_bucket/core/db/database_helper.dart';

import '../models/note.dart';

abstract interface class NoteLocalDataSource {
  Future<Note> add(Note note);

  Future<List<Note>> fetchNotesByFolderId(int folderId);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final DatabaseHelper databaseHelper;

  NoteLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<Note> add(Note note) => databaseHelper.add(note);

  @override
  Future<List<Note>> fetchNotesByFolderId(int folderId) => databaseHelper.fetchNotesByFolderId(folderId);

}
