import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:notes_bucket/features/notes/data/datasource/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/note_repository_impl.dart';

part 'notes_provider.g.dart';

@Riverpod(keepAlive: true)
class Notes extends _$Notes {
  @override
  Future<List<NoteEntity>> build() async {
    final repository = NoteRepositoryImpl(
      noteLocalDataSource: NoteLocalDataSourceImpl(),
    );
    final fetchNote = FetchNote(repository);
    final result = await fetchNote.execute();

    return result.fold(
          (failure) => throw Exception(failure),
          (notes) => notes,
    );
  }

  Future<void> addNote(NoteEntity note) async {
    state = const AsyncValue.loading();

    try {
      final repository = NoteRepositoryImpl(
        noteLocalDataSource: NoteLocalDataSourceImpl(),
      );

      final addNoteUsecase = AddNote(repository);
      await addNoteUsecase.execute(note);

      final fetchNote = FetchNote(repository);
      final result = await fetchNote.execute();

      state = await AsyncValue.guard(() async {
        return result.fold(
              (failure) => throw Exception(failure),
              (notes) => notes,
        );
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      dbPrint('Failed to add note', e: e, st: st);
    }
  }
}
