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
FetchRootFolders fetchRootFolders(Ref ref) {
  return FetchRootFolders(ref.watch(folderRepositoryProvider));
}

@riverpod
FetchFoldersByParentId fetchFoldersByParent(Ref ref) {
  return FetchFoldersByParentId(ref.watch(folderRepositoryProvider));
}

@riverpod
CreateFolder createFolder(Ref ref) {
  return CreateFolder(ref.watch(folderRepositoryProvider));
}

@riverpod
DeleteFolder deleteFolder(Ref ref) {
  return DeleteFolder(ref.watch(folderRepositoryProvider));
}

@riverpod
RenameFolder renameFolder(Ref ref) {
  return RenameFolder(ref.watch(folderRepositoryProvider));
}


// ─────────────────────────────────────────────────────────────
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ─────────────────────────────────────────────────────────────

/// Root folders provider
@riverpod
class RootFolders extends _$RootFolders {
  @override
  Future<List<FolderEntity>> build({required int limit, required int offset}) async {
    return _load(limit,offset);
  }

  Future<List<FolderEntity>> _load(int limit, int offset) async {
    final usecase = ref.read(fetchRootFoldersProvider);

    final result = await usecase.execute(limit: limit, offset: offset);
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
  Future<List<FolderEntity>> build({required int? parentId, required int limit, required int offset}) async {
    return _load(parentId, limit, offset);
  }

  Future<List<FolderEntity>> _load(int? parentId, int limit, int offset) async {
    final usecase = ref.read(fetchFoldersByParentProvider);

    final result = await usecase.execute(parentId: parentId, limit: limit, offset: offset);
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
    final result = await usecase.execute(folder);

    result.fold(
          (f) => throw Exception(f.message),
          (_) {
        if (!ref.mounted) return;

        folder.parentId == null
            ? ref.invalidate(rootFoldersProvider(limit: 10, offset: 0))
            : ref.invalidate(foldersByParentProvider(parentId: folder.parentId!, limit: 20, offset: 0));
      },
    );
  }

  // DELETE
  Future<void> delete(int folderId, int? parentId) async {
    final usecase = ref.read(deleteFolderProvider);
    final result = await usecase.execute(folderId);

    result.fold(
          (f) => throw Exception(f.message),
          (_) {
        if (!ref.mounted) return;

        parentId == null
            ? ref.invalidate(rootFoldersProvider)
            : ref.invalidate(foldersByParentProvider(parentId: parentId, limit: 20, offset: 0));
      },
    );
  }

  // RENAME
  Future<void> rename(FolderEntity folder, String newName) async {
    final usecase = ref.read(renameFolderProvider);
    final result = await usecase.execute(folder.id, newName);

    result.fold(
          (f) => throw Exception(f.message),
          (_) {
        if (!ref.mounted) return;

        folder.parentId == null
            ? ref.invalidate(rootFoldersProvider)
            : ref.invalidate(foldersByParentProvider(parentId: folder.parentId!, limit: 20, offset: 0));
      },
    );
  }
}
