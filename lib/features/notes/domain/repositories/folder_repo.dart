import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';

import '../entities/folder_entity.dart';

abstract interface class FolderRepository{
  Future<Either<Failure, FolderEntity>> createFolder(FolderEntity folder);
  Future<Either<Failure, List<FolderEntity>>> fetchRootFolders();
  Future<Either<Failure, List<FolderEntity>>> fetchFoldersByParentId(int parentId);
// Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note);
// Future<Either<Failure, void>> deleteNote(int noteId);
}