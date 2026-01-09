import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

abstract final class SecureStorageKeys {
  static const String secureStorageKey = 'secureStorageKey';
}

class SecureStorageHelper {
  final FlutterSecureStorage _secureStorage;

  SecureStorageHelper(this._secureStorage);

  Future<void> save(String key, SecureStorageModel value) async {
    try {
      final jsonString = value.toJson();
      await _secureStorage.write(key: key, value: jsonString);
    } catch (e) {
      rethrow;
    }
  }

  Future<SecureStorageModel?> get(String key) async {
    try {
      final jsonString = await _secureStorage.read(key: key);
      if (jsonString == null) return null;
      return SecureStorageModelMapper.fromJson(jsonString);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(User user) async {
    try{
      final secureStorageModel = await get(SecureStorageKeys.secureStorageKey);
      if(secureStorageModel == null) return;
      final authResponseModel = secureStorageModel.authResponseModel;
      if(authResponseModel == null) return;
      final updatedSecureStorageModel = secureStorageModel.copyWith(authResponseModel: authResponseModel.copyWith(user: user));
      await save(SecureStorageKeys.secureStorageKey, updatedSecureStorageModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
