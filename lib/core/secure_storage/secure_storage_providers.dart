import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/features/auth/data/models/response_models.dart';
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

@Riverpod(keepAlive: true)
class SecureStorageControllerNotifier extends _$SecureStorageControllerNotifier {
  @override
  Future<SecureStorageModel?> build() async {
    final secureStorageHelper = ref.watch(secureStorageHelperProvider);
    final res = await secureStorageHelper.get(
      SecureStorageKeys.secureStorageKey,
    );
    return res;
  }

  Future<void> save(SecureStorageModel model) async {
    final secureStorageHelper = ref.read(secureStorageHelperProvider);
    await secureStorageHelper.save(SecureStorageKeys.secureStorageKey,model);
    state = AsyncValue.data(model);
  }

  Future<void> updateAuthResponse(AuthResponseModel authResponse) async {
    final current = state.asData?.value ?? SecureStorageModel(
      isFirstLaunch: true,
      authResponseModel: null,
    );
    final updated = current.copyWith(
      authResponseModel: authResponse,
    );
    await save(updated);
  }

  Future<void> setFirstLaunchComplete() async {
    final current = state.asData?.value ?? SecureStorageModel(
      isFirstLaunch: true,
      authResponseModel: null,
    );
    final updated = current.copyWith(isFirstLaunch: false);
    await save(updated);
  }

  Future<void> clear() async {
    final secureStorageHelper = ref.read(secureStorageHelperProvider);
    await secureStorageHelper.delete(SecureStorageKeys.secureStorageKey);
    state = const AsyncValue.data(null);
  }
}
