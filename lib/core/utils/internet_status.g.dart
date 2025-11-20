// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InternetListener)
const internetListenerProvider = InternetListenerProvider._();

final class InternetListenerProvider
    extends $NotifierProvider<InternetListener, InternetStatus> {
  const InternetListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetListenerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetListenerHash();

  @$internal
  @override
  InternetListener create() => InternetListener();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternetStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternetStatus>(value),
    );
  }
}

String _$internetListenerHash() => r'3c61b6b884f058dfa480e2941e671bfe2e25b148';

abstract class _$InternetListener extends $Notifier<InternetStatus> {
  InternetStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<InternetStatus, InternetStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InternetStatus, InternetStatus>,
              InternetStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
