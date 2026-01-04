import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class SecureStorageKeys {
  static const String secureStorageKey = 'secureStorageKey';
  static const String isFirstLaunchKey = 'isFirstLaunchKey';
}

class SecureStorageHelper {
  final FlutterSecureStorage _secureStorage;

  SecureStorageHelper(this._secureStorage);

  Future<void> save(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> get(String key) async {
    try {
      return await _secureStorage.read(key: key);
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
