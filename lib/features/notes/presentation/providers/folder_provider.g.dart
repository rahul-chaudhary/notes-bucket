// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for root folders list

@ProviderFor(RootFolders)
const rootFoldersProvider = RootFoldersProvider._();

/// Provider for root folders list
final class RootFoldersProvider
    extends $AsyncNotifierProvider<RootFolders, List<FolderEntity>> {
  /// Provider for root folders list
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

String _$rootFoldersHash() => r'6ceae8cf3f712c7694eea517a95f444405bcf127';

/// Provider for root folders list

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

/// Provider for folders by parent ID

@ProviderFor(FoldersByParent)
const foldersByParentProvider = FoldersByParentFamily._();

/// Provider for folders by parent ID
final class FoldersByParentProvider
    extends $AsyncNotifierProvider<FoldersByParent, List<FolderEntity>> {
  /// Provider for folders by parent ID
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

String _$foldersByParentHash() => r'2c315f9eac0d16cd045946e828a54d46e4b43180';

/// Provider for folders by parent ID

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

  /// Provider for folders by parent ID

  FoldersByParentProvider call(int parentId) =>
      FoldersByParentProvider._(argument: parentId, from: this);

  @override
  String toString() => r'foldersByParentProvider';
}

/// Provider for folders by parent ID

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

/// Separate controller for folder mutations
/// Separate controller for folder mutations

@ProviderFor(FolderController)
const folderControllerProvider = FolderControllerProvider._();

/// Separate controller for folder mutations
/// Separate controller for folder mutations
final class FolderControllerProvider
    extends $NotifierProvider<FolderController, void> {
  /// Separate controller for folder mutations
  /// Separate controller for folder mutations
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

String _$folderControllerHash() => r'7fad3d2404c32048db33c73e8788a6f841c9097e';

/// Separate controller for folder mutations
/// Separate controller for folder mutations

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

String _$folderRepositoryHash() => r'9f1a078f12197ec6db9e1a6ef493815dac8caae6';

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

String _$createFolderHash() => r'72a236efcef482cc59a208aaf583e608473b539e';
