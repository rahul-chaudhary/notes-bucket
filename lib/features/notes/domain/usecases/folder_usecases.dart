import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';
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

class GetCurrentPath implements UseCase<List<FolderEntity>, int?> {
  final FolderRepository repository;

  GetCurrentPath(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(int? folderParentId) async {
    if (folderParentId == null) return const Right([]);

    int? id = folderParentId;
    final folders = <FolderEntity>[];

    while (id != null) {
      final res = await repository.fetchFolderById(id);

      // Directly handle the Either result
      final folder = res.fold(
            (failure) => null,
            (folder) => folder,
      );

      if (folder == null) {
        // Return error immediately if folder not found
        return res.fold(
              (failure) => Left(failure),
              (_) => Left(CacheFailure('Folder not found')),
        );
      }

      folders.add(folder);
      id = folder.parentId;
    }

    return Right(folders.reversed.toList());
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

class FetchFoldersCountByFolderId implements UseCase<int,int> {
  final FolderRepository repository;

  FetchFoldersCountByFolderId(this.repository);

  @override
  Future<Either<Failure, int>> call(int folderId) async {
    return repository.fetchFoldersCountByFolderId(folderId: folderId);
  }
}

class FetchTotalItemsCount {
  final FolderRepository folderRepository;
  final NoteRepository noteRepository;

  FetchTotalItemsCount({
    required this.folderRepository,
    required this.noteRepository,
  });

  Future<Either<Failure, int>> call(int folderId) async {
    final foldersResult = await folderRepository.fetchFoldersCountByFolderId(folderId: folderId);
    final notesResult = await noteRepository.fetchNotesCountByFolderId(folderId: folderId);

    return foldersResult.fold(
          (failure) => Left(failure),
          (foldersCount) => notesResult.fold(
            (failure) => Left(failure),
            (notesCount) => Right(foldersCount + notesCount),
      ),
    );
  }
}
