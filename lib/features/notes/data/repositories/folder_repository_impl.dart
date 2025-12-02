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
     await folderLocalDataSource.create(folderToInsert);
     return Right(folderToInsert.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId(int parentId) async {
    try {
      final folders = await folderLocalDataSource.fetchFoldersByParentId(parentId);
      final folderEntities = folders.map((folder) => folder.toEntity()).toList();
      return Right(folderEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders() async {
    try {
      final folders = await folderLocalDataSource.fetchRootFolders();
      final folderEntities = folders.map((folder) => folder.toEntity()).toList();
      return Right(folderEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }

  }

}