import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';

import '../entities/folder_entity.dart';

abstract interface class FolderRepository{
  Future<Either<Failure, FolderEntity>> createFolder(FolderEntity folder);
  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders();
  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId(int parentId);
  Future<Either<Failure, void>> renameFolder(int folderId, String newName);
  Future<Either<Failure, void>> deleteFolder(int folderId);

}