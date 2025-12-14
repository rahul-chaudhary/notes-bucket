// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_all_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the currently selected parent folder ID for navigation

@ProviderFor(SelectedParentId)
const selectedParentIdProvider = SelectedParentIdProvider._();

/// Holds the currently selected parent folder ID for navigation
final class SelectedParentIdProvider
    extends $NotifierProvider<SelectedParentId, int?> {
  /// Holds the currently selected parent folder ID for navigation
  const SelectedParentIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedParentIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedParentIdHash();

  @$internal
  @override
  SelectedParentId create() => SelectedParentId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedParentIdHash() => r'35089e9b0c2d4888246ab24e28ddfb8ff752f54e';

/// Holds the currently selected parent folder ID for navigation

abstract class _$SelectedParentId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
