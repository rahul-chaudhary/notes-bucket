import 'package:notes_bucket/core/db/database_provider.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/folder_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/folder_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

/// Provider for root folders list
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

  /// Refresh the root folders list
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchRootFolders());
  }
}

/// Provider for folders by parent ID
@riverpod
class FoldersByParent extends _$FoldersByParent {
  @override
  Future<List<FolderEntity>> build(int parentId) async {
    return _fetchFoldersByParent(parentId);
  }

  Future<List<FolderEntity>> _fetchFoldersByParent(int parentId) async {
    final folderRepo = ref.read(folderRepositoryProvider);

    try {
      final result = await folderRepo.fetchFoldersByParentId(parentId);
      return result.fold(
            (failure) {
          dbPrint('Failed to fetch folders: ${failure.message}');
          throw Exception(failure.message);
        },
            (folders) => folders,
      );
    } catch (e, st) {
      dbPrint('Failed to fetch folders', e: e, st: st);
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchFoldersByParent(parentId));
  }
}

/// Separate controller for folder mutations
/// Separate controller for folder mutations
@Riverpod(keepAlive: true)
class FolderController extends _$FolderController {
  @override
  void build() {}

  /// Create a folder and invalidate relevant lists
  Future<void> createFolder(FolderEntity folder) async {
    final folderUseCase = ref.read(createFolderProvider);
    final result = await folderUseCase.execute(folder);

    return result.fold(
          (failure) {
        dbPrint('Failed to create folder: ${failure.message}');
        throw Exception(failure.message);
      },
          (_) {
        // Only invalidate on success
        if (ref.mounted) {
          if (folder.parentId == null) {
            ref.invalidate(rootFoldersProvider);
          } else {
            ref.invalidate(foldersByParentProvider(folder.parentId!));
          }
        }
      },
    );
  }

  /// Delete a folder and invalidate lists
  Future<void> deleteFolder(int folderId, int? parentId) async {
    final folderRepo = ref.read(folderRepositoryProvider);
    final result = await folderRepo.deleteFolder(folderId);

    return result.fold(
          (failure) {
        dbPrint('Failed to delete folder: ${failure.message}');
        throw Exception(failure.message);
      },
          (_) {
        if (ref.mounted) {
          if (parentId == null) {
            ref.invalidate(rootFoldersProvider);
          } else {
            ref.invalidate(foldersByParentProvider(parentId));
          }
        }
      },
    );
  }

  /// Rename a folder and invalidate lists
  Future<void> renameFolder(FolderEntity folder, String newName) async {
    final folderRepo = ref.read(folderRepositoryProvider);
    final result = await folderRepo.renameFolder(folder.id, newName);

    return result.fold(
          (failure) {
        dbPrint('Failed to rename folder: ${failure.message}');
        throw Exception(failure.message);
      },
          (_) {
        if (ref.mounted) {
          if (folder.parentId == null) {
            ref.invalidate(rootFoldersProvider);
          } else {
            ref.invalidate(foldersByParentProvider(folder.parentId!));
          }
        }
      },
    );
  }
}

// Infrastructure providers
@riverpod
FolderLocalDataSource folderLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FolderLocalDataSourceImpl(database: db);
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