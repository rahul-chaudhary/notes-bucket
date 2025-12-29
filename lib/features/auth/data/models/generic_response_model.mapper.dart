// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generic_response_model.dart';

class GenericResponseModelMapper extends ClassMapperBase<GenericResponseModel> {
  GenericResponseModelMapper._();

  static GenericResponseModelMapper? _instance;
  static GenericResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenericResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GenericResponseModel';

  static bool _$status(GenericResponseModel v) => v.status;
  static const Field<GenericResponseModel, bool> _f$status = Field(
    'status',
    _$status,
  );
  static String _$message(GenericResponseModel v) => v.message;
  static const Field<GenericResponseModel, String> _f$message = Field(
    'message',
    _$message,
  );

  @override
  final MappableFields<GenericResponseModel> fields = const {
    #status: _f$status,
    #message: _f$message,
  };

  static GenericResponseModel _instantiate(DecodingData data) {
    return GenericResponseModel(
      status: data.dec(_f$status),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GenericResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GenericResponseModel>(map);
  }

  static GenericResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<GenericResponseModel>(json);
  }
}

mixin GenericResponseModelMappable {
  String toJson() {
    return GenericResponseModelMapper.ensureInitialized()
        .encodeJson<GenericResponseModel>(this as GenericResponseModel);
  }

  Map<String, dynamic> toMap() {
    return GenericResponseModelMapper.ensureInitialized()
        .encodeMap<GenericResponseModel>(this as GenericResponseModel);
  }

  GenericResponseModelCopyWith<
    GenericResponseModel,
    GenericResponseModel,
    GenericResponseModel
  >
  get copyWith =>
      _GenericResponseModelCopyWithImpl<
        GenericResponseModel,
        GenericResponseModel
      >(this as GenericResponseModel, $identity, $identity);
  @override
  String toString() {
    return GenericResponseModelMapper.ensureInitialized().stringifyValue(
      this as GenericResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return GenericResponseModelMapper.ensureInitialized().equalsValue(
      this as GenericResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return GenericResponseModelMapper.ensureInitialized().hashValue(
      this as GenericResponseModel,
    );
  }
}

extension GenericResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GenericResponseModel, $Out> {
  GenericResponseModelCopyWith<$R, GenericResponseModel, $Out>
  get $asGenericResponseModel => $base.as(
    (v, t, t2) => _GenericResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class GenericResponseModelCopyWith<
  $R,
  $In extends GenericResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? status, String? message});
  GenericResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GenericResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GenericResponseModel, $Out>
    implements GenericResponseModelCopyWith<$R, GenericResponseModel, $Out> {
  _GenericResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GenericResponseModel> $mapper =
      GenericResponseModelMapper.ensureInitialized();
  @override
  $R call({bool? status, String? message}) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (message != null) #message: message,
    }),
  );
  @override
  GenericResponseModel $make(CopyWithData data) => GenericResponseModel(
    status: data.get(#status, or: $value.status),
    message: data.get(#message, or: $value.message),
  );

  @override
  GenericResponseModelCopyWith<$R2, GenericResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GenericResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

