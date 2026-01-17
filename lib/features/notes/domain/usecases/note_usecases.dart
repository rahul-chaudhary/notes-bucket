import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/usecases/use_case.dart';

import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';

class AddNoteParams extends Equatable {
  final String? title;
  final String? content;
  final String folderId;

  const AddNoteParams({
    required this.title,
    required this.content,
    required this.folderId,
  });

  @override
  List<Object?> get props => [title, content, folderId];
}

class AddNote implements UseCase<NoteEntity, AddNoteParams> {
  final NoteRepository repository;
  AddNote(this.repository);

  @override
  Future<Either<Failure, NoteEntity>> call(AddNoteParams params) async {
    return await repository.addNote(params);
  }
}

class FetchNotesByFolderId implements UseCase<List<NoteEntity>, String> {
  final NoteRepository repository;
  FetchNotesByFolderId(this.repository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(String params) async {
    return await repository.fetchNotesByFolderId(params);
  }
}

class FetchNoteById implements UseCase<NoteEntity?, String> {
  final NoteRepository repository;

  FetchNoteById(this.repository);

  @override
  Future<Either<Failure, NoteEntity?>> call(String params) async {
    return await repository.fetchNoteById(params);
  }
}

class UpdateNote implements UseCase<NoteEntity, NoteEntity> {
  final NoteRepository repository;
  UpdateNote(this.repository);

  @override
  Future<Either<Failure, NoteEntity>> call(NoteEntity params) async {
    return await repository.updateNote(params);
  }
}

class DeleteNote implements UseCase<void, String> {
  final NoteRepository repository;

  DeleteNote(this.repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await repository.deleteNote(params);
  }
}


class FetchAllNotes implements UseCase<List<NoteEntity>, FetchAllNotesParams> {
  final NoteRepository repository;

  FetchAllNotes(this.repository);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(FetchAllNotesParams params) async {
    return await repository.fetchAllNotes(
      limit: params.limit,
      offset: params.offset,
    );
  }
}

class FetchNotesCountByFolderId implements UseCase<int, String> {
  final NoteRepository repository;

  FetchNotesCountByFolderId(this.repository);

  @override
  Future<Either<Failure, int>> call(String params) async {
    return await repository.fetchNotesCountByFolderId(folderId: params);
  }
}



class FetchAllNotesParams extends Equatable {
  final int limit;
  final int offset;

  const FetchAllNotesParams({
    required this.limit,
    required this.offset,
  });
  @override
  List<Object?> get props => [limit, offset];

}