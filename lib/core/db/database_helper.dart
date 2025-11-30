import 'package:drift/drift.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/models/note.dart';

import 'app_database.dart';

class DatabaseHelper {
  static final instance = DatabaseHelper._instance();
  static AppDatabase? _db;

  DatabaseHelper._instance() {
    initDB();
  }

  factory DatabaseHelper() => instance;

  Future<AppDatabase?> initDB() async {
    try{
      _db = AppDatabase();
      if(_db == null) throw Exception("AppDatabase is null");
    } catch(e,s){
      dbPrint("Error initializing database:", e: e, st: s);
      rethrow;
    }
    return _db;
  }

  Future<Note> add(Note note) async {
    await _db!.into(_db!.notesItems).insert(
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


  Future<List<Note>> fetchNotesByFolderId(int folderId) async {
    final queryResult = await (_db!.select(_db!.notesItems)
          ..where((tbl) => tbl.folderID.equals(folderId)))
        .get();
    final notes = queryResult.map((row) => Note(
      id: row.id,
      folderId: row.folderID,
      title: row.title,
      content: row.content,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    )).toList();
    return notes;
  }
}
