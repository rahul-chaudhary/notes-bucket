// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_note_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WarningText)
const warningTextProvider = WarningTextProvider._();

final class WarningTextProvider extends $NotifierProvider<WarningText, String> {
  const WarningTextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warningTextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warningTextHash();

  @$internal
  @override
  WarningText create() => WarningText();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$warningTextHash() => r'623c9427c146c6cf3966bfb4f2d7ae1bbb158d04';

abstract class _$WarningText extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
