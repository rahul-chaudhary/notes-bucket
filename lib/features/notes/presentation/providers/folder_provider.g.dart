// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Folders)
const foldersProvider = FoldersProvider._();

final class FoldersProvider extends $AsyncNotifierProvider<Folders, void> {
  const FoldersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'foldersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$foldersHash();

  @$internal
  @override
  Folders create() => Folders();
}

String _$foldersHash() => r'ae9011ef76d139ef3b07eea88f7fb355e4b6d141';

abstract class _$Folders extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
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
    r'cd18c6f846d35acc2077cb7275f895327c5e0776';

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
