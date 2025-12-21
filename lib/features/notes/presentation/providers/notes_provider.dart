import 'package:notes_bucket/core/db/database_provider.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/note_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/note_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/note_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────
@riverpod
NoteLocalDataSource noteLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return NoteLocalDataSourceImpl(database: db);
}

@riverpod
NoteRepository noteRepository(Ref ref) {
  final dataSource = ref.watch(noteLocalDataSourceProvider);
  return NoteRepositoryImpl(noteLocalDataSource: dataSource);
}

// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@riverpod
AddNote addNote(Ref ref) => AddNote(ref.watch(noteRepositoryProvider));

@riverpod
FetchNotesByFolderId fetchNotesByFolderIdUseCase(Ref ref) =>
    FetchNotesByFolderId(ref.watch(noteRepositoryProvider));

@riverpod
FetchNoteById fetchNoteByIdUseCase(Ref ref) =>
    FetchNoteById(ref.watch(noteRepositoryProvider));

@riverpod
UpdateNote updateNote(Ref ref) => UpdateNote(ref.watch(noteRepositoryProvider));

@riverpod
DeleteNote deleteNote(Ref ref) => DeleteNote(ref.watch(noteRepositoryProvider));

@riverpod
FetchAllNotes fetchAllNotesUseCase(Ref ref) => FetchAllNotes(ref.watch(noteRepositoryProvider));


// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class NoteController extends _$NoteController {
  @override
  void build() {}

    Future<NoteEntity> addNote(NoteEntity note) async {
    final usecase = ref.read(addNoteProvider);
    final result = await usecase.call(note);
    return result.fold(
            (failure) => throw Exception(failure.message),
            (note) => note);
    }

    Future<NoteEntity> updateNote(NoteEntity note) async {
    final usecase = ref.read(updateNoteProvider);
    final result = await usecase.call(note);
    return result.fold(
            (failure) => throw Exception(failure.message),
            (note) => note);
    }

    Future<void> deleteNote(int noteId) async {
    final usecase = ref.read(deleteNoteProvider);
    final result = await usecase.call(noteId);
    return result.fold(
            (failure) => throw Exception(failure.message),
            (_) => null);
    }
}

@riverpod
class FetchNotesByFolderIdNotifier extends _$FetchNotesByFolderIdNotifier {
  @override
  Future<List<NoteEntity>> build(int? folderId) async => _load(folderId);

  Future<List<NoteEntity>> _load(int? folderId) async {
    if(folderId == null) return [];
    final usecase = ref.read(fetchNotesByFolderIdUseCaseProvider);
    final result = await usecase.call(folderId);

    return result.fold(
          (failure) => throw Exception(failure.message),
          (notes) => notes,
    );
  }
}

@riverpod
class FetchNoteByIdNotifier extends _$FetchNoteByIdNotifier {
  @override
  Future<NoteEntity?> build(int noteId) async => _load(noteId);

  Future<NoteEntity?> _load(int noteId) async {
    final usecase = ref.read(fetchNoteByIdUseCaseProvider);
    final result = await usecase.call(noteId);

    return result.fold(
          (failure) => throw Exception(failure.message),
          (note) => note,
    );
  }
}

@riverpod
class FetchAllNotesNotifier extends _$FetchAllNotesNotifier {
  @override
  Future<List<NoteEntity>> build(FetchAllNotesParams params) async =>
      _load(params);

  Future<List<NoteEntity>> _load(FetchAllNotesParams params) async {
    final usecase = ref.read(fetchAllNotesUseCaseProvider);
    final result = await usecase.call(params);
    return result.fold(
          (failure) => throw Exception(failure.message),
          (notes) => notes,
    );
  }
}


