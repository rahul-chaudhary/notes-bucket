import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/exceptions.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/models/folder.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderLocalDataSource folderLocalDataSource;

  const FolderRepositoryImpl({required this.folderLocalDataSource});

  @override
  Future<Either<Failure, FolderEntity>> createFolder({
    required String? parentId,
    required String name,
  }) async {
    try {
      final res = await folderLocalDataSource.createFolder(name, parentId);
      return Right(res);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId({
    required String? parentId,
    required int limit,
    required int offset,
  }) async {
    try {
      final folders = await folderLocalDataSource.fetchFoldersByParentId(
        parentId: parentId,
        limit: limit,
        offset: offset,
      );
      return Right(folders);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders({
    required int limit,
    required int offset,
  }) async {
    try {
      final folders = await folderLocalDataSource.fetchRootFolders(
        limit: limit,
        offset: offset,
      );
      return Right(folders);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, void>> renameFolder(
    String folderId,
    String newName,
  ) async {
    try {
      await folderLocalDataSource.renameFolder(folderId, newName);
      return const Right(null);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFolder(String folderId) async {
    try {
      await folderLocalDataSource.deleteFolder(folderId);
      return const Right(null);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, bool>> folderExists(
    String? folderParentID,
    String folderName,
  ) async {
    try {
      final res = await folderLocalDataSource.folderExists(
        folderParentID,
        folderName,
      );
      return Right(res);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, FolderEntity?>> fetchFolderById(
    String folderId,
  ) async {
    try {
      final folder = await folderLocalDataSource.fetchFolderById(folderId);
      if (folder == null) return const Right(null);
      return Right(folder);
    } catch (e, st) {
      return Left(DatabaseFailure(e.toString(), st));
    }
  }

  @override
  Future<Either<Failure, int>> fetchFoldersCountByFolderId({
    required String folderId,
  }) async {
    try {
      final count = await folderLocalDataSource.fetchFoldersCountByFolderId(
        folderId: folderId,
      );
      return Right(count);
    } catch (e, st) {
      return Left(DatabaseFailure(e.toString(), st));
    }
  }
}
