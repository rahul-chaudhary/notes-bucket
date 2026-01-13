import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/exceptions.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  const NoteRepositoryImpl({required this.noteLocalDataSource});

  @override
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note) async {
    try {
      final res = await noteLocalDataSource.addNote(note);
      return Right(res);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchNotesByFolderId(
    int folderId,
  ) async {
    try {
      final notes = await noteLocalDataSource.fetchNotesByFolderId(folderId);
      return Right(notes);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, NoteEntity?>> fetchNoteById(int noteId) async {
    try {
      final note = await noteLocalDataSource.fetchNoteById(noteId);
      if (note == null) return const Right(null);

      return Right(note);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note) async {
    try {
      final updateNote = await noteLocalDataSource.updateNote(note);
      return Right(updateNote);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(int noteId) async {
    try {
      await noteLocalDataSource.deleteNote(noteId);
      return const Right(null);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchAllNotes({
    required int limit,
    required int offset,
  }) async {
    try {
      final notes = await noteLocalDataSource.fetchAllNotes(
        limit: limit,
        offset: offset,
      );
      return Right(notes);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, int>> fetchNotesCountByFolderId({required int folderId}) async {
    try {
      final count = await noteLocalDataSource.fetchNotesCountByFolderId(folderId);
      return Right(count);
      } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> markNoteAsSynced(int noteId) async {
    try {
      final syncedNote = await noteLocalDataSource.markNoteAsSynced(noteId);
      return Right(syncedNote);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchUnsyncedNotes() async {
    try {
      final notes = await noteLocalDataSource.fetchUnsyncedNotes();
      return Right(notes);
    } on DatabaseException catch (e, st) {
      return Left(DatabaseFailure(e.message, st));
    }
  }

}
