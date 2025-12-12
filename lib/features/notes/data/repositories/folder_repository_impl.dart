import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/exceptions.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/models/folder.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderLocalDataSource folderLocalDataSource;

  const FolderRepositoryImpl({required this.folderLocalDataSource});
  @override
  Future<Either<Failure, FolderEntity>> createFolder(FolderEntity folder) async {
    try {
     final folderToInsert = Folder.fromEntity(folder);
     await folderLocalDataSource.createFolder(folderToInsert);
     return Right(folderToInsert.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId({
    required int? parentId,
    required int limit,
    required int offset,
  }) async {
    try {
      final folders = await folderLocalDataSource.fetchFoldersByParentId(
        parentId: parentId,
        limit: limit,
        offset: offset,
      );
      final folderEntities = folders.map((folder) => folder.toEntity()).toList();
      return Right(folderEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders({required int limit, required int offset}) async {
    try {
      final folders = await folderLocalDataSource.fetchRootFolders(limit: limit, offset: offset);
      final folderEntities = folders.map((folder) => folder.toEntity()).toList();
      return Right(folderEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> renameFolder(int folderId, String newName) async {
    try {
      await folderLocalDataSource.renameFolder(folderId, newName);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFolder(int folderId) async {
    try {
      await folderLocalDataSource.deleteFolder(folderId);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> folderExists(FolderEntity folder) async {
    try{
      final res = await folderLocalDataSource.folderExists(Folder.fromEntity(folder));
      return Right(res);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }


}