import 'package:notes_bucket/features/notes/data/datasource/local_data/database_helper.dart';

import '../models/note.dart';

abstract class NoteLocalDataSource {
  Future<Note> add(Note note);
  Future<List<Note>> fetchNotes();
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Future<Note> add(Note note) => _databaseHelper.add(note);

  @override
  Future<List<Note>> fetchNotes() => _databaseHelper.fetchNotes();
}