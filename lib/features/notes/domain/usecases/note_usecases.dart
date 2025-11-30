import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/usercase.dart';

import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';

class AddNote implements UseCase<NoteEntity, NoteEntity> {
  final NoteRepository repository;
  AddNote(this.repository);

  @override
  Future<Either<Failure, NoteEntity>> call(NoteEntity note) async {
    return await repository.addNote(note);
  }
}

class FetchNote implements UseCase<List<NoteEntity>, int> {
  final NoteRepository repository;
  FetchNote(this.repository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(int folderID) async {
    return await repository.fetchNotesById(folderID);
  }
}