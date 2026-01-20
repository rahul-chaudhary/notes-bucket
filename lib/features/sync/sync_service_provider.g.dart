// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncService)
const syncServiceProvider = SyncServiceProvider._();

final class SyncServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<SyncService>,
          SyncService,
          FutureOr<SyncService>
        >
    with $FutureModifier<SyncService>, $FutureProvider<SyncService> {
  const SyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncServiceHash();

  @$internal
  @override
  $FutureProviderElement<SyncService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SyncService> create(Ref ref) {
    return syncService(ref);
  }
}

String _$syncServiceHash() => r'0f5956aa745da67ae75ef768963e7fc4749033cf';

@ProviderFor(SyncMonitor)
const syncMonitorProvider = SyncMonitorProvider._();

final class SyncMonitorProvider
    extends $NotifierProvider<SyncMonitor, SyncState> {
  const SyncMonitorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncMonitorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncMonitorHash();

  @$internal
  @override
  SyncMonitor create() => SyncMonitor();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncState>(value),
    );
  }
}

String _$syncMonitorHash() => r'1312ba4907c1e3147a4b1e8e480b777a67df19f6';

abstract class _$SyncMonitor extends $Notifier<SyncState> {
  SyncState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SyncState, SyncState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SyncState, SyncState>,
              SyncState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
