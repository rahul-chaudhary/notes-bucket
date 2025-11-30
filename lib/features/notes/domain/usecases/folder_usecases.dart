import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import '../entities/folder_entity.dart';
import '../repositories/folder_repo.dart';

class CreateFolder {
  final FolderRepository repository;
  CreateFolder(this.repository);

  Future<Either<Failure, FolderEntity>> execute(FolderEntity folder) {
    return repository.createFolder(folder);
  }
}


class FetchRootFolders {
  final FolderRepository repository;
  FetchRootFolders(this.repository);

  Future<Either<Failure, List<FolderEntity>>> execute() {
    return repository.fetchRootFolders();
  }
}

class FetchFoldersByParentId {
  final FolderRepository repository;
  FetchFoldersByParentId(this.repository);

  Future<Either<Failure, List<FolderEntity>>> execute(int parentId) {
    return repository.fetchFoldersByParentId(parentId);
  }
}