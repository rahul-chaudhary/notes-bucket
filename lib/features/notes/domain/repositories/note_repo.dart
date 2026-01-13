import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';

abstract interface class NoteRepository{
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> fetchNotesByFolderId(int folderId);
  Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note);
  Future<Either<Failure, void>> deleteNote(int noteId);
  Future<Either<Failure, NoteEntity?>> fetchNoteById(int noteId);
  Future<Either<Failure, List<NoteEntity>>> fetchAllNotes({required int limit,required int offset});
  Future<Either<Failure, int>> fetchNotesCountByFolderId({required int folderId});
  Future<Either<Failure, NoteEntity>> markNoteAsSynced(int noteId);
  Future<Either<Failure, List<NoteEntity>>> fetchUnsyncedNotes();

}