import 'package:drift/drift.dart';
import 'package:notes_bucket/core/db/app_database.dart';
import 'package:notes_bucket/features/notes/data/models/folder.dart';

abstract interface class FolderLocalDataSource {
  Future<Folder> createFolder(Folder folder);

  Future<List<Folder>> fetchRootFolders({
    required int limit,
    required int offset,
  });

  Future<List<Folder>> fetchFoldersByParentId({
    required int? parentId,
    required int limit,
    required int offset,
  });

  Future<void> renameFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);

  Future<bool> folderExists(int? folderParentID, String folderName);

  Future<Folder?> fetchFolderById(int folderId);

  Future<int> fetchFoldersCountByFolderId({required int folderId});
}

class FolderLocalDataSourceImpl implements FolderLocalDataSource {
  final AppDatabase database;

  FolderLocalDataSourceImpl({required this.database});

  @override
  Future<Folder> createFolder(Folder folder) async {
    await database
        .into(database.folderItems)
        .insert(
          FolderItemsCompanion.insert(
            parentID: Value(folder.parentId),
            name: folder.name,
            createdAt: Value(folder.createdAt),
            updatedAt: Value(folder.updatedAt),
          ),
        );
    return folder;
  }

  @override
  Future<List<Folder>> fetchRootFolders({
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
          (row) => Folder(
            id: row.id,
            parentId: row.parentID,
            name: row.name,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
    return folders;
  }

  @override
  Future<List<Folder>> fetchFoldersByParentId({
    required int? parentId,
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
          (row) => Folder(
            id: row.id,
            parentId: row.parentID,
            name: row.name,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
    return folders;
  }

  @override
  Future<void> renameFolder(int folderId, String newName) async {
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
  Future<void> deleteFolder(int folderId) async {
    await (database.delete(
      database.folderItems,
    )..where((tbl) => tbl.id.equals(folderId))).go();
  }

  @override
  Future<bool> folderExists(int? folderParentID, String folderName) async {
    final row = await (database.select(database.folderItems)
      ..where((tbl) => tbl.name.equals(folderName))
      ..where((tbl) => folderParentID == null
          ? tbl.parentID.isNull()
          : tbl.parentID.equals(folderParentID)))
        .getSingleOrNull();

    return row != null;
  }

  @override
  Future<Folder?> fetchFolderById(int folderId) async {
    final row = await (database.select(database.folderItems)
      ..where((tbl) => tbl.id.equals(folderId)))
        .getSingleOrNull();

    if(row ==null) return null;

    return Folder(
      id: row.id,
      parentId: row.parentID,
      name: row.name,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  @override
  Future<int> fetchFoldersCountByFolderId({required int folderId}) async {
    final queryResult = await (database.select(database.folderItems)
        ..where((tbl) => tbl.parentID.equals(folderId))).get();
    return queryResult.length;
  }

}
