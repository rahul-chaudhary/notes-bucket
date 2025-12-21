import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class FolderItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentID => integer().nullable()();
  TextColumn get name => text().withLength(
      min: AppConstants.minFolderNameLength,
      max: AppConstants.maxFolderNameLength)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class NotesItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get folderID => integer().references(FolderItems, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text().nullable().withLength(
      min: AppConstants.minNoteTitleLength,
      max: AppConstants.maxNoteTitleLength)();
  TextColumn get content => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
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