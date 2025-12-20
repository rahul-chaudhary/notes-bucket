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

@ProviderFor(EditNoteLoadingState)
const editNoteLoadingStateProvider = EditNoteLoadingStateProvider._();

final class EditNoteLoadingStateProvider
    extends $NotifierProvider<EditNoteLoadingState, bool> {
  const EditNoteLoadingStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editNoteLoadingStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editNoteLoadingStateHash();

  @$internal
  @override
  EditNoteLoadingState create() => EditNoteLoadingState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$editNoteLoadingStateHash() =>
    r'391ad010a2fb59a97f945a37380971ce3ce920e1';

abstract class _$EditNoteLoadingState extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(EditNoteState)
const editNoteStateProvider = EditNoteStateProvider._();

final class EditNoteStateProvider
    extends $NotifierProvider<EditNoteState, NoteEntity?> {
  const EditNoteStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editNoteStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editNoteStateHash();

  @$internal
  @override
  EditNoteState create() => EditNoteState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoteEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoteEntity?>(value),
    );
  }
}

String _$editNoteStateHash() => r'158fd80c33fb9fbec2e48bfaea67e4fca05c9595';

abstract class _$EditNoteState extends $Notifier<NoteEntity?> {
  NoteEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoteEntity?, NoteEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NoteEntity?, NoteEntity?>,
              NoteEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
