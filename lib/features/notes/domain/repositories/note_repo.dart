import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';

abstract interface class NoteRepository{
  Future<Either<Failure, NoteEntity>> addNote(AddNoteParams note);
  Future<Either<Failure, List<NoteEntity>>> fetchNotesByFolderId(String folderId);
  Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note);
  Future<Either<Failure, void>> deleteNote(String noteId);
  Future<Either<Failure, NoteEntity?>> fetchNoteById(String noteId);
  Future<Either<Failure, List<NoteEntity>>> fetchAllNotes({required int limit,required int offset});
  Future<Either<Failure, int>> fetchNotesCountByFolderId({required String folderId});
  Future<Either<Failure, NoteEntity>> markNoteAsSynced(String noteId);
  Future<Either<Failure, List<NoteEntity>>> fetchUnsyncedNotes();

}