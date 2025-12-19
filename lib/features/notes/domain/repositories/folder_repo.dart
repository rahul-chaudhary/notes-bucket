import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';

import '../entities/folder_entity.dart';

abstract interface class FolderRepository {
  Future<Either<Failure, FolderEntity>> createFolder({
    required int? parentId,
    required String name,
  });

  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId({
    required int? parentId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, void>> renameFolder(int folderId, String newName);

  Future<Either<Failure, void>> deleteFolder(int folderId);

  Future<Either<Failure, bool>> folderExists(int? folderParentID, String folderName);

  Future<Either<Failure, FolderEntity?>> fetchFolderById(int folderId);
}
