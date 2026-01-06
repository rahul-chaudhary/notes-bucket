// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state.dart';

class AuthStateMapper extends EnumMapper<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
    }
    return _instance!;
  }

  static AuthState fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthState decode(dynamic value) {
    switch (value) {
      case r'loggedIn':
        return AuthState.loggedIn;
      case r'loggedOut':
        return AuthState.loggedOut;
      case r'sessionExpired':
        return AuthState.sessionExpired;
      case r'authFailed':
        return AuthState.authFailed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthState self) {
    switch (self) {
      case AuthState.loggedIn:
        return r'loggedIn';
      case AuthState.loggedOut:
        return r'loggedOut';
      case AuthState.sessionExpired:
        return r'sessionExpired';
      case AuthState.authFailed:
        return r'authFailed';
    }
  }
}

extension AuthStateMapperExtension on AuthState {
  String toValue() {
    AuthStateMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthState>(this) as String;
  }
}

