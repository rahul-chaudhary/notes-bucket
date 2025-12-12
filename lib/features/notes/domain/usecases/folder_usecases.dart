import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import '../entities/folder_entity.dart';
import '../repositories/folder_repo.dart';

class CreateFolder {
  final FolderRepository repository;

  CreateFolder(this.repository);

  Future<Either<Failure, FolderEntity>> execute(FolderEntity folder) async {
    final exists = await repository.folderExists(folder.parentId, folder.name);
    return exists.fold(
      (l) => Future.error(l.message),
      (r) => r == true
          ? Future.error('Folder name already exists')
          : repository.createFolder(folder),
    );
  }
}

class FetchRootFolders {
  final FolderRepository repository;

  FetchRootFolders(this.repository);

  Future<Either<Failure, List<FolderEntity>>> execute({
    required int limit,
    required int offset,
  }) {
    return repository.fetchRootFolders(limit: limit, offset: offset);
  }
}

class FetchFoldersByParentId {
  final FolderRepository repository;

  FetchFoldersByParentId(this.repository);

  Future<Either<Failure, List<FolderEntity>>> execute({
    required int? parentId,
    required int limit,
    required int offset,
  }) {
    return repository.fetchFoldersByParentId(
      parentId: parentId,
      limit: limit,
      offset: offset,
    );
  }
}

class DeleteFolder {
  final FolderRepository repository;

  DeleteFolder(this.repository);

  Future<Either<Failure, void>> execute(int folderId) {
    return repository.deleteFolder(folderId);
  }
}

class RenameFolder {
  final FolderRepository repository;

  RenameFolder(this.repository);

  Future<Either<Failure, void>> execute(
    FolderEntity folder,
    String newName,
  ) async {
    final exists = await repository.folderExists(folder.parentId, newName);
    return exists.fold(
          (l) => Future.error(l.message),
          (r) => r == true
          ? Future.error('Folder name already exists')
          : repository.renameFolder(folder.id, newName),
    );
  }
}
