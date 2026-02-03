// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'note_entity.dart';

class NoteEntityMapper extends ClassMapperBase<NoteEntity> {
  NoteEntityMapper._();

  static NoteEntityMapper? _instance;
  static NoteEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteEntityMapper._());
      SyncStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NoteEntity';

  static String _$id(NoteEntity v) => v.id;
  static const Field<NoteEntity, String> _f$id = Field('id', _$id);
  static String _$folderId(NoteEntity v) => v.folderId;
  static const Field<NoteEntity, String> _f$folderId = Field(
    'folderId',
    _$folderId,
  );
  static String? _$title(NoteEntity v) => v.title;
  static const Field<NoteEntity, String> _f$title = Field('title', _$title);
  static String? _$content(NoteEntity v) => v.content;
  static const Field<NoteEntity, String> _f$content = Field(
    'content',
    _$content,
  );
  static SyncStatus _$syncStatus(NoteEntity v) => v.syncStatus;
  static const Field<NoteEntity, SyncStatus> _f$syncStatus = Field(
    'syncStatus',
    _$syncStatus,
  );
  static int _$retryCount(NoteEntity v) => v.retryCount;
  static const Field<NoteEntity, int> _f$retryCount = Field(
    'retryCount',
    _$retryCount,
  );
  static DateTime? _$createdAt(NoteEntity v) => v.createdAt;
  static const Field<NoteEntity, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(NoteEntity v) => v.updatedAt;
  static const Field<NoteEntity, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static DateTime? _$deletedAt(NoteEntity v) => v.deletedAt;
  static const Field<NoteEntity, DateTime> _f$deletedAt = Field(
    'deletedAt',
    _$deletedAt,
    opt: true,
  );

  @override
  final MappableFields<NoteEntity> fields = const {
    #id: _f$id,
    #folderId: _f$folderId,
    #title: _f$title,
    #content: _f$content,
    #syncStatus: _f$syncStatus,
    #retryCount: _f$retryCount,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #deletedAt: _f$deletedAt,
  };

  static NoteEntity _instantiate(DecodingData data) {
    return NoteEntity(
      id: data.dec(_f$id),
      folderId: data.dec(_f$folderId),
      title: data.dec(_f$title),
      content: data.dec(_f$content),
      syncStatus: data.dec(_f$syncStatus),
      retryCount: data.dec(_f$retryCount),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      deletedAt: data.dec(_f$deletedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NoteEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NoteEntity>(map);
  }

  static NoteEntity fromJson(String json) {
    return ensureInitialized().decodeJson<NoteEntity>(json);
  }
}

mixin NoteEntityMappable {
  String toJson() {
    return NoteEntityMapper.ensureInitialized().encodeJson<NoteEntity>(
      this as NoteEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return NoteEntityMapper.ensureInitialized().encodeMap<NoteEntity>(
      this as NoteEntity,
    );
  }

  NoteEntityCopyWith<NoteEntity, NoteEntity, NoteEntity> get copyWith =>
      _NoteEntityCopyWithImpl<NoteEntity, NoteEntity>(
        this as NoteEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NoteEntityMapper.ensureInitialized().stringifyValue(
      this as NoteEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return NoteEntityMapper.ensureInitialized().equalsValue(
      this as NoteEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return NoteEntityMapper.ensureInitialized().hashValue(this as NoteEntity);
  }
}

extension NoteEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NoteEntity, $Out> {
  NoteEntityCopyWith<$R, NoteEntity, $Out> get $asNoteEntity =>
      $base.as((v, t, t2) => _NoteEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NoteEntityCopyWith<$R, $In extends NoteEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? folderId,
    String? title,
    String? content,
    SyncStatus? syncStatus,
    int? retryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
  NoteEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NoteEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NoteEntity, $Out>
    implements NoteEntityCopyWith<$R, NoteEntity, $Out> {
  _NoteEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NoteEntity> $mapper =
      NoteEntityMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? folderId,
    Object? title = $none,
    Object? content = $none,
    SyncStatus? syncStatus,
    int? retryCount,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? deletedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (folderId != null) #folderId: folderId,
      if (title != $none) #title: title,
      if (content != $none) #content: content,
      if (syncStatus != null) #syncStatus: syncStatus,
      if (retryCount != null) #retryCount: retryCount,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (deletedAt != $none) #deletedAt: deletedAt,
    }),
  );
  @override
  NoteEntity $make(CopyWithData data) => NoteEntity(
    id: data.get(#id, or: $value.id),
    folderId: data.get(#folderId, or: $value.folderId),
    title: data.get(#title, or: $value.title),
    content: data.get(#content, or: $value.content),
    syncStatus: data.get(#syncStatus, or: $value.syncStatus),
    retryCount: data.get(#retryCount, or: $value.retryCount),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    deletedAt: data.get(#deletedAt, or: $value.deletedAt),
  );

  @override
  NoteEntityCopyWith<$R2, NoteEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NoteEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

