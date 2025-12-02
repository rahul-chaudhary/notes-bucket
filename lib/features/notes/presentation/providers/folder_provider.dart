import 'package:notes_bucket/core/db/database_provider.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/folder_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/folder_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

// Provider for root folders list
@riverpod
class RootFolders extends _$RootFolders {
  @override
  Future<List<FolderEntity>> build() async {
    return _fetchRootFolders();
  }

  Future<List<FolderEntity>> _fetchRootFolders() async {
    final folderRepo = ref.read(folderRepositoryProvider);

    try {
      final result = await folderRepo.fetchRootFolders();
      return result.fold(
            (failure) {
          dbPrint('Failed to fetch root folders: ${failure.message}');
          throw Exception(failure.message);
        },
            (folders) => folders,
      );
    } catch (e, st) {
      dbPrint('Failed to fetch root folders', e: e, st: st);
      rethrow;
    }
  }

  Future<void> createFolder(FolderEntity folder) async {
    state = const AsyncValue.loading();

    try {
      final folderUseCase = ref.read(createFolderProvider);
      final result = await folderUseCase.execute(folder);

      await result.fold(
            (failure) async {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
            (_) async {
          // Refresh the list after creating
          state = await AsyncValue.guard(() => _fetchRootFolders());
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      dbPrint('Failed to create folder', e: e, st: st);
    }
  }
  /// Refresh the root folders list
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchRootFolders());
  }
}

/// Provider for FolderLocalDataSource
@riverpod
FolderLocalDataSource folderLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FolderLocalDataSourceImpl(database: db);
}

/// Provider for FolderRepository
@riverpod
FolderRepository folderRepository(Ref ref) {
  final dataSource = ref.watch(folderLocalDataSourceProvider);
  return FolderRepositoryImpl(folderLocalDataSource: dataSource);
}
/// Provider for CreateFolder use case
@riverpod
CreateFolder createFolder(Ref ref) {
  final repository = ref.watch(folderRepositoryProvider);
  return CreateFolder(repository);
}