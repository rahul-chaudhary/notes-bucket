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
  Future<Either<Failure, FolderEntity>> call(CreateFolderParams params) async {
    final exists = await repository.folderExists(params.parentId, params.name);
    return exists.fold(
          (l) => Left(l),
          (r) {
        if (r == true) {
          return Left(ValidationFailure('Folder name already exists'));
        }
        return repository.createFolder(name: params.name, parentId: params.parentId);
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
  Future<Either<Failure, List<FolderEntity>>> call(FetchRootFoldersParams params) {
    return repository.fetchRootFolders(limit: params.limit, offset: params.offset);
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
  Future<Either<Failure, List<FolderEntity>>> call(FetchFoldersByParentIdParams params) {
    return repository.fetchFoldersByParentId(
      parentId: params.parentId,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class DeleteFolder implements UseCase<void, int> {
  final FolderRepository repository;

  DeleteFolder(this.repository);

  @override
  Future<Either<Failure, void>> call(int folderId) {
    return repository.deleteFolder(folderId);
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
  Future<Either<Failure, void>> call(RenameFolderParams params) async {
    final exists = await repository.folderExists(params.folder.parentId, params.newName);
    return exists.fold(
          (l) => Left(l),
          (r) => r == true
          ? Left(ValidationFailure('Folder name already exists'))
          : repository.renameFolder(params.folder.id, params.newName),
    );
  }
}

class GetCurrentPath implements UseCase<String, int?> {
  final FolderRepository repository;

  GetCurrentPath(this.repository);

  @override
  Future<Either<Failure, String>> call(int? parentId) async {
    if (parentId == null) return const Right('Root');

    int? id = parentId;
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
  Future<Either<Failure, FolderEntity?>> call(int id) async {
    return repository.fetchFolderById(id);
  }
}
