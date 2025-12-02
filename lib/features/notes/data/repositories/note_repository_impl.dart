import 'package:fpdart/fpdart.dart';
import 'package:notes_bucket/core/errors/exceptions.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/models/note.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  const NoteRepositoryImpl({required this.noteLocalDataSource});

  @override
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note) async {
    try {
      final noteToInsert = Note.fromEntity(note);
      await noteLocalDataSource.addNote(noteToInsert);
      return Right(noteToInsert.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchNotesById(int folderId) async {
    try {
      final notes = await noteLocalDataSource.fetchNotesByFolderId(folderId);
      final noteEntities = notes.map((note) => note.toEntity()).toList();
      return Right(noteEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
