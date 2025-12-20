import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/core/db/database_provider.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/features/notes/data/datasource/local_data/folder_local_datasource.dart';
import 'package:notes_bucket/features/notes/data/repositories/folder_repository_impl.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/repositories/folder_repo.dart';
import 'package:notes_bucket/features/notes/domain/usecases/folder_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

// ─────────────────────────────────────────────────────────────
// DATA LAYER PROVIDERS (Datasource + Repository)
// ─────────────────────────────────────────────────────────────

@riverpod
FolderLocalDataSource folderLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FolderLocalDataSourceImpl(database: db);
}

@riverpod
FolderRepository folderRepository(Ref ref) {
  final ds = ref.watch(folderLocalDataSourceProvider);
  return FolderRepositoryImpl(folderLocalDataSource: ds);
}

// ─────────────────────────────────────────────────────────────
// DOMAIN LAYER PROVIDERS (Use-Cases)
// ─────────────────────────────────────────────────────────────

@riverpod
FetchRootFolders fetchRootFolders(Ref ref) =>
    FetchRootFolders(ref.watch(folderRepositoryProvider));

@riverpod
FetchFoldersByParentId fetchFoldersByParent(Ref ref) =>
    FetchFoldersByParentId(ref.watch(folderRepositoryProvider));

@riverpod
CreateFolder createFolder(Ref ref) =>
    CreateFolder(ref.watch(folderRepositoryProvider));

@riverpod
DeleteFolder deleteFolder(Ref ref) =>
    DeleteFolder(ref.watch(folderRepositoryProvider));

@riverpod
RenameFolder renameFolder(Ref ref) =>
    RenameFolder(ref.watch(folderRepositoryProvider));

@riverpod
GetCurrentPath getCurrentPath(Ref ref) =>
    GetCurrentPath(ref.watch(folderRepositoryProvider));

@riverpod
FetchFolderById fetchFolderById(Ref ref) =>
    FetchFolderById(ref.watch(folderRepositoryProvider));

// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

/// Root folders provider
@riverpod
class RootFolders extends _$RootFolders {
  @override
  Future<List<FolderEntity>> build({
    required int limit,
    required int offset,
  }) async {
    return _load(limit, offset);
  }

  Future<List<FolderEntity>> _load(int limit, int offset) async {
    final usecase = ref.read(fetchRootFoldersProvider);

    final result = await usecase.call(
      FetchRootFoldersParams(limit: limit, offset: offset),
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (folders) => folders,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(limit, offset));
  }
}

/// Folders by parent ID provider
@riverpod
class FoldersByParent extends _$FoldersByParent {
  @override
  Future<List<FolderEntity>> build({
    required int? parentId,
    required int limit,
    required int offset,
  }) async {
    return _load(parentId, limit, offset);
  }

  Future<List<FolderEntity>> _load(int? parentId, int limit, int offset) async {
    final usecase = ref.read(fetchFoldersByParentProvider);

    final result = await usecase.call(
      FetchFoldersByParentIdParams(
        parentId: parentId,
        limit: limit,
        offset: offset,
      ),
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (folders) => folders,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(parentId, limit, offset));
  }
}

/// Controller for mutations (create/delete/rename)
@Riverpod(keepAlive: true)
class FolderController extends _$FolderController {
  @override
  void build() {}

  // CREATE
  Future<void> create(FolderEntity folder) async {
    final usecase = ref.read(createFolderProvider);
    final result = await usecase.call(
      CreateFolderParams(name: folder.name, parentId: folder.parentId),
    );

    result.fold((f) => throw Exception(f.message), (_) {
      if (!ref.mounted) return;

      folder.parentId == null
          ? ref.invalidate(
              rootFoldersProvider(
                limit: AppConstants.folderPageLimit,
                offset: 0,
              ),
            )
          : ref.invalidate(
              foldersByParentProvider(
                parentId: folder.parentId!,
                limit: AppConstants.folderPageLimit,
                offset: 0,
              ),
            );
    });
  }

  // DELETE
  Future<void> delete(int folderId, int? parentId) async {
    final usecase = ref.read(deleteFolderProvider);
    final result = await usecase.call(folderId);

    result.fold((f) => throw Exception(f.message), (_) {
      if (!ref.mounted) return;

      parentId == null
          ? ref.invalidate(rootFoldersProvider)
          : ref.invalidate(
              foldersByParentProvider(
                parentId: parentId,
                limit: AppConstants.folderPageLimit,
                offset: 0,
              ),
            );
    });
  }

  // RENAME
  Future<void> rename(FolderEntity folder, String newName) async {
    final usecase = ref.read(renameFolderProvider);
    final result = await usecase.call(
      RenameFolderParams(folder: folder, newName: newName),
    );

    result.fold((f) => throw Exception(f.message), (_) {
      if (!ref.mounted) return;

      folder.parentId == null
          ? ref.invalidate(rootFoldersProvider)
          : ref.invalidate(
              foldersByParentProvider(
                parentId: folder.parentId!,
                limit: AppConstants.folderPageLimit,
                offset: 0,
              ),
            );
    });
  }
}

@riverpod
class CurrentPath extends _$CurrentPath {
  @override
  Future<String> build({required int? parentId}) async {
    return _load(parentId);
  }

  Future<String> _load(int? parentId) async {
    final usecase = ref.read(getCurrentPathProvider);

    final result = await usecase.call(parentId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (path) => path,
    );
  }
}

/// Folder by Id provider
@riverpod
class FolderById extends _$FolderById {
  @override
  Future<FolderEntity?> build(int folderId) async {
    return _load(folderId);
  }

  Future<FolderEntity?> _load(int folderId) async {
    final usecase = ref.read(fetchFolderByIdProvider);

    final result = await usecase.call(folderId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (folder) => folder,
    );
  }
}
