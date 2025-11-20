// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Notes)
const notesProvider = NotesProvider._();

final class NotesProvider
    extends $AsyncNotifierProvider<Notes, List<NoteEntity>> {
  const NotesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notesHash();

  @$internal
  @override
  Notes create() => Notes();
}

String _$notesHash() => r'e011b2d27e025b90600b1626d718f805f1dd8ccd';

abstract class _$Notes extends $AsyncNotifier<List<NoteEntity>> {
  FutureOr<List<NoteEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<NoteEntity>>, List<NoteEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<NoteEntity>>, List<NoteEntity>>,
              AsyncValue<List<NoteEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
