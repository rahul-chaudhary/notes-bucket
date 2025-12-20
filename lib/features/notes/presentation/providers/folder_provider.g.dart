// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(folderLocalDataSource)
const folderLocalDataSourceProvider = FolderLocalDataSourceProvider._();

final class FolderLocalDataSourceProvider
    extends
        $FunctionalProvider<
          FolderLocalDataSource,
          FolderLocalDataSource,
          FolderLocalDataSource
        >
    with $Provider<FolderLocalDataSource> {
  const FolderLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'folderLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$folderLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<FolderLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FolderLocalDataSource create(Ref ref) {
    return folderLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FolderLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FolderLocalDataSource>(value),
    );
  }
}

String _$folderLocalDataSourceHash() =>
    r'91d972a57d97a4336a315c82ca7a71a7056771b1';

@ProviderFor(folderRepository)
const folderRepositoryProvider = FolderRepositoryProvider._();

final class FolderRepositoryProvider
    extends
        $FunctionalProvider<
          FolderRepository,
          FolderRepository,
          FolderRepository
        >
    with $Provider<FolderRepository> {
  const FolderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'folderRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$folderRepositoryHash();

  @$internal
  @override
  $ProviderElement<FolderRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FolderRepository create(Ref ref) {
    return folderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FolderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FolderRepository>(value),
    );
  }
}

String _$folderRepositoryHash() => r'98bc0ff7b61d26cc5ed931587b9f1594836c463d';

@ProviderFor(fetchRootFolders)
const fetchRootFoldersProvider = FetchRootFoldersProvider._();

final class FetchRootFoldersProvider
    extends
        $FunctionalProvider<
          FetchRootFolders,
          FetchRootFolders,
          FetchRootFolders
        >
    with $Provider<FetchRootFolders> {
  const FetchRootFoldersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchRootFoldersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchRootFoldersHash();

  @$internal
  @override
  $ProviderElement<FetchRootFolders> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchRootFolders create(Ref ref) {
    return fetchRootFolders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchRootFolders value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchRootFolders>(value),
    );
  }
}

String _$fetchRootFoldersHash() => r'111e8587ad77d6c632eae57a17c4454e4ed2b6ac';

@ProviderFor(fetchFoldersByParent)
const fetchFoldersByParentProvider = FetchFoldersByParentProvider._();

final class FetchFoldersByParentProvider
    extends
        $FunctionalProvider<
          FetchFoldersByParentId,
          FetchFoldersByParentId,
          FetchFoldersByParentId
        >
    with $Provider<FetchFoldersByParentId> {
  const FetchFoldersByParentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchFoldersByParentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchFoldersByParentHash();

  @$internal
  @override
  $ProviderElement<FetchFoldersByParentId> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchFoldersByParentId create(Ref ref) {
    return fetchFoldersByParent(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchFoldersByParentId value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchFoldersByParentId>(value),
    );
  }
}

String _$fetchFoldersByParentHash() =>
    r'188f056558b9c2d670dcf5c0e628dd9a98806b6e';

@ProviderFor(createFolder)
const createFolderProvider = CreateFolderProvider._();

final class CreateFolderProvider
    extends $FunctionalProvider<CreateFolder, CreateFolder, CreateFolder>
    with $Provider<CreateFolder> {
  const CreateFolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createFolderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createFolderHash();

  @$internal
  @override
  $ProviderElement<CreateFolder> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreateFolder create(Ref ref) {
    return createFolder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateFolder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateFolder>(value),
    );
  }
}

String _$createFolderHash() => r'e9d3f204482cd3d6c29c2462e0f2b9e7787aa363';

@ProviderFor(deleteFolder)
const deleteFolderProvider = DeleteFolderProvider._();

final class DeleteFolderProvider
    extends $FunctionalProvider<DeleteFolder, DeleteFolder, DeleteFolder>
    with $Provider<DeleteFolder> {
  const DeleteFolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteFolderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteFolderHash();

  @$internal
  @override
  $ProviderElement<DeleteFolder> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteFolder create(Ref ref) {
    return deleteFolder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteFolder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteFolder>(value),
    );
  }
}

String _$deleteFolderHash() => r'd2115f036f5d1e3551a5f8cb6dd257955dcb7b21';

@ProviderFor(renameFolder)
const renameFolderProvider = RenameFolderProvider._();

final class RenameFolderProvider
    extends $FunctionalProvider<RenameFolder, RenameFolder, RenameFolder>
    with $Provider<RenameFolder> {
  const RenameFolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'renameFolderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$renameFolderHash();

  @$internal
  @override
  $ProviderElement<RenameFolder> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RenameFolder create(Ref ref) {
    return renameFolder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RenameFolder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RenameFolder>(value),
    );
  }
}

String _$renameFolderHash() => r'a795de132933a78ce50fbe7008b05fa442b523a0';

@ProviderFor(getCurrentPath)
const getCurrentPathProvider = GetCurrentPathProvider._();

final class GetCurrentPathProvider
    extends $FunctionalProvider<GetCurrentPath, GetCurrentPath, GetCurrentPath>
    with $Provider<GetCurrentPath> {
  const GetCurrentPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentPathHash();

  @$internal
  @override
  $ProviderElement<GetCurrentPath> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetCurrentPath create(Ref ref) {
    return getCurrentPath(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentPath value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentPath>(value),
    );
  }
}

String _$getCurrentPathHash() => r'12663e998945369bdcc2e267f0016aeccfe7d471';

@ProviderFor(fetchFolderById)
const fetchFolderByIdProvider = FetchFolderByIdProvider._();

final class FetchFolderByIdProvider
    extends
        $FunctionalProvider<FetchFolderById, FetchFolderById, FetchFolderById>
    with $Provider<FetchFolderById> {
  const FetchFolderByIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchFolderByIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchFolderByIdHash();

  @$internal
  @override
  $ProviderElement<FetchFolderById> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchFolderById create(Ref ref) {
    return fetchFolderById(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchFolderById value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchFolderById>(value),
    );
  }
}

String _$fetchFolderByIdHash() => r'e6725ac664c1dab62dc268316a91afa4002e18f0';

/// Root folders provider

@ProviderFor(RootFolders)
const rootFoldersProvider = RootFoldersFamily._();

/// Root folders provider
final class RootFoldersProvider
    extends $AsyncNotifierProvider<RootFolders, List<FolderEntity>> {
  /// Root folders provider
  const RootFoldersProvider._({
    required RootFoldersFamily super.from,
    required ({int limit, int offset}) super.argument,
  }) : super(
         retry: null,
         name: r'rootFoldersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rootFoldersHash();

  @override
  String toString() {
    return r'rootFoldersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RootFolders create() => RootFolders();

  @override
  bool operator ==(Object other) {
    return other is RootFoldersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rootFoldersHash() => r'1bff8c320635969af983f563d1cf344998b442d8';

/// Root folders provider

final class RootFoldersFamily extends $Family
    with
        $ClassFamilyOverride<
          RootFolders,
          AsyncValue<List<FolderEntity>>,
          List<FolderEntity>,
          FutureOr<List<FolderEntity>>,
          ({int limit, int offset})
        > {
  const RootFoldersFamily._()
    : super(
        retry: null,
        name: r'rootFoldersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Root folders provider

  RootFoldersProvider call({required int limit, required int offset}) =>
      RootFoldersProvider._(
        argument: (limit: limit, offset: offset),
        from: this,
      );

  @override
  String toString() => r'rootFoldersProvider';
}

/// Root folders provider

abstract class _$RootFolders extends $AsyncNotifier<List<FolderEntity>> {
  late final _$args = ref.$arg as ({int limit, int offset});
  int get limit => _$args.limit;
  int get offset => _$args.offset;

  FutureOr<List<FolderEntity>> build({required int limit, required int offset});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(limit: _$args.limit, offset: _$args.offset);
    final ref =
        this.ref as $Ref<AsyncValue<List<FolderEntity>>, List<FolderEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FolderEntity>>, List<FolderEntity>>,
              AsyncValue<List<FolderEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Folders by parent ID provider

@ProviderFor(FoldersByParent)
const foldersByParentProvider = FoldersByParentFamily._();

/// Folders by parent ID provider
final class FoldersByParentProvider
    extends $AsyncNotifierProvider<FoldersByParent, List<FolderEntity>> {
  /// Folders by parent ID provider
  const FoldersByParentProvider._({
    required FoldersByParentFamily super.from,
    required ({int? parentId, int limit, int offset}) super.argument,
  }) : super(
         retry: null,
         name: r'foldersByParentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$foldersByParentHash();

  @override
  String toString() {
    return r'foldersByParentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  FoldersByParent create() => FoldersByParent();

  @override
  bool operator ==(Object other) {
    return other is FoldersByParentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$foldersByParentHash() => r'39198ad0c904d28279e40c8f0ec7230b8e641f3f';

/// Folders by parent ID provider

final class FoldersByParentFamily extends $Family
    with
        $ClassFamilyOverride<
          FoldersByParent,
          AsyncValue<List<FolderEntity>>,
          List<FolderEntity>,
          FutureOr<List<FolderEntity>>,
          ({int? parentId, int limit, int offset})
        > {
  const FoldersByParentFamily._()
    : super(
        retry: null,
        name: r'foldersByParentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Folders by parent ID provider

  FoldersByParentProvider call({
    required int? parentId,
    required int limit,
    required int offset,
  }) => FoldersByParentProvider._(
    argument: (parentId: parentId, limit: limit, offset: offset),
    from: this,
  );

  @override
  String toString() => r'foldersByParentProvider';
}

/// Folders by parent ID provider

abstract class _$FoldersByParent extends $AsyncNotifier<List<FolderEntity>> {
  late final _$args = ref.$arg as ({int? parentId, int limit, int offset});
  int? get parentId => _$args.parentId;
  int get limit => _$args.limit;
  int get offset => _$args.offset;

  FutureOr<List<FolderEntity>> build({
    required int? parentId,
    required int limit,
    required int offset,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      parentId: _$args.parentId,
      limit: _$args.limit,
      offset: _$args.offset,
    );
    final ref =
        this.ref as $Ref<AsyncValue<List<FolderEntity>>, List<FolderEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FolderEntity>>, List<FolderEntity>>,
              AsyncValue<List<FolderEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller for mutations (create/delete/rename)

@ProviderFor(FolderController)
const folderControllerProvider = FolderControllerProvider._();

/// Controller for mutations (create/delete/rename)
final class FolderControllerProvider
    extends $NotifierProvider<FolderController, void> {
  /// Controller for mutations (create/delete/rename)
  const FolderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'folderControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$folderControllerHash();

  @$internal
  @override
  FolderController create() => FolderController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$folderControllerHash() => r'573e18f10c9f2f2e932f62c5ce74fc77f338cf97';

/// Controller for mutations (create/delete/rename)

abstract class _$FolderController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(CurrentPath)
const currentPathProvider = CurrentPathFamily._();

final class CurrentPathProvider
    extends $AsyncNotifierProvider<CurrentPath, String> {
  const CurrentPathProvider._({
    required CurrentPathFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'currentPathProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentPathHash();

  @override
  String toString() {
    return r'currentPathProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CurrentPath create() => CurrentPath();

  @override
  bool operator ==(Object other) {
    return other is CurrentPathProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentPathHash() => r'eb3dcd59f484c5ca2e4dd266ba09429c5bd7bea0';

final class CurrentPathFamily extends $Family
    with
        $ClassFamilyOverride<
          CurrentPath,
          AsyncValue<String>,
          String,
          FutureOr<String>,
          int?
        > {
  const CurrentPathFamily._()
    : super(
        retry: null,
        name: r'currentPathProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CurrentPathProvider call({required int? parentId}) =>
      CurrentPathProvider._(argument: parentId, from: this);

  @override
  String toString() => r'currentPathProvider';
}

abstract class _$CurrentPath extends $AsyncNotifier<String> {
  late final _$args = ref.$arg as int?;
  int? get parentId => _$args;

  FutureOr<String> build({required int? parentId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(parentId: _$args);
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Folder by Id provider

@ProviderFor(FolderById)
const folderByIdProvider = FolderByIdFamily._();

/// Folder by Id provider
final class FolderByIdProvider
    extends $AsyncNotifierProvider<FolderById, FolderEntity?> {
  /// Folder by Id provider
  const FolderByIdProvider._({
    required FolderByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'folderByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$folderByIdHash();

  @override
  String toString() {
    return r'folderByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FolderById create() => FolderById();

  @override
  bool operator ==(Object other) {
    return other is FolderByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$folderByIdHash() => r'11fdde6b102bbf17da07425d6548a98ec8c95233';

/// Folder by Id provider

final class FolderByIdFamily extends $Family
    with
        $ClassFamilyOverride<
          FolderById,
          AsyncValue<FolderEntity?>,
          FolderEntity?,
          FutureOr<FolderEntity?>,
          int
        > {
  const FolderByIdFamily._()
    : super(
        retry: null,
        name: r'folderByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Folder by Id provider

  FolderByIdProvider call(int folderId) =>
      FolderByIdProvider._(argument: folderId, from: this);

  @override
  String toString() => r'folderByIdProvider';
}

/// Folder by Id provider

abstract class _$FolderById extends $AsyncNotifier<FolderEntity?> {
  late final _$args = ref.$arg as int;
  int get folderId => _$args;

  FutureOr<FolderEntity?> build(int folderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<FolderEntity?>, FolderEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FolderEntity?>, FolderEntity?>,
              AsyncValue<FolderEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
