import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';

class AddNote {
  final NoteRepository repository;
  AddNote(this.repository);

  Future<Either<Failure, NoteEntity>> execute(NoteEntity note) {
    return repository.addNote(note);
  }
}


class FetchNote {
  final NoteRepository repository;
  FetchNote(this.repository);

  Future<Either<Failure, List<NoteEntity>>> execute() {
    return repository.fetchNotes();
  }
}