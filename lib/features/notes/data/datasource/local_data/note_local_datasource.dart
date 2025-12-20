import 'package:drift/drift.dart';
import 'package:notes_bucket/core/db/app_database.dart';
import 'package:notes_bucket/features/notes/data/models/note.dart';

abstract interface class NoteLocalDataSource {
  Future<Note> addNote(Note note);

  Future<List<Note>> fetchNotesByFolderId(int folderId);

  Future<Note?> fetchNoteById(int noteId);

  Future<void> updateNote(Note note);

  Future<void> deleteNote(int noteId);

}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final AppDatabase database;

  NoteLocalDataSourceImpl({required this.database});

  @override
  Future<Note> addNote(Note note) async {
    await database
        .into(database.notesItems)
        .insert(
      NotesItemsCompanion.insert(
        folderID: note.folderId,
        title: Value(note.title),
        content: Value(note.content),
        createdAt: Value(note.createdAt),
        updatedAt: Value(note.updatedAt),
      ),
    );
    return note;
  }

  @override
  Future<List<Note>> fetchNotesByFolderId(int folderId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )
      ..where((tbl) => tbl.folderID.equals(folderId))).get();
    final notes = queryResult
        .map(
          (row) =>
          Note(
            id: row.id,
            folderId: row.folderID,
            title: row.title,
            content: row.content,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
    )
        .toList();
    return notes;
  }

  @override
  Future<Note?> fetchNoteById(int noteId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )
      ..where((tbl) => tbl.id.equals(noteId))).getSingleOrNull();
    if (queryResult == null) return null;
    final note = Note(
      id: queryResult.id,
      folderId: queryResult.folderID,
      title: queryResult.title,
      content: queryResult.content,
      createdAt: queryResult.createdAt,
      updatedAt: queryResult.updatedAt,
    );
    return note;
  }

  @override
  Future<void> updateNote(Note note) async {
    await database
        .update(database.notesItems)
        .replace(
      NotesItemsCompanion.insert(
        id: Value(note.id),
        folderID: note.folderId,
        title: Value(note.title),
        content: Value(note.content),
        createdAt: Value(note.createdAt),
        updatedAt: Value(note.updatedAt),
      ),
    );
  }

  @override
  Future<void> deleteNote(int noteId) async {
    await (database.delete(
        database.notesItems,
    )..where((tbl) => tbl.id.equals(noteId))).go();
  }

}
