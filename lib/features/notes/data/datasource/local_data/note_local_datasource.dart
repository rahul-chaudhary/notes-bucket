import 'package:drift/drift.dart';
import 'package:notes_bucket/core/db/app_database.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';

abstract interface class NoteLocalDataSource {
  Future<NoteEntity> addNote(NoteEntity note);

  Future<List<NoteEntity>> fetchNotesByFolderId(int folderId);

  Future<NoteEntity?> fetchNoteById(int noteId);

  Future<NoteEntity> updateNote(NoteEntity note);

  Future<void> deleteNote(int noteId);

  Future<List<NoteEntity>> fetchAllNotes({required int limit,required int offset});

  Future<int> fetchNotesCountByFolderId(int folderId);

  Future<NoteEntity> markNoteAsSynced(int noteId);

  Future<List<NoteEntity>> fetchUnsyncedNotes();

}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final AppDatabase database;

  NoteLocalDataSourceImpl({required this.database});

  @override
  Future<NoteEntity> addNote(NoteEntity note) async {
    final id = await database
        .into(database.notesItems)
        .insert(
      NotesItemsCompanion.insert(
        folderID: note.folderId,
        title: Value(note.title),
        content: Value(note.content),
        synced: note.synced,
        createdAt: Value(note.createdAt),
        updatedAt: Value(note.updatedAt),
      ),
    );
    final n = await fetchNoteById(id);
    return n!;
  }

  @override
  Future<List<NoteEntity>> fetchNotesByFolderId(int folderId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )
      ..where((tbl) => tbl.folderID.equals(folderId))).get();
    final notes = queryResult
        .map(
          (row) =>
          NoteEntity(
            id: row.id,
            folderId: row.folderID,
            title: row.title,
            content: row.content,
            synced: row.synced,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
    )
        .toList();
    return notes;
  }

  @override
  Future<NoteEntity?> fetchNoteById(int noteId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )
      ..where((tbl) => tbl.id.equals(noteId))).getSingleOrNull();
    if (queryResult == null) return null;
    final note = NoteEntity(
      id: queryResult.id,
      folderId: queryResult.folderID,
      title: queryResult.title,
      content: queryResult.content,
      synced: queryResult.synced,
      createdAt: queryResult.createdAt,
      updatedAt: queryResult.updatedAt,
    );
    return note;
  }

  @override
  Future<NoteEntity> updateNote(NoteEntity note) async {
     await database
        .update(database.notesItems)
        .replace(
      NotesItemsCompanion.insert(
        id: Value(note.id),
        folderID: note.folderId,
        title: Value(note.title),
        content: Value(note.content),
        synced: note.synced,
        createdAt: Value(note.createdAt),
        updatedAt: Value(note.updatedAt),
      ),
    );
     final n = await fetchNoteById(note.id);
     return n!;
  }

  @override
  Future<void> deleteNote(int noteId) async {
    await (database.delete(
        database.notesItems,
    )..where((tbl) => tbl.id.equals(noteId))).go();
  }

  @override
  Future<List<NoteEntity>> fetchAllNotes({required int limit,required int offset}) async {
    final queryResult = await (database.select(
      database.notesItems,
    )..limit(limit, offset: offset)).get();

    final notes = queryResult.map((row) => NoteEntity(
      id: row.id,
      folderId: row.folderID,
      title: row.title,
      content: row.content,
      synced: row.synced,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    )).toList();

    return notes;
  }

  @override
  Future<int> fetchNotesCountByFolderId(int folderId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )..where((tbl) => tbl.folderID.equals(folderId))).get();
    return queryResult.length;
  }

  @override
  Future<NoteEntity> markNoteAsSynced(int noteId) async {
     await (database.update(database.notesItems)
      ..where((tbl) => tbl.id.equals(noteId)))
        .write(const NotesItemsCompanion(synced: Value(true)));

    final n = await fetchNoteById(noteId);
    return n!;
  }

  @override
  Future<List<NoteEntity>> fetchUnsyncedNotes() async {
    final queryResult = await (database.select(database.notesItems)
      ..where((tbl) => tbl.synced.equals(false))).get();
    return queryResult.map((row) => NoteEntity(
      id: row.id,
      folderId: row.folderID,
      title: row.title,
      content: row.content,
      synced: row.synced,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    )).toList();
  }

}
