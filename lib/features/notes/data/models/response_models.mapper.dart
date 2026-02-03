// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'response_models.dart';

class BulkFolderResModelMapper extends ClassMapperBase<BulkFolderResModel> {
  BulkFolderResModelMapper._();

  static BulkFolderResModelMapper? _instance;
  static BulkFolderResModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BulkFolderResModelMapper._());
      FolderMapper.ensureInitialized();
      FailedFolderModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BulkFolderResModel';

  static List<Folder>? _$folders(BulkFolderResModel v) => v.folders;
  static const Field<BulkFolderResModel, List<Folder>> _f$folders = Field(
    'folders',
    _$folders,
  );
  static List<FailedFolderModel>? _$failedFolders(BulkFolderResModel v) =>
      v.failedFolders;
  static const Field<BulkFolderResModel, List<FailedFolderModel>>
  _f$failedFolders = Field(
    'failedFolders',
    _$failedFolders,
    key: r'failed',
    opt: true,
  );

  @override
  final MappableFields<BulkFolderResModel> fields = const {
    #folders: _f$folders,
    #failedFolders: _f$failedFolders,
  };

  static BulkFolderResModel _instantiate(DecodingData data) {
    return BulkFolderResModel(
      folders: data.dec(_f$folders),
      failedFolders: data.dec(_f$failedFolders),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BulkFolderResModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BulkFolderResModel>(map);
  }

  static BulkFolderResModel fromJson(String json) {
    return ensureInitialized().decodeJson<BulkFolderResModel>(json);
  }
}

mixin BulkFolderResModelMappable {
  String toJson() {
    return BulkFolderResModelMapper.ensureInitialized()
        .encodeJson<BulkFolderResModel>(this as BulkFolderResModel);
  }

  Map<String, dynamic> toMap() {
    return BulkFolderResModelMapper.ensureInitialized()
        .encodeMap<BulkFolderResModel>(this as BulkFolderResModel);
  }

  BulkFolderResModelCopyWith<
    BulkFolderResModel,
    BulkFolderResModel,
    BulkFolderResModel
  >
  get copyWith =>
      _BulkFolderResModelCopyWithImpl<BulkFolderResModel, BulkFolderResModel>(
        this as BulkFolderResModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BulkFolderResModelMapper.ensureInitialized().stringifyValue(
      this as BulkFolderResModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return BulkFolderResModelMapper.ensureInitialized().equalsValue(
      this as BulkFolderResModel,
      other,
    );
  }

  @override
  int get hashCode {
    return BulkFolderResModelMapper.ensureInitialized().hashValue(
      this as BulkFolderResModel,
    );
  }
}

extension BulkFolderResModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BulkFolderResModel, $Out> {
  BulkFolderResModelCopyWith<$R, BulkFolderResModel, $Out>
  get $asBulkFolderResModel => $base.as(
    (v, t, t2) => _BulkFolderResModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class BulkFolderResModelCopyWith<
  $R,
  $In extends BulkFolderResModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Folder, FolderCopyWith<$R, Folder, Folder>>? get folders;
  ListCopyWith<
    $R,
    FailedFolderModel,
    FailedFolderModelCopyWith<$R, FailedFolderModel, FailedFolderModel>
  >?
  get failedFolders;
  $R call({List<Folder>? folders, List<FailedFolderModel>? failedFolders});
  BulkFolderResModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BulkFolderResModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BulkFolderResModel, $Out>
    implements BulkFolderResModelCopyWith<$R, BulkFolderResModel, $Out> {
  _BulkFolderResModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BulkFolderResModel> $mapper =
      BulkFolderResModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Folder, FolderCopyWith<$R, Folder, Folder>>? get folders =>
      $value.folders != null
      ? ListCopyWith(
          $value.folders!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(folders: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    FailedFolderModel,
    FailedFolderModelCopyWith<$R, FailedFolderModel, FailedFolderModel>
  >?
  get failedFolders => $value.failedFolders != null
      ? ListCopyWith(
          $value.failedFolders!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(failedFolders: v),
        )
      : null;
  @override
  $R call({Object? folders = $none, Object? failedFolders = $none}) => $apply(
    FieldCopyWithData({
      if (folders != $none) #folders: folders,
      if (failedFolders != $none) #failedFolders: failedFolders,
    }),
  );
  @override
  BulkFolderResModel $make(CopyWithData data) => BulkFolderResModel(
    folders: data.get(#folders, or: $value.folders),
    failedFolders: data.get(#failedFolders, or: $value.failedFolders),
  );

  @override
  BulkFolderResModelCopyWith<$R2, BulkFolderResModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BulkFolderResModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FailedFolderModelMapper extends ClassMapperBase<FailedFolderModel> {
  FailedFolderModelMapper._();

  static FailedFolderModelMapper? _instance;
  static FailedFolderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FailedFolderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FailedFolderModel';

  static String _$id(FailedFolderModel v) => v.id;
  static const Field<FailedFolderModel, String> _f$id = Field('id', _$id);
  static String _$error(FailedFolderModel v) => v.error;
  static const Field<FailedFolderModel, String> _f$error = Field(
    'error',
    _$error,
  );

  @override
  final MappableFields<FailedFolderModel> fields = const {
    #id: _f$id,
    #error: _f$error,
  };

  static FailedFolderModel _instantiate(DecodingData data) {
    return FailedFolderModel(id: data.dec(_f$id), error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static FailedFolderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FailedFolderModel>(map);
  }

  static FailedFolderModel fromJson(String json) {
    return ensureInitialized().decodeJson<FailedFolderModel>(json);
  }
}

mixin FailedFolderModelMappable {
  String toJson() {
    return FailedFolderModelMapper.ensureInitialized()
        .encodeJson<FailedFolderModel>(this as FailedFolderModel);
  }

  Map<String, dynamic> toMap() {
    return FailedFolderModelMapper.ensureInitialized()
        .encodeMap<FailedFolderModel>(this as FailedFolderModel);
  }

  FailedFolderModelCopyWith<
    FailedFolderModel,
    FailedFolderModel,
    FailedFolderModel
  >
  get copyWith =>
      _FailedFolderModelCopyWithImpl<FailedFolderModel, FailedFolderModel>(
        this as FailedFolderModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FailedFolderModelMapper.ensureInitialized().stringifyValue(
      this as FailedFolderModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return FailedFolderModelMapper.ensureInitialized().equalsValue(
      this as FailedFolderModel,
      other,
    );
  }

  @override
  int get hashCode {
    return FailedFolderModelMapper.ensureInitialized().hashValue(
      this as FailedFolderModel,
    );
  }
}

extension FailedFolderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FailedFolderModel, $Out> {
  FailedFolderModelCopyWith<$R, FailedFolderModel, $Out>
  get $asFailedFolderModel => $base.as(
    (v, t, t2) => _FailedFolderModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FailedFolderModelCopyWith<
  $R,
  $In extends FailedFolderModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? error});
  FailedFolderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FailedFolderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FailedFolderModel, $Out>
    implements FailedFolderModelCopyWith<$R, FailedFolderModel, $Out> {
  _FailedFolderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FailedFolderModel> $mapper =
      FailedFolderModelMapper.ensureInitialized();
  @override
  $R call({String? id, String? error}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (error != null) #error: error,
    }),
  );
  @override
  FailedFolderModel $make(CopyWithData data) => FailedFolderModel(
    id: data.get(#id, or: $value.id),
    error: data.get(#error, or: $value.error),
  );

  @override
  FailedFolderModelCopyWith<$R2, FailedFolderModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FailedFolderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

