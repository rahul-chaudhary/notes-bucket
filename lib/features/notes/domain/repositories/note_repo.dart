import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepository{
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> fetchNotes();
  // Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note);
  // Future<Either<Failure, void>> deleteNote(int noteId);
}