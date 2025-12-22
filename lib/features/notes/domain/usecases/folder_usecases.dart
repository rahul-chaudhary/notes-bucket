import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import '../entities/folder_entity.dart';
import '../repositories/folder_repo.dart';

class CreateFolderParams {
  final String name;
  final int? parentId;
  CreateFolderParams({required this.name, this.parentId});
}

class CreateFolder implements UseCase<FolderEntity, CreateFolderParams> {
  final FolderRepository repository;

  CreateFolder(this.repository);

  @override
  Future<Either<Failure, FolderEntity>> call(CreateFolderParams folderParentId) async {
    final exists = await repository.folderExists(folderParentId.parentId, folderParentId.name);
    return exists.fold(
          (l) => Left(l),
          (r) {
        if (r == true) {
          return Left(ValidationFailure('Folder name already exists'));
        }
        return repository.createFolder(name: folderParentId.name, parentId: folderParentId.parentId);
      },
    );
  }
}

class FetchRootFoldersParams {
  final int limit;
  final int offset;

  FetchRootFoldersParams({required this.limit, required this.offset});
}

class FetchRootFolders implements UseCase<List<FolderEntity>, FetchRootFoldersParams> {
  final FolderRepository repository;

  FetchRootFolders(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(FetchRootFoldersParams folderParentId) {
    return repository.fetchRootFolders(limit: folderParentId.limit, offset: folderParentId.offset);
  }
}

class FetchFoldersByParentIdParams {
  final int? parentId;
  final int limit;
  final int offset;

  FetchFoldersByParentIdParams({
    required this.parentId,
    required this.limit,
    required this.offset,
  });
}

class FetchFoldersByParentId implements UseCase<List<FolderEntity>, FetchFoldersByParentIdParams> {
  final FolderRepository repository;

  FetchFoldersByParentId(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(FetchFoldersByParentIdParams folderParentId) {
    return repository.fetchFoldersByParentId(
      parentId: folderParentId.parentId,
      limit: folderParentId.limit,
      offset: folderParentId.offset,
    );
  }
}

class DeleteFolder implements UseCase<void, int> {
  final FolderRepository repository;

  DeleteFolder(this.repository);

  @override
  Future<Either<Failure, void>> call(int folderParentId) {
    return repository.deleteFolder(folderParentId);
  }
}

class RenameFolderParams {
  final FolderEntity folder;
  final String newName;

  RenameFolderParams({required this.folder, required this.newName});
}

class RenameFolder implements UseCase<void, RenameFolderParams> {
  final FolderRepository repository;

  RenameFolder(this.repository);

  @override
  Future<Either<Failure, void>> call(RenameFolderParams folderParentId) async {
    final exists = await repository.folderExists(folderParentId.folder.parentId, folderParentId.newName);
    return exists.fold(
          (l) => Left(l),
          (r) => r == true
          ? Left(ValidationFailure('Folder name already exists'))
          : repository.renameFolder(folderParentId.folder.id, folderParentId.newName),
    );
  }
}

class GetCurrentPath implements UseCase<String, int?> {
  final FolderRepository repository;

  GetCurrentPath(this.repository);

  @override
  Future<Either<Failure, String>> call(int? folderParentId) async {
    if (folderParentId == null) return const Right('Root');

    int? id = folderParentId;
    final paths = <String>[];

    while (id != null) {
      final res = await repository.fetchFolderById(id);

      final result = res.fold<Either<Failure, FolderEntity?>>(
            (failure) => Left(failure),
            (folder) => Right(folder),
      );

      if (result.isLeft()) return result.map((_) => '');

      final folder = result.getRight().toNullable()!;
      paths.add(folder.name);
      id = folder.parentId;
    }

    return Right('Root > ${paths.reversed.join(' > ')}');
  }
}


class FetchFolderById implements UseCase<FolderEntity?, int> {
  final FolderRepository repository;

  FetchFolderById(this.repository);

  @override
  Future<Either<Failure, FolderEntity?>> call(int folderParentId) async {
    return repository.fetchFolderById(folderParentId);
  }
}
