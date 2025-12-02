import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/folder_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/folder_usecases.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

@Riverpod(keepAlive: true)
class Folders extends _$Folders {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> createFolder(FolderEntity folder) async {
    state = const AsyncValue.loading();

    try {
      final folderUseCase = ref.read(createFolderProvider);
      final result = await folderUseCase.execute(folder);
      result.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
        (_) {
          state = const AsyncValue.data(null);
        },
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      dbPrint('Failed to create folder', e: e, st: st);
    }
  }
}

@riverpod
FolderLocalDataSource folderLocalDataSource(Ref ref) {
  final db = ref.watch(databaseHelperProvider);
  return FolderLocalDataSourceImpl(databaseHelper: db);
}

@riverpod
FolderRepository folderRepository(Ref ref) {
  final dataSource = ref.watch(folderLocalDataSourceProvider);
  return FolderRepositoryImpl(folderLocalDataSource: dataSource);
}

@riverpod
CreateFolder createFolder(Ref ref) {
  final repository = ref.watch(folderRepositoryProvider);
  return CreateFolder(repository);
}
