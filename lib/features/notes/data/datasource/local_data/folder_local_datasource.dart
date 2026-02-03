import 'package:drift/drift.dart';
import 'package:notes_bucket/core/db/app_database.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/sync/models/sync_status_enum.dart';

abstract interface class FolderLocalDataSource {
  Future<FolderEntity> createFolder(String name, String? parentId);

  Future<List<FolderEntity>> fetchRootFolders({
    required int limit,
    required int offset,
  });

  Future<List<FolderEntity>> fetchFoldersByParentId({
    required String? parentId,
    required int limit,
    required int offset,
  });

  Future<void> renameFolder(String folderId, String newName);

  Future<void> deleteFolder(String folderId);

  Future<bool> folderExists(String? folderParentID, String folderName);

  Future<FolderEntity?> fetchFolderById(String folderId);

  Future<int> fetchFoldersCountByFolderId({required String folderId});

  Future<List<FolderEntity>> fetchFoldersBySyncStatus(SyncStatus status);

  Future<int> getFolderCountBySyncStatus(SyncStatus syncStatus);

  Future<FolderEntity> updateSyncStatus(String folderId, SyncStatus status);

  Future<void> incrementRetryCount(String folderId);
}

class FolderLocalDataSourceImpl implements FolderLocalDataSource {
  final AppDatabase database;

  FolderLocalDataSourceImpl({required this.database});

  @override
  Future<FolderEntity> createFolder(String name, String? parentId) async {
    final folderId = generateId();

    await database
        .into(database.folderItems)
        .insert(
          FolderItemsCompanion.insert(
            id: folderId,
            parentID: Value(parentId),
            name: name,
            syncStatus: SyncStatus.pendingCreate,
            retryCount: Value(0),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );

    final folder = await fetchFolderById(folderId);

    if (folder == null) {
      throw DatabaseFailure('Failed to create folder', null);
    }

    return folder;
  }

  @override
  Future<List<FolderEntity>> fetchRootFolders({
    required int limit,
    required int offset,
  }) async {
    final queryResult =
        await (database.select(database.folderItems)
              ..where((tbl) => tbl.parentID.isNull())
              ..limit(limit, offset: offset))
            .get();
    final folders = queryResult
        .map(
          (row) => FolderEntity(
            id: row.id,
            parentId: row.parentID,
            name: row.name,
            retryCount: row.retryCount,
            syncStatus: row.syncStatus,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
    return folders;
  }

  @override
  Future<List<FolderEntity>> fetchFoldersByParentId({
    required String? parentId,
    required int limit,
    required int offset,
  }) async {
    if (parentId == null) {
      return fetchRootFolders(limit: limit, offset: offset);
    }
    final queryResult = await (database.select(
      database.folderItems,
    )..where((tbl) => tbl.parentID.equals(parentId))).get();
    final folders = queryResult
        .map(
          (row) => FolderEntity(
            id: row.id,
            parentId: row.parentID,
            name: row.name,
            syncStatus: row.syncStatus,
            retryCount: row.retryCount,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
    return folders;
  }

  @override
  Future<void> renameFolder(String folderId, String newName) async {
    await (database.update(
      database.folderItems,
    )..where((tbl) => tbl.id.equals(folderId))).write(
      FolderItemsCompanion(
        name: Value(newName),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteFolder(String folderId) async {
    await (database.delete(
      database.folderItems,
    )..where((tbl) => tbl.id.equals(folderId))).go();
  }

  @override
  Future<bool> folderExists(String? folderParentID, String folderName) async {
    final row =
        await (database.select(database.folderItems)
              ..where((tbl) => tbl.name.equals(folderName))
              ..where(
                (tbl) => folderParentID == null
                    ? tbl.parentID.isNull()
                    : tbl.parentID.equals(folderParentID),
              ))
            .getSingleOrNull();

    return row != null;
  }

  @override
  Future<FolderEntity?> fetchFolderById(String folderId) async {
    final row = await (database.select(
      database.folderItems,
    )..where((tbl) => tbl.id.equals(folderId))).getSingleOrNull();

    if (row == null) return null;

    return FolderEntity(
      id: row.id,
      parentId: row.parentID,
      name: row.name,
      syncStatus: row.syncStatus,
      retryCount: row.retryCount,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  @override
  Future<int> fetchFoldersCountByFolderId({required String folderId}) async {
    final queryResult = await (database.select(
      database.folderItems,
    )..where((tbl) => tbl.parentID.equals(folderId))).get();
    return queryResult.length;
  }

  @override
  Future<List<FolderEntity>> fetchFoldersBySyncStatus(SyncStatus status) async {
    final queryResult = await (database.select(
      database.folderItems,
    )..where((tbl) => tbl.syncStatus.equals(status.index))).get();

    final folders = queryResult
        .map(
          (row) => FolderEntity(
            id: row.id,
            parentId: row.parentID,
            name: row.name,
            syncStatus: row.syncStatus,
            retryCount: row.retryCount,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();

    return folders;
  }

  @override
  Future<FolderEntity> updateSyncStatus(
    String folderId,
    SyncStatus status,
  ) async {
    await (database.update(database.folderItems)
          ..where((tbl) => tbl.id.equals(folderId)))
        .write(FolderItemsCompanion(syncStatus: Value(status)));
    final folder = await fetchFolderById(folderId);
    return folder!;
  }

  @override
  Future<int> getFolderCountBySyncStatus(SyncStatus syncStatus) async {
    final countExp = countAll();

    final row =
        await (database.selectOnly(database.folderItems)
              ..addColumns([countExp])
              ..where(database.folderItems.syncStatus.equals(syncStatus.index)))
            .getSingleOrNull();

    return row?.read(countExp) ?? 0;
  }

  @override
  Future<void> incrementRetryCount(String folderId) async {
    final folder = await fetchFolderById(folderId);
    if (folder == null) return;
    await (database.update(database.folderItems)
          ..where((tbl) => tbl.id.equals(folderId)))
        .write(FolderItemsCompanion(retryCount: Value(folder.retryCount + 1)));
  }
}
