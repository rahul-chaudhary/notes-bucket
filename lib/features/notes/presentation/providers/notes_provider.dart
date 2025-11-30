import 'package:notes_bucket/core/db/database_helper.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/note_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_provider.g.dart';

@riverpod
DatabaseHelper databaseHelper(Ref ref) {
  return DatabaseHelper();
}

@riverpod
NoteLocalDataSource noteLocalDataSource(Ref ref) {
  final db = ref.watch(databaseHelperProvider);
  return NoteLocalDataSourceImpl(databaseHelper: db);
}

@riverpod
NoteRepository noteRepository(Ref ref) {
  final dataSource = ref.watch(noteLocalDataSourceProvider);
  return NoteRepositoryImpl(noteLocalDataSource: dataSource);
}

@riverpod
AddNote addNote(Ref ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return AddNote(repository);
}

@Riverpod(keepAlive: true)
class Notes extends _$Notes {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> addNote(NoteEntity note) async {
    state = const AsyncValue.loading();

    try {
      final addNoteUseCase = ref.read(addNoteProvider);
      final result = await addNoteUseCase.call(note);

      result.fold(
            (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
            (_) {
          state = const AsyncValue.data(null);
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      dbPrint('Failed to add note', e: e, st: st);
    }
  }
}
