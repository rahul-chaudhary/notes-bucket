import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/features/sync/models/sync_status_enum.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class FolderItems extends Table {
  TextColumn get id => text()();
  TextColumn get parentID => text().nullable()();
  TextColumn get name => text().withLength(
      min: AppConstants.minFolderNameLength,
      max: AppConstants.maxFolderNameLength)();
  IntColumn get syncStatus => intEnum<SyncStatus>()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

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
  IntColumn get syncStatus => intEnum<SyncStatus>()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [FolderItems, NotesItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(folderItems, folderItems.syncStatus);
        await m.addColumn(notesItems, notesItems.syncStatus);
      }
    },
  );

  Future<void> deleteAllData() {
    return transaction(() async {
      await delete(notesItems).go();
      await delete(folderItems).go();
    });
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
