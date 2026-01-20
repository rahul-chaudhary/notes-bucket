// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'bc01ce831003458d5c4ce07cacead2efc4222451';

@ProviderFor(noteRemoteDatasource)
const noteRemoteDatasourceProvider = NoteRemoteDatasourceProvider._();

final class NoteRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<NoteRemoteDatasource>,
          NoteRemoteDatasource,
          FutureOr<NoteRemoteDatasource>
        >
    with
        $FutureModifier<NoteRemoteDatasource>,
        $FutureProvider<NoteRemoteDatasource> {
  const NoteRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteRemoteDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<NoteRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<NoteRemoteDatasource> create(Ref ref) {
    return noteRemoteDatasource(ref);
  }
}

String _$noteRemoteDatasourceHash() =>
    r'06c6ec394ff07bf9087bbffc9d9a830b879fdbee';

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

String _$addNoteHash() => r'9bbc7489d30edcd168ae52a0459ab1e47d8663b2';

@ProviderFor(fetchNotesByFolderIdUseCase)
const fetchNotesByFolderIdUseCaseProvider =
    FetchNotesByFolderIdUseCaseProvider._();

final class FetchNotesByFolderIdUseCaseProvider
    extends
        $FunctionalProvider<
          FetchNotesByFolderId,
          FetchNotesByFolderId,
          FetchNotesByFolderId
        >
    with $Provider<FetchNotesByFolderId> {
  const FetchNotesByFolderIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchNotesByFolderIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchNotesByFolderIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchNotesByFolderId> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchNotesByFolderId create(Ref ref) {
    return fetchNotesByFolderIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchNotesByFolderId value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchNotesByFolderId>(value),
    );
  }
}

String _$fetchNotesByFolderIdUseCaseHash() =>
    r'1e35f5c4555c03149df2708f5e0fb4c26416b5ed';

@ProviderFor(fetchNoteByIdUseCase)
const fetchNoteByIdUseCaseProvider = FetchNoteByIdUseCaseProvider._();

final class FetchNoteByIdUseCaseProvider
    extends $FunctionalProvider<FetchNoteById, FetchNoteById, FetchNoteById>
    with $Provider<FetchNoteById> {
  const FetchNoteByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchNoteByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchNoteByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchNoteById> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchNoteById create(Ref ref) {
    return fetchNoteByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchNoteById value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchNoteById>(value),
    );
  }
}

String _$fetchNoteByIdUseCaseHash() =>
    r'67e468aa0dbb21c0bb0d29a3db7599cbc46b0d36';

@ProviderFor(updateNote)
const updateNoteProvider = UpdateNoteProvider._();

final class UpdateNoteProvider
    extends $FunctionalProvider<UpdateNote, UpdateNote, UpdateNote>
    with $Provider<UpdateNote> {
  const UpdateNoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateNoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateNoteHash();

  @$internal
  @override
  $ProviderElement<UpdateNote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdateNote create(Ref ref) {
    return updateNote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateNote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateNote>(value),
    );
  }
}

String _$updateNoteHash() => r'0894648c2b565501199a617215951d2edc0c7d35';

@ProviderFor(deleteNote)
const deleteNoteProvider = DeleteNoteProvider._();

final class DeleteNoteProvider
    extends $FunctionalProvider<DeleteNote, DeleteNote, DeleteNote>
    with $Provider<DeleteNote> {
  const DeleteNoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteNoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteNoteHash();

  @$internal
  @override
  $ProviderElement<DeleteNote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteNote create(Ref ref) {
    return deleteNote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteNote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteNote>(value),
    );
  }
}

String _$deleteNoteHash() => r'117cb8bb696d514abd41df8da47263d67b04d06d';

@ProviderFor(fetchAllNotesUseCase)
const fetchAllNotesUseCaseProvider = FetchAllNotesUseCaseProvider._();

final class FetchAllNotesUseCaseProvider
    extends $FunctionalProvider<FetchAllNotes, FetchAllNotes, FetchAllNotes>
    with $Provider<FetchAllNotes> {
  const FetchAllNotesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchAllNotesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchAllNotesUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchAllNotes> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FetchAllNotes create(Ref ref) {
    return fetchAllNotesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchAllNotes value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchAllNotes>(value),
    );
  }
}

String _$fetchAllNotesUseCaseHash() =>
    r'743795adf8204e254207ce96e5ea7d81598390e5';

@ProviderFor(fetchNotesCountByFolderIdUseCase)
const fetchNotesCountByFolderIdUseCaseProvider =
    FetchNotesCountByFolderIdUseCaseProvider._();

final class FetchNotesCountByFolderIdUseCaseProvider
    extends
        $FunctionalProvider<
          FetchNotesCountByFolderId,
          FetchNotesCountByFolderId,
          FetchNotesCountByFolderId
        >
    with $Provider<FetchNotesCountByFolderId> {
  const FetchNotesCountByFolderIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchNotesCountByFolderIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchNotesCountByFolderIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<FetchNotesCountByFolderId> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchNotesCountByFolderId create(Ref ref) {
    return fetchNotesCountByFolderIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchNotesCountByFolderId value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchNotesCountByFolderId>(value),
    );
  }
}

String _$fetchNotesCountByFolderIdUseCaseHash() =>
    r'45c3610bb922364ef097e788581a346f30f45142';

@ProviderFor(NoteController)
const noteControllerProvider = NoteControllerProvider._();

final class NoteControllerProvider
    extends $NotifierProvider<NoteController, void> {
  const NoteControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteControllerHash();

  @$internal
  @override
  NoteController create() => NoteController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$noteControllerHash() => r'e08c99aca5aabe7337f749f44e0a38bc817d41d5';

abstract class _$NoteController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(FetchNotesByFolderIdNotifier)
const fetchNotesByFolderIdProvider = FetchNotesByFolderIdNotifierFamily._();

final class FetchNotesByFolderIdNotifierProvider
    extends
        $AsyncNotifierProvider<FetchNotesByFolderIdNotifier, List<NoteEntity>> {
  const FetchNotesByFolderIdNotifierProvider._({
    required FetchNotesByFolderIdNotifierFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'fetchNotesByFolderIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchNotesByFolderIdNotifierHash();

  @override
  String toString() {
    return r'fetchNotesByFolderIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FetchNotesByFolderIdNotifier create() => FetchNotesByFolderIdNotifier();

  @override
  bool operator ==(Object other) {
    return other is FetchNotesByFolderIdNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchNotesByFolderIdNotifierHash() =>
    r'e1165ce201c1ace53c40a1a0c340822a609b12d4';

final class FetchNotesByFolderIdNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FetchNotesByFolderIdNotifier,
          AsyncValue<List<NoteEntity>>,
          List<NoteEntity>,
          FutureOr<List<NoteEntity>>,
          String?
        > {
  const FetchNotesByFolderIdNotifierFamily._()
    : super(
        retry: null,
        name: r'fetchNotesByFolderIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchNotesByFolderIdNotifierProvider call(String? folderId) =>
      FetchNotesByFolderIdNotifierProvider._(argument: folderId, from: this);

  @override
  String toString() => r'fetchNotesByFolderIdProvider';
}

abstract class _$FetchNotesByFolderIdNotifier
    extends $AsyncNotifier<List<NoteEntity>> {
  late final _$args = ref.$arg as String?;
  String? get folderId => _$args;

  FutureOr<List<NoteEntity>> build(String? folderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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

@ProviderFor(FetchNoteByIdNotifier)
const fetchNoteByIdProvider = FetchNoteByIdNotifierFamily._();

final class FetchNoteByIdNotifierProvider
    extends $AsyncNotifierProvider<FetchNoteByIdNotifier, NoteEntity?> {
  const FetchNoteByIdNotifierProvider._({
    required FetchNoteByIdNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchNoteByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchNoteByIdNotifierHash();

  @override
  String toString() {
    return r'fetchNoteByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FetchNoteByIdNotifier create() => FetchNoteByIdNotifier();

  @override
  bool operator ==(Object other) {
    return other is FetchNoteByIdNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchNoteByIdNotifierHash() =>
    r'b148fc9647c6e7fb615735e5f751a83f52510f9a';

final class FetchNoteByIdNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FetchNoteByIdNotifier,
          AsyncValue<NoteEntity?>,
          NoteEntity?,
          FutureOr<NoteEntity?>,
          String
        > {
  const FetchNoteByIdNotifierFamily._()
    : super(
        retry: null,
        name: r'fetchNoteByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchNoteByIdNotifierProvider call(String noteId) =>
      FetchNoteByIdNotifierProvider._(argument: noteId, from: this);

  @override
  String toString() => r'fetchNoteByIdProvider';
}

abstract class _$FetchNoteByIdNotifier extends $AsyncNotifier<NoteEntity?> {
  late final _$args = ref.$arg as String;
  String get noteId => _$args;

  FutureOr<NoteEntity?> build(String noteId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<NoteEntity?>, NoteEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<NoteEntity?>, NoteEntity?>,
              AsyncValue<NoteEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FetchAllNotesNotifier)
const fetchAllNotesProvider = FetchAllNotesNotifierFamily._();

final class FetchAllNotesNotifierProvider
    extends $AsyncNotifierProvider<FetchAllNotesNotifier, List<NoteEntity>> {
  const FetchAllNotesNotifierProvider._({
    required FetchAllNotesNotifierFamily super.from,
    required FetchAllNotesParams super.argument,
  }) : super(
         retry: null,
         name: r'fetchAllNotesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchAllNotesNotifierHash();

  @override
  String toString() {
    return r'fetchAllNotesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FetchAllNotesNotifier create() => FetchAllNotesNotifier();

  @override
  bool operator ==(Object other) {
    return other is FetchAllNotesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchAllNotesNotifierHash() =>
    r'e8a44dfac87bcd5e0927838386c015c6f33e52bf';

final class FetchAllNotesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FetchAllNotesNotifier,
          AsyncValue<List<NoteEntity>>,
          List<NoteEntity>,
          FutureOr<List<NoteEntity>>,
          FetchAllNotesParams
        > {
  const FetchAllNotesNotifierFamily._()
    : super(
        retry: null,
        name: r'fetchAllNotesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchAllNotesNotifierProvider call(FetchAllNotesParams params) =>
      FetchAllNotesNotifierProvider._(argument: params, from: this);

  @override
  String toString() => r'fetchAllNotesProvider';
}

abstract class _$FetchAllNotesNotifier
    extends $AsyncNotifier<List<NoteEntity>> {
  late final _$args = ref.$arg as FetchAllNotesParams;
  FetchAllNotesParams get params => _$args;

  FutureOr<List<NoteEntity>> build(FetchAllNotesParams params);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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

@ProviderFor(FetchNotesCountByFolderIdNotifier)
const fetchNotesCountByFolderIdProvider =
    FetchNotesCountByFolderIdNotifierFamily._();

final class FetchNotesCountByFolderIdNotifierProvider
    extends $AsyncNotifierProvider<FetchNotesCountByFolderIdNotifier, int> {
  const FetchNotesCountByFolderIdNotifierProvider._({
    required FetchNotesCountByFolderIdNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchNotesCountByFolderIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$fetchNotesCountByFolderIdNotifierHash();

  @override
  String toString() {
    return r'fetchNotesCountByFolderIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FetchNotesCountByFolderIdNotifier create() =>
      FetchNotesCountByFolderIdNotifier();

  @override
  bool operator ==(Object other) {
    return other is FetchNotesCountByFolderIdNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchNotesCountByFolderIdNotifierHash() =>
    r'01b69ce2821afa3f946be16b4f668f5b722c8b48';

final class FetchNotesCountByFolderIdNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FetchNotesCountByFolderIdNotifier,
          AsyncValue<int>,
          int,
          FutureOr<int>,
          String
        > {
  const FetchNotesCountByFolderIdNotifierFamily._()
    : super(
        retry: null,
        name: r'fetchNotesCountByFolderIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchNotesCountByFolderIdNotifierProvider call(String folderId) =>
      FetchNotesCountByFolderIdNotifierProvider._(
        argument: folderId,
        from: this,
      );

  @override
  String toString() => r'fetchNotesCountByFolderIdProvider';
}

abstract class _$FetchNotesCountByFolderIdNotifier extends $AsyncNotifier<int> {
  late final _$args = ref.$arg as String;
  String get folderId => _$args;

  FutureOr<int> build(String folderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
