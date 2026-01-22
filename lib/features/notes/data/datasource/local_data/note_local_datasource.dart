import 'package:drift/drift.dart';
import 'package:notes_bucket/core/db/app_database.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';

abstract interface class NoteLocalDataSource {
  Future<NoteEntity> addNote(AddNoteParams params);

  Future<List<NoteEntity>> fetchNotesByFolderId(String folderId);

  Future<NoteEntity?> fetchNoteById(String noteId);

  Future<NoteEntity> updateNote(NoteEntity note);

  Future<void> deleteNote(String noteId);

  Future<List<NoteEntity>> fetchAllNotes({required int limit,required int offset});

  Future<int> fetchNotesCountByFolderId(String folderId);

  Future<NoteEntity> markNoteAsSynced(String noteId);

  Future<List<NoteEntity>> fetchUnsyncedNotes();

  Future<int> fetchUnsyncedNotesCount();

  Future<void> incrementRetryCount(String noteId);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final AppDatabase database;

  NoteLocalDataSourceImpl({required this.database});

  @override
  Future<NoteEntity> addNote(AddNoteParams params) async {
    final id = generateId();
     await database
        .into(database.notesItems)
        .insert(
      NotesItemsCompanion.insert(
        id: id,
        folderID: params.folderId,
        title: Value(params.title),
        content: Value(params.content),
        synced: false,
        createdAt: Value(null),
        updatedAt: Value(null),
      ),
    );
    final n = await fetchNoteById(id);
    if (n == null) throw DatabaseFailure('Fail to add note', null);
    return n!;
  }

  @override
  Future<List<NoteEntity>> fetchNotesByFolderId(String folderId) async {
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
            retryCount: row.retryCount,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
    )
        .toList();
    return notes;
  }

  @override
  Future<NoteEntity?> fetchNoteById(String noteId) async {
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
      retryCount: queryResult.retryCount,
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
        id: note.id,
        folderID: note.folderId,
        title: Value(note.title),
        content: Value(note.content),
        synced: note.synced,
        retryCount: Value(note.retryCount),
        createdAt: Value(note.createdAt),
        updatedAt: Value(note.updatedAt),
      ),
    );
     final n = await fetchNoteById(note.id);
     return n!;
  }

  @override
  Future<void> deleteNote(String noteId) async {
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
      retryCount: row.retryCount,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    )).toList();

    return notes;
  }

  @override
  Future<int> fetchNotesCountByFolderId(String folderId) async {
    final queryResult = await (database.select(
      database.notesItems,
    )..where((tbl) => tbl.folderID.equals(folderId))).get();
    return queryResult.length;
  }

  @override
  Future<NoteEntity> markNoteAsSynced(String noteId) async {
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
      retryCount: row.retryCount,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    )).toList();
  }

  @override
  Future<int> fetchUnsyncedNotesCount() async {
    final countExp = countAll();

    final row = await (database.selectOnly(database.notesItems)
      ..addColumns([countExp])
      ..where(database.notesItems.synced.equals(false)))
        .getSingleOrNull();

    return row?.read(countExp) ?? 0;
  }

  @override
  Future<void> incrementRetryCount(String noteId) async {
    final note = await fetchNoteById(noteId);
    if (note == null) return;
    await (database.update(database.notesItems)..where((tbl) => tbl.id.equals(noteId))).write(
      NotesItemsCompanion(retryCount: Value(note.retryCount + 1)),
    );
  }
}
