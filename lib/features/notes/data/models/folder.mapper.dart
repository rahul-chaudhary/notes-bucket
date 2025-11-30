// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'folder.dart';

class FolderMapper extends ClassMapperBase<Folder> {
  FolderMapper._();

  static FolderMapper? _instance;
  static FolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FolderMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Folder';

  static int _$id(Folder v) => v.id;
  static const Field<Folder, int> _f$id = Field('id', _$id);
  static int? _$parentId(Folder v) => v.parentId;
  static const Field<Folder, int> _f$parentId = Field(
    'parentId',
    _$parentId,
    opt: true,
  );
  static String _$name(Folder v) => v.name;
  static const Field<Folder, String> _f$name = Field('name', _$name);
  static DateTime _$createdAt(Folder v) => v.createdAt;
  static const Field<Folder, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(Folder v) => v.updatedAt;
  static const Field<Folder, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );

  @override
  final MappableFields<Folder> fields = const {
    #id: _f$id,
    #parentId: _f$parentId,
    #name: _f$name,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static Folder _instantiate(DecodingData data) {
    return Folder(
      id: data.dec(_f$id),
      parentId: data.dec(_f$parentId),
      name: data.dec(_f$name),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Folder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Folder>(map);
  }

  static Folder fromJson(String json) {
    return ensureInitialized().decodeJson<Folder>(json);
  }
}

mixin FolderMappable {
  String toJson() {
    return FolderMapper.ensureInitialized().encodeJson<Folder>(this as Folder);
  }

  Map<String, dynamic> toMap() {
    return FolderMapper.ensureInitialized().encodeMap<Folder>(this as Folder);
  }

  FolderCopyWith<Folder, Folder, Folder> get copyWith =>
      _FolderCopyWithImpl<Folder, Folder>(this as Folder, $identity, $identity);
  @override
  String toString() {
    return FolderMapper.ensureInitialized().stringifyValue(this as Folder);
  }

  @override
  bool operator ==(Object other) {
    return FolderMapper.ensureInitialized().equalsValue(this as Folder, other);
  }

  @override
  int get hashCode {
    return FolderMapper.ensureInitialized().hashValue(this as Folder);
  }
}

extension FolderValueCopy<$R, $Out> on ObjectCopyWith<$R, Folder, $Out> {
  FolderCopyWith<$R, Folder, $Out> get $asFolder =>
      $base.as((v, t, t2) => _FolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FolderCopyWith<$R, $In extends Folder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    int? parentId,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  FolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FolderCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Folder, $Out>
    implements FolderCopyWith<$R, Folder, $Out> {
  _FolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Folder> $mapper = FolderMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    Object? parentId = $none,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (parentId != $none) #parentId: parentId,
      if (name != null) #name: name,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  Folder $make(CopyWithData data) => Folder(
    id: data.get(#id, or: $value.id),
    parentId: data.get(#parentId, or: $value.parentId),
    name: data.get(#name, or: $value.name),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  FolderCopyWith<$R2, Folder, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

