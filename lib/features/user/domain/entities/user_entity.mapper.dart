// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_entity.dart';

class UserEntityMapper extends ClassMapperBase<UserEntity> {
  UserEntityMapper._();

  static UserEntityMapper? _instance;
  static UserEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserEntity';

  static String _$id(UserEntity v) => v.id;
  static const Field<UserEntity, String> _f$id = Field('id', _$id);
  static String _$email(UserEntity v) => v.email;
  static const Field<UserEntity, String> _f$email = Field('email', _$email);
  static String? _$username(UserEntity v) => v.username;
  static const Field<UserEntity, String> _f$username = Field(
    'username',
    _$username,
  );
  static bool _$subscriptionActive(UserEntity v) => v.subscriptionActive;
  static const Field<UserEntity, bool> _f$subscriptionActive = Field(
    'subscriptionActive',
    _$subscriptionActive,
  );
  static DateTime _$createdAt(UserEntity v) => v.createdAt;
  static const Field<UserEntity, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime? _$updatedAt(UserEntity v) => v.updatedAt;
  static const Field<UserEntity, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static DateTime? _$deletedAt(UserEntity v) => v.deletedAt;
  static const Field<UserEntity, DateTime> _f$deletedAt = Field(
    'deletedAt',
    _$deletedAt,
    opt: true,
  );

  @override
  final MappableFields<UserEntity> fields = const {
    #id: _f$id,
    #email: _f$email,
    #username: _f$username,
    #subscriptionActive: _f$subscriptionActive,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #deletedAt: _f$deletedAt,
  };

  static UserEntity _instantiate(DecodingData data) {
    return UserEntity(
      id: data.dec(_f$id),
      email: data.dec(_f$email),
      username: data.dec(_f$username),
      subscriptionActive: data.dec(_f$subscriptionActive),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      deletedAt: data.dec(_f$deletedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserEntity>(map);
  }

  static UserEntity fromJson(String json) {
    return ensureInitialized().decodeJson<UserEntity>(json);
  }
}

mixin UserEntityMappable {
  String toJson() {
    return UserEntityMapper.ensureInitialized().encodeJson<UserEntity>(
      this as UserEntity,
    );
  }

  Map<String, dynamic> toMap() {
    return UserEntityMapper.ensureInitialized().encodeMap<UserEntity>(
      this as UserEntity,
    );
  }

  UserEntityCopyWith<UserEntity, UserEntity, UserEntity> get copyWith =>
      _UserEntityCopyWithImpl<UserEntity, UserEntity>(
        this as UserEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserEntityMapper.ensureInitialized().stringifyValue(
      this as UserEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserEntityMapper.ensureInitialized().equalsValue(
      this as UserEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return UserEntityMapper.ensureInitialized().hashValue(this as UserEntity);
  }
}

extension UserEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserEntity, $Out> {
  UserEntityCopyWith<$R, UserEntity, $Out> get $asUserEntity =>
      $base.as((v, t, t2) => _UserEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserEntityCopyWith<$R, $In extends UserEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? email,
    String? username,
    bool? subscriptionActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
  UserEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserEntity, $Out>
    implements UserEntityCopyWith<$R, UserEntity, $Out> {
  _UserEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserEntity> $mapper =
      UserEntityMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? email,
    Object? username = $none,
    bool? subscriptionActive,
    DateTime? createdAt,
    Object? updatedAt = $none,
    Object? deletedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (email != null) #email: email,
      if (username != $none) #username: username,
      if (subscriptionActive != null) #subscriptionActive: subscriptionActive,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (deletedAt != $none) #deletedAt: deletedAt,
    }),
  );
  @override
  UserEntity $make(CopyWithData data) => UserEntity(
    id: data.get(#id, or: $value.id),
    email: data.get(#email, or: $value.email),
    username: data.get(#username, or: $value.username),
    subscriptionActive: data.get(
      #subscriptionActive,
      or: $value.subscriptionActive,
    ),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    deletedAt: data.get(#deletedAt, or: $value.deletedAt),
  );

  @override
  UserEntityCopyWith<$R2, UserEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

