// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'otp_response_model.dart';

class OtpResponseModelMapper extends ClassMapperBase<OtpResponseModel> {
  OtpResponseModelMapper._();

  static OtpResponseModelMapper? _instance;
  static OtpResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OtpResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OtpResponseModel';

  static String _$message(OtpResponseModel v) => v.message;
  static const Field<OtpResponseModel, String> _f$message = Field(
    'message',
    _$message,
  );
  static String _$otp(OtpResponseModel v) => v.otp;
  static const Field<OtpResponseModel, String> _f$otp = Field('otp', _$otp);

  @override
  final MappableFields<OtpResponseModel> fields = const {
    #message: _f$message,
    #otp: _f$otp,
  };

  static OtpResponseModel _instantiate(DecodingData data) {
    return OtpResponseModel(
      message: data.dec(_f$message),
      otp: data.dec(_f$otp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OtpResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OtpResponseModel>(map);
  }

  static OtpResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<OtpResponseModel>(json);
  }
}

mixin OtpResponseModelMappable {
  String toJson() {
    return OtpResponseModelMapper.ensureInitialized()
        .encodeJson<OtpResponseModel>(this as OtpResponseModel);
  }

  Map<String, dynamic> toMap() {
    return OtpResponseModelMapper.ensureInitialized()
        .encodeMap<OtpResponseModel>(this as OtpResponseModel);
  }

  OtpResponseModelCopyWith<OtpResponseModel, OtpResponseModel, OtpResponseModel>
  get copyWith =>
      _OtpResponseModelCopyWithImpl<OtpResponseModel, OtpResponseModel>(
        this as OtpResponseModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OtpResponseModelMapper.ensureInitialized().stringifyValue(
      this as OtpResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return OtpResponseModelMapper.ensureInitialized().equalsValue(
      this as OtpResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return OtpResponseModelMapper.ensureInitialized().hashValue(
      this as OtpResponseModel,
    );
  }
}

extension OtpResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OtpResponseModel, $Out> {
  OtpResponseModelCopyWith<$R, OtpResponseModel, $Out>
  get $asOtpResponseModel =>
      $base.as((v, t, t2) => _OtpResponseModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OtpResponseModelCopyWith<$R, $In extends OtpResponseModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, String? otp});
  OtpResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _OtpResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OtpResponseModel, $Out>
    implements OtpResponseModelCopyWith<$R, OtpResponseModel, $Out> {
  _OtpResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OtpResponseModel> $mapper =
      OtpResponseModelMapper.ensureInitialized();
  @override
  $R call({String? message, String? otp}) => $apply(
    FieldCopyWithData({
      if (message != null) #message: message,
      if (otp != null) #otp: otp,
    }),
  );
  @override
  OtpResponseModel $make(CopyWithData data) => OtpResponseModel(
    message: data.get(#message, or: $value.message),
    otp: data.get(#otp, or: $value.otp),
  );

  @override
  OtpResponseModelCopyWith<$R2, OtpResponseModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OtpResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

