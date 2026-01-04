// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'response_models.dart';

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

class SendOtpResponseModelMapper extends ClassMapperBase<SendOtpResponseModel> {
  SendOtpResponseModelMapper._();

  static SendOtpResponseModelMapper? _instance;
  static SendOtpResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendOtpResponseModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SendOtpResponseModel';

  static String _$otp(SendOtpResponseModel v) => v.otp;
  static const Field<SendOtpResponseModel, String> _f$otp = Field('otp', _$otp);
  static String _$message(SendOtpResponseModel v) => v.message;
  static const Field<SendOtpResponseModel, String> _f$message = Field(
    'message',
    _$message,
  );

  @override
  final MappableFields<SendOtpResponseModel> fields = const {
    #otp: _f$otp,
    #message: _f$message,
  };

  static SendOtpResponseModel _instantiate(DecodingData data) {
    return SendOtpResponseModel(
      otp: data.dec(_f$otp),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SendOtpResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendOtpResponseModel>(map);
  }

  static SendOtpResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<SendOtpResponseModel>(json);
  }
}

mixin SendOtpResponseModelMappable {
  String toJson() {
    return SendOtpResponseModelMapper.ensureInitialized()
        .encodeJson<SendOtpResponseModel>(this as SendOtpResponseModel);
  }

  Map<String, dynamic> toMap() {
    return SendOtpResponseModelMapper.ensureInitialized()
        .encodeMap<SendOtpResponseModel>(this as SendOtpResponseModel);
  }

  SendOtpResponseModelCopyWith<
    SendOtpResponseModel,
    SendOtpResponseModel,
    SendOtpResponseModel
  >
  get copyWith =>
      _SendOtpResponseModelCopyWithImpl<
        SendOtpResponseModel,
        SendOtpResponseModel
      >(this as SendOtpResponseModel, $identity, $identity);
  @override
  String toString() {
    return SendOtpResponseModelMapper.ensureInitialized().stringifyValue(
      this as SendOtpResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SendOtpResponseModelMapper.ensureInitialized().equalsValue(
      this as SendOtpResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SendOtpResponseModelMapper.ensureInitialized().hashValue(
      this as SendOtpResponseModel,
    );
  }
}

extension SendOtpResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendOtpResponseModel, $Out> {
  SendOtpResponseModelCopyWith<$R, SendOtpResponseModel, $Out>
  get $asSendOtpResponseModel => $base.as(
    (v, t, t2) => _SendOtpResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SendOtpResponseModelCopyWith<
  $R,
  $In extends SendOtpResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? otp, String? message});
  SendOtpResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SendOtpResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendOtpResponseModel, $Out>
    implements SendOtpResponseModelCopyWith<$R, SendOtpResponseModel, $Out> {
  _SendOtpResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendOtpResponseModel> $mapper =
      SendOtpResponseModelMapper.ensureInitialized();
  @override
  $R call({String? otp, String? message}) => $apply(
    FieldCopyWithData({
      if (otp != null) #otp: otp,
      if (message != null) #message: message,
    }),
  );
  @override
  SendOtpResponseModel $make(CopyWithData data) => SendOtpResponseModel(
    otp: data.get(#otp, or: $value.otp),
    message: data.get(#message, or: $value.message),
  );

  @override
  SendOtpResponseModelCopyWith<$R2, SendOtpResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SendOtpResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AuthResponseModelMapper extends ClassMapperBase<AuthResponseModel> {
  AuthResponseModelMapper._();

  static AuthResponseModelMapper? _instance;
  static AuthResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthResponseModelMapper._());
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthResponseModel';

  static String _$message(AuthResponseModel v) => v.message;
  static const Field<AuthResponseModel, String> _f$message = Field(
    'message',
    _$message,
  );
  static String? _$accessToken(AuthResponseModel v) => v.accessToken;
  static const Field<AuthResponseModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
  );
  static String? _$refreshToken(AuthResponseModel v) => v.refreshToken;
  static const Field<AuthResponseModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
    key: r'refresh_token',
  );
  static User _$user(AuthResponseModel v) => v.user;
  static const Field<AuthResponseModel, User> _f$user = Field('user', _$user);

  @override
  final MappableFields<AuthResponseModel> fields = const {
    #message: _f$message,
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
    #user: _f$user,
  };

  static AuthResponseModel _instantiate(DecodingData data) {
    return AuthResponseModel(
      message: data.dec(_f$message),
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
      user: data.dec(_f$user),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthResponseModel>(map);
  }

  static AuthResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<AuthResponseModel>(json);
  }
}

mixin AuthResponseModelMappable {
  String toJson() {
    return AuthResponseModelMapper.ensureInitialized()
        .encodeJson<AuthResponseModel>(this as AuthResponseModel);
  }

  Map<String, dynamic> toMap() {
    return AuthResponseModelMapper.ensureInitialized()
        .encodeMap<AuthResponseModel>(this as AuthResponseModel);
  }

  AuthResponseModelCopyWith<
    AuthResponseModel,
    AuthResponseModel,
    AuthResponseModel
  >
  get copyWith =>
      _AuthResponseModelCopyWithImpl<AuthResponseModel, AuthResponseModel>(
        this as AuthResponseModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthResponseModelMapper.ensureInitialized().stringifyValue(
      this as AuthResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthResponseModelMapper.ensureInitialized().equalsValue(
      this as AuthResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthResponseModelMapper.ensureInitialized().hashValue(
      this as AuthResponseModel,
    );
  }
}

extension AuthResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthResponseModel, $Out> {
  AuthResponseModelCopyWith<$R, AuthResponseModel, $Out>
  get $asAuthResponseModel => $base.as(
    (v, t, t2) => _AuthResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AuthResponseModelCopyWith<
  $R,
  $In extends AuthResponseModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get user;
  $R call({
    String? message,
    String? accessToken,
    String? refreshToken,
    User? user,
  });
  AuthResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AuthResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthResponseModel, $Out>
    implements AuthResponseModelCopyWith<$R, AuthResponseModel, $Out> {
  _AuthResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthResponseModel> $mapper =
      AuthResponseModelMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({
    String? message,
    Object? accessToken = $none,
    Object? refreshToken = $none,
    User? user,
  }) => $apply(
    FieldCopyWithData({
      if (message != null) #message: message,
      if (accessToken != $none) #accessToken: accessToken,
      if (refreshToken != $none) #refreshToken: refreshToken,
      if (user != null) #user: user,
    }),
  );
  @override
  AuthResponseModel $make(CopyWithData data) => AuthResponseModel(
    message: data.get(#message, or: $value.message),
    accessToken: data.get(#accessToken, or: $value.accessToken),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
    user: data.get(#user, or: $value.user),
  );

  @override
  AuthResponseModelCopyWith<$R2, AuthResponseModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

