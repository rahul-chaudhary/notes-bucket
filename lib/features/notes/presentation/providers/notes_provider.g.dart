// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Notes)
const notesProvider = NotesProvider._();

final class NotesProvider extends $AsyncNotifierProvider<Notes, void> {
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

String _$notesHash() => r'11510323bc83a77b855c07bb5c4a916dd829aaa0';

abstract class _$Notes extends $AsyncNotifier<void> {
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

@ProviderFor(databaseHelper)
const databaseHelperProvider = DatabaseHelperProvider._();

final class DatabaseHelperProvider
    extends $FunctionalProvider<DatabaseHelper, DatabaseHelper, DatabaseHelper>
    with $Provider<DatabaseHelper> {
  const DatabaseHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseHelperProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHelperHash();

  @$internal
  @override
  $ProviderElement<DatabaseHelper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DatabaseHelper create(Ref ref) {
    return databaseHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseHelper>(value),
    );
  }
}

String _$databaseHelperHash() => r'd9a91b257d3ed9a4f2d87bd829e17dc900678685';

@ProviderFor(noteLocalDataSource)
const noteLocalDataSourceProvider = NoteLocalDataSourceProvider._();

final class NoteLocalDataSourceProvider
    extends
        $FunctionalProvider<
          NoteLocalDataSource,
          NoteLocalDataSource,
          NoteLocalDataSource
        >
    with $Provider<NoteLocalDataSource> {
  const NoteLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<NoteLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NoteLocalDataSource create(Ref ref) {
    return noteLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoteLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoteLocalDataSource>(value),
    );
  }
}

String _$noteLocalDataSourceHash() =>
    r'4280970c886992a508391badcdc670928cbf2d25';

@ProviderFor(noteRepository)
const noteRepositoryProvider = NoteRepositoryProvider._();

final class NoteRepositoryProvider
    extends $FunctionalProvider<NoteRepository, NoteRepository, NoteRepository>
    with $Provider<NoteRepository> {
  const NoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteRepositoryHash();

  @$internal
  @override
  $ProviderElement<NoteRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NoteRepository create(Ref ref) {
    return noteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoteRepository>(value),
    );
  }
}

String _$noteRepositoryHash() => r'e91bf92e34e6bd93205012772a11e48156538c94';

@ProviderFor(addNote)
const addNoteProvider = AddNoteProvider._();

final class AddNoteProvider
    extends $FunctionalProvider<AddNote, AddNote, AddNote>
    with $Provider<AddNote> {
  const AddNoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addNoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addNoteHash();

  @$internal
  @override
  $ProviderElement<AddNote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddNote create(Ref ref) {
    return addNote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddNote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddNote>(value),
    );
  }
}

String _$addNoteHash() => r'444d84fa503d424475036c6e72b1168afc656f62';
