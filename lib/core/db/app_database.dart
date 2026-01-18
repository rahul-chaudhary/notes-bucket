import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class FolderItems extends Table {
  TextColumn get id => text()();
  TextColumn get parentID => text().nullable()();
  TextColumn get name => text().withLength(
      min: AppConstants.minFolderNameLength,
      max: AppConstants.maxFolderNameLength)();
  BoolColumn get synced => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class NotesItems extends Table {
  TextColumn get id => text()();
  TextColumn get folderID => text().references(FolderItems, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text().nullable().withLength(
      min: AppConstants.minNoteTitleLength,
      max: AppConstants.maxNoteTitleLength)();
  TextColumn get content => text().nullable()();
  BoolColumn get synced => boolean()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FolderItems, NotesItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
