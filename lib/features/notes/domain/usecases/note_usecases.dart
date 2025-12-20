import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';

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

class FetchNotesByFolderId implements UseCase<List<NoteEntity>, int> {
  final NoteRepository repository;
  FetchNotesByFolderId(this.repository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(int folderID) async {
    return await repository.fetchNotesByFolderId(folderID);
  }
}

class FetchNoteById implements UseCase<NoteEntity?, int> {
  final NoteRepository repository;

  FetchNoteById(this.repository);

  @override
  Future<Either<Failure, NoteEntity?>> call(int noteId) async {
    return await repository.fetchNoteById(noteId);
  }
}

class UpdateNote implements UseCase<NoteEntity, NoteEntity> {
  final NoteRepository repository;
  UpdateNote(this.repository);

  @override
  Future<Either<Failure, NoteEntity>> call(NoteEntity note) async {
    return await repository.updateNote(note);
  }
}

class DeleteNote implements UseCase<void, int> {
  final NoteRepository repository;

  DeleteNote(this.repository);

  @override
  Future<Either<Failure, void>> call(int noteId) async {
    return await repository.deleteNote(noteId);
  }
}