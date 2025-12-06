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

String _$fetchRootFoldersHash() => r'b0280e3f8f8a5c56323c846f90ad61594e19caab';

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
    r'aacf8751fbb37f45c4fc284487d3d207933e66c9';

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

String _$createFolderHash() => r'4a49b8faf27f4bde6d86c3ae6a59b03175898bc8';

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

String _$deleteFolderHash() => r'7a96b2fff92dd918808442a203364d803faf44f2';

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

String _$renameFolderHash() => r'236476d6e462dac3ca92ae41b087f128d32d429a';

/// Root folders provider

@ProviderFor(RootFolders)
const rootFoldersProvider = RootFoldersProvider._();

/// Root folders provider
final class RootFoldersProvider
    extends $AsyncNotifierProvider<RootFolders, List<FolderEntity>> {
  /// Root folders provider
  const RootFoldersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rootFoldersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rootFoldersHash();

  @$internal
  @override
  RootFolders create() => RootFolders();
}

String _$rootFoldersHash() => r'f02a554e53f38c6556f2628729b8512bbf989974';

/// Root folders provider

abstract class _$RootFolders extends $AsyncNotifier<List<FolderEntity>> {
  FutureOr<List<FolderEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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
    required int super.argument,
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
        '($argument)';
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

String _$foldersByParentHash() => r'a7a13dd6fab981438d2ace80bca74c518c8aff81';

/// Folders by parent ID provider

final class FoldersByParentFamily extends $Family
    with
        $ClassFamilyOverride<
          FoldersByParent,
          AsyncValue<List<FolderEntity>>,
          List<FolderEntity>,
          FutureOr<List<FolderEntity>>,
          int
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

  FoldersByParentProvider call(int parentId) =>
      FoldersByParentProvider._(argument: parentId, from: this);

  @override
  String toString() => r'foldersByParentProvider';
}

/// Folders by parent ID provider

abstract class _$FoldersByParent extends $AsyncNotifier<List<FolderEntity>> {
  late final _$args = ref.$arg as int;
  int get parentId => _$args;

  FutureOr<List<FolderEntity>> build(int parentId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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

String _$folderControllerHash() => r'0694df32623d9699ddf138792ec700d16af1d9e7';

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
