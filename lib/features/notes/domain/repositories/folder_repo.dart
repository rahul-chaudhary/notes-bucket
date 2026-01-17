import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';

import '../entities/folder_entity.dart';

abstract interface class FolderRepository {
  Future<Either<Failure, FolderEntity>> createFolder({
    required String? parentId,
    required String name,
  });

  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId({
    required String? parentId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, void>> renameFolder(String folderId, String newName);

  Future<Either<Failure, void>> deleteFolder(String folderId);

  Future<Either<Failure, bool>> folderExists(String? folderParentID, String folderName);

  Future<Either<Failure, FolderEntity?>> fetchFolderById(String folderId);

  Future<Either<Failure, int>> fetchFoldersCountByFolderId({required String folderId});
}
