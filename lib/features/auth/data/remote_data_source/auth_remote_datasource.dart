import 'package:notes_bucket/features/auth/data/models/generic_response_model.dart';
import 'package:notes_bucket/features/auth/data/models/user.dart';
import 'package:notes_bucket/features/notes/data/models/otp_response_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<GenericResponseModel> doesUserExist(String email);
  Future<OtpResponseModel> sendOtp(String email);
  Future<User> register(String email);
  Future<User> login(String email);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<GenericResponseModel> doesUserExist(String email) {
    // TODO: implement doesUserExist
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<OtpResponseModel> sendOtp(String email) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }
  
  
}