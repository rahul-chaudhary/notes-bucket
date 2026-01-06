// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'secure_storage_model.dart';

class SecureStorageModelMapper extends ClassMapperBase<SecureStorageModel> {
  SecureStorageModelMapper._();

  static SecureStorageModelMapper? _instance;
  static SecureStorageModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SecureStorageModelMapper._());
      AuthResponseModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SecureStorageModel';

  static bool _$isFirstLaunch(SecureStorageModel v) => v.isFirstLaunch;
  static const Field<SecureStorageModel, bool> _f$isFirstLaunch = Field(
    'isFirstLaunch',
    _$isFirstLaunch,
  );
  static AuthResponseModel? _$authResponseModel(SecureStorageModel v) =>
      v.authResponseModel;
  static const Field<SecureStorageModel, AuthResponseModel>
  _f$authResponseModel = Field('authResponseModel', _$authResponseModel);

  @override
  final MappableFields<SecureStorageModel> fields = const {
    #isFirstLaunch: _f$isFirstLaunch,
    #authResponseModel: _f$authResponseModel,
  };

  static SecureStorageModel _instantiate(DecodingData data) {
    return SecureStorageModel(
      isFirstLaunch: data.dec(_f$isFirstLaunch),
      authResponseModel: data.dec(_f$authResponseModel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SecureStorageModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SecureStorageModel>(map);
  }

  static SecureStorageModel fromJson(String json) {
    return ensureInitialized().decodeJson<SecureStorageModel>(json);
  }
}

mixin SecureStorageModelMappable {
  String toJson() {
    return SecureStorageModelMapper.ensureInitialized()
        .encodeJson<SecureStorageModel>(this as SecureStorageModel);
  }

  Map<String, dynamic> toMap() {
    return SecureStorageModelMapper.ensureInitialized()
        .encodeMap<SecureStorageModel>(this as SecureStorageModel);
  }

  SecureStorageModelCopyWith<
    SecureStorageModel,
    SecureStorageModel,
    SecureStorageModel
  >
  get copyWith =>
      _SecureStorageModelCopyWithImpl<SecureStorageModel, SecureStorageModel>(
        this as SecureStorageModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SecureStorageModelMapper.ensureInitialized().stringifyValue(
      this as SecureStorageModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SecureStorageModelMapper.ensureInitialized().equalsValue(
      this as SecureStorageModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SecureStorageModelMapper.ensureInitialized().hashValue(
      this as SecureStorageModel,
    );
  }
}

extension SecureStorageModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SecureStorageModel, $Out> {
  SecureStorageModelCopyWith<$R, SecureStorageModel, $Out>
  get $asSecureStorageModel => $base.as(
    (v, t, t2) => _SecureStorageModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SecureStorageModelCopyWith<
  $R,
  $In extends SecureStorageModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  AuthResponseModelCopyWith<$R, AuthResponseModel, AuthResponseModel>?
  get authResponseModel;
  $R call({bool? isFirstLaunch, AuthResponseModel? authResponseModel});
  SecureStorageModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SecureStorageModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SecureStorageModel, $Out>
    implements SecureStorageModelCopyWith<$R, SecureStorageModel, $Out> {
  _SecureStorageModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SecureStorageModel> $mapper =
      SecureStorageModelMapper.ensureInitialized();
  @override
  AuthResponseModelCopyWith<$R, AuthResponseModel, AuthResponseModel>?
  get authResponseModel => $value.authResponseModel?.copyWith.$chain(
    (v) => call(authResponseModel: v),
  );
  @override
  $R call({bool? isFirstLaunch, Object? authResponseModel = $none}) => $apply(
    FieldCopyWithData({
      if (isFirstLaunch != null) #isFirstLaunch: isFirstLaunch,
      if (authResponseModel != $none) #authResponseModel: authResponseModel,
    }),
  );
  @override
  SecureStorageModel $make(CopyWithData data) => SecureStorageModel(
    isFirstLaunch: data.get(#isFirstLaunch, or: $value.isFirstLaunch),
    authResponseModel: data.get(
      #authResponseModel,
      or: $value.authResponseModel,
    ),
  );

  @override
  SecureStorageModelCopyWith<$R2, SecureStorageModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SecureStorageModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

