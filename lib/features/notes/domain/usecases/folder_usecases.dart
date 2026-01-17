import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';
import '../entities/folder_entity.dart';
import '../repositories/folder_repo.dart';

class CreateFolderParams {
  final String name;
  final String? parentId;

  CreateFolderParams({required this.name, this.parentId});
}

class CreateFolder implements UseCase<FolderEntity, CreateFolderParams> {
  final FolderRepository repository;

  CreateFolder(this.repository);

  @override
  Future<Either<Failure, FolderEntity>> call(CreateFolderParams params) async {
    final exists = await repository.folderExists(params.parentId, params.name);
    return exists.fold((l) => Left(l), (r) {
      if (r == true) {
        return Left(ValidationFailure('Folder name already exists'));
      }
      return repository.createFolder(
        name: params.name,
        parentId: params.parentId,
      );
    });
  }
}

class FetchRootFoldersParams {
  final int limit;
  final int offset;

  FetchRootFoldersParams({required this.limit, required this.offset});
}

class FetchRootFolders
    implements UseCase<List<FolderEntity>, FetchRootFoldersParams> {
  final FolderRepository repository;

  FetchRootFolders(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(
    FetchRootFoldersParams params,
  ) {
    return repository.fetchRootFolders(
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class FetchFoldersByParentIdParams {
  final String? parentId;
  final int limit;
  final int offset;

  FetchFoldersByParentIdParams({
    required this.parentId,
    required this.limit,
    required this.offset,
  });
}

class FetchFoldersByParentId
    implements UseCase<List<FolderEntity>, FetchFoldersByParentIdParams> {
  final FolderRepository repository;

  FetchFoldersByParentId(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(
    FetchFoldersByParentIdParams params,
  ) {
    return repository.fetchFoldersByParentId(
      parentId: params.parentId,
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class DeleteFolder implements UseCase<void, String> {
  final FolderRepository repository;

  DeleteFolder(this.repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    final folderExist = await repository.fetchFolderById(params);
    return folderExist.fold(
      (l) => throw Exception(l.message),
      (r) => r == null
          ? Left(CacheFailure('Folder not found'))
          : repository.deleteFolder(params),
    );
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
    if (params.newName.isEmpty) {
      return Left(ValidationFailure('Folder name cannot be empty'));
    }

    final exists = await repository.folderExists(
      params.folder.parentId,
      params.newName,
    );
    return exists.fold(
      (l) => Left(l),
      (r) => r == true
          ? Left(ValidationFailure('Folder name already exists'))
          : repository.renameFolder(params.folder.id, params.newName),
    );
  }
}

class GetCurrentPath implements UseCase<List<FolderEntity>, String?> {
  final FolderRepository repository;

  GetCurrentPath(this.repository);

  @override
  Future<Either<Failure, List<FolderEntity>>> call(String? params) async {
    if (params == null) return const Right([]);

    String? id = params;
    final folders = <FolderEntity>[];

    while (id != null) {
      final res = await repository.fetchFolderById(id);

      // Directly handle the Either result
      final folder = res.fold((failure) => null, (folder) => folder);

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

class FetchFolderById implements UseCase<FolderEntity?, String> {
  final FolderRepository repository;

  FetchFolderById(this.repository);

  @override
  Future<Either<Failure, FolderEntity?>> call(String params) async {
    return repository.fetchFolderById(params);
  }
}

class FetchFoldersCountByFolderId implements UseCase<int, String> {
  final FolderRepository repository;

  FetchFoldersCountByFolderId(this.repository);

  @override
  Future<Either<Failure, int>> call(String params) async {
    return repository.fetchFoldersCountByFolderId(folderId: params);
  }
}

class FetchTotalItemsCount {
  final FolderRepository folderRepository;
  final NoteRepository noteRepository;

  FetchTotalItemsCount({
    required this.folderRepository,
    required this.noteRepository,
  });

  Future<Either<Failure, int>> call(String folderId) async {
    final foldersResult = await folderRepository.fetchFoldersCountByFolderId(
      folderId: folderId,
    );
    final notesResult = await noteRepository.fetchNotesCountByFolderId(
      folderId: folderId,
    );

    return foldersResult.fold(
      (failure) => Left(failure),
      (foldersCount) => notesResult.fold(
        (failure) => Left(failure),
        (notesCount) => Right(foldersCount + notesCount),
      ),
    );
  }
}
