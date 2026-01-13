import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';

abstract final class SecureStorageKeys {
  static const String secureStorageKey = 'secureStorageKey';
  static const String cachedQuoteKey = 'daily_quote_cached';
}

class SecureStorageHelper {
  final FlutterSecureStorage _secureStorage;

  SecureStorageHelper(this._secureStorage);

  String get _key => SecureStorageKeys.secureStorageKey;

  Future<void> save(SecureStorageModel value) async {
    try {
      await _secureStorage.write(key: _key, value: value.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<SecureStorageModel?> get() async {
    try {
      final jsonString = await _secureStorage.read(key: _key);
      if (jsonString == null) return null;
      return SecureStorageModelMapper.fromJson(jsonString);
    } catch (e) {
      rethrow;
    }
  }

  Future<SecureStorageModel?> updateAccessToken(String accessToken) async {
    try {
      final secureStorageModel = await get();
      if (secureStorageModel == null) return null;
      final authResponseModel = secureStorageModel.authResponseModel;
      if (authResponseModel == null) return null;
      final updatedSecureStorageModel = secureStorageModel.copyWith(
        authResponseModel: authResponseModel.copyWith(accessToken: accessToken),
      );
      await save(updatedSecureStorageModel);
      return updatedSecureStorageModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      final secureStorageModel = await get();
      if (secureStorageModel == null) return null;
      final authResponseModel = secureStorageModel.authResponseModel;
      if (authResponseModel == null) return null;
      return authResponseModel.refreshToken;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      final secureStorageModel = await get();
      if (secureStorageModel == null) return;
      final authResponseModel = secureStorageModel.authResponseModel;
      if (authResponseModel == null) return;
      final updatedSecureStorageModel = secureStorageModel.copyWith(
        authResponseModel: authResponseModel.copyWith(user: user),
      );
      await save(updatedSecureStorageModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: _key);
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
