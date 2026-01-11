import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_providers.g.dart';

// Secure storage provider
@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}

@riverpod
SecureStorageHelper secureStorageHelper(Ref ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return SecureStorageHelper(secureStorage);
}