import 'package:dart_mappable/dart_mappable.dart';
part 'auth_state.mapper.dart';

@MappableEnum()
enum AuthState {
  loggedIn,
  loggedOut,
  sessionExpired,
  authFailed,
}
