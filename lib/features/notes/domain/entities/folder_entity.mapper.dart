// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'folder_entity.dart';

class FolderEntityMapper extends ClassMapperBase<FolderEntity> {
  FolderEntityMapper._();

  static FolderEntityMapper? _instance;
  static FolderEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FolderEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FolderEntity';

  static String _$id(FolderEntity v) => v.id;
  static const Field<FolderEntity, String> _f$id = Field('id', _$id);
  static String? _$parentId(FolderEntity v) => v.parentId;
  static const Field<FolderEntity, String> _f$parentId = Field(
    'parentId',
    _$parentId,
    opt: true,
  );
  static String _$name(FolderEntity v) => v.name;
  static const Field<FolderEntity, String> _f$name = Field('name', _$name);
  static bool _$synced(FolderEntity v) => v.synced;
  static const Field<FolderEntity, bool> _f$synced = Field('synced', _$synced);
  static int _$retryCount(FolderEntity v) => v.retryCount;
  static const Field<FolderEntity, int> _f$retryCount = Field(
    'retryCount',
    _$retryCount,
  );
  static DateTime? _$createdAt(FolderEntity v) => v.createdAt;
  static const Field<FolderEntity, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(FolderEntity v) => v.updatedAt;
  static const Field<FolderEntity, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<FolderEntity> fields = const {
    #id: _f$id,
    #parentId: _f$parentId,
    #name: _f$name,
    #synced: _f$synced,
    #retryCount: _f$retryCount,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static FolderEntity _instantiate(DecodingData data) {
    return FolderEntity(
      id: data.dec(_f$id),
      parentId: data.dec(_f$parentId),
      name: data.dec(_f$name),
      synced: data.dec(_f$synced),
      retryCount: data.dec(_f$retryCount),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FolderEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FolderEntity>(map);
  }

  static FolderEntity fromJson(String json) {
    return ensureInitialized().decodeJson<FolderEntity>(json);
  }
}

mixin FolderEntityMappable {
  String toJson() {
    return FolderEntityMapper.ensureInitialized().encodeJson<FolderEntity>(
      this as FolderEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return FolderEntityMapper.ensureInitialized().encodeMap<FolderEntity>(
      this as FolderEntity,
    );
  }

  FolderEntityCopyWith<FolderEntity, FolderEntity, FolderEntity> get copyWith =>
      _FolderEntityCopyWithImpl<FolderEntity, FolderEntity>(
        this as FolderEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FolderEntityMapper.ensureInitialized().stringifyValue(
      this as FolderEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return FolderEntityMapper.ensureInitialized().equalsValue(
      this as FolderEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return FolderEntityMapper.ensureInitialized().hashValue(
      this as FolderEntity,
    );
  }
}

extension FolderEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FolderEntity, $Out> {
  FolderEntityCopyWith<$R, FolderEntity, $Out> get $asFolderEntity =>
      $base.as((v, t, t2) => _FolderEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FolderEntityCopyWith<$R, $In extends FolderEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? parentId,
    String? name,
    bool? synced,
    int? retryCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  FolderEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FolderEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FolderEntity, $Out>
    implements FolderEntityCopyWith<$R, FolderEntity, $Out> {
  _FolderEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FolderEntity> $mapper =
      FolderEntityMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? parentId = $none,
    String? name,
    bool? synced,
    int? retryCount,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (parentId != $none) #parentId: parentId,
      if (name != null) #name: name,
      if (synced != null) #synced: synced,
      if (retryCount != null) #retryCount: retryCount,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  FolderEntity $make(CopyWithData data) => FolderEntity(
    id: data.get(#id, or: $value.id),
    parentId: data.get(#parentId, or: $value.parentId),
    name: data.get(#name, or: $value.name),
    synced: data.get(#synced, or: $value.synced),
    retryCount: data.get(#retryCount, or: $value.retryCount),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  FolderEntityCopyWith<$R2, FolderEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FolderEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

