// import 'package:drift/drift.dart';
// import 'package:notes_bucket/core/utils/app_utils_func.dart';
// import 'package:notes_bucket/features/notes/data/models/folder.dart';
// import 'package:notes_bucket/features/notes/data/models/note.dart';
//
// import 'app_database.dart';
//
// class DatabaseHelper {
//   static final instance = DatabaseHelper._instance();
//   static AppDatabase? _db;
//
//   DatabaseHelper._instance() {
//     initDB();
//   }
//
//   factory DatabaseHelper() => instance;
//
//   Future<AppDatabase?> initDB() async {
//     try{
//       _db = AppDatabase();
//       if(_db == null) throw Exception("AppDatabase is null");
//     } catch(e,s){
//       dbPrint("Error initializing database:", e: e, st: s);
//       rethrow;
//     }
//     return _db;
//   }
//

