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

String _$syncServiceHash() => r'569e241354b2a75b85e8d46d63404a759f388e58';
