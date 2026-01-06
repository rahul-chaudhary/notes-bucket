// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorage)
const secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  const SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'39b6a2355a8398a2c25bb6e7dd3111ede1fc9c9b';

@ProviderFor(secureStorageHelper)
const secureStorageHelperProvider = SecureStorageHelperProvider._();

final class SecureStorageHelperProvider
    extends
        $FunctionalProvider<
          SecureStorageHelper,
          SecureStorageHelper,
          SecureStorageHelper
        >
    with $Provider<SecureStorageHelper> {
  const SecureStorageHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageHelperProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHelperHash();

  @$internal
  @override
  $ProviderElement<SecureStorageHelper> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageHelper create(Ref ref) {
    return secureStorageHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageHelper>(value),
    );
  }
}

String _$secureStorageHelperHash() =>
    r'8d9ea2b5a1e6aa9875028913e1217898b9eb5534';

@ProviderFor(SecureStorageDataNotifier)
const secureStorageDataProvider = SecureStorageDataNotifierProvider._();

final class SecureStorageDataNotifierProvider
    extends
        $AsyncNotifierProvider<SecureStorageDataNotifier, SecureStorageModel?> {
  const SecureStorageDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageDataProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageDataNotifierHash();

  @$internal
  @override
  SecureStorageDataNotifier create() => SecureStorageDataNotifier();
}

String _$secureStorageDataNotifierHash() =>
    r'f3e57351ca572b5d35416b6454e463a386813d22';

abstract class _$SecureStorageDataNotifier
    extends $AsyncNotifier<SecureStorageModel?> {
  FutureOr<SecureStorageModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SecureStorageModel?>, SecureStorageModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SecureStorageModel?>, SecureStorageModel?>,
              AsyncValue<SecureStorageModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
