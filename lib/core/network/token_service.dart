import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/features/auth/data/remote_data_source/auth_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_service.g.dart';

@Riverpod(keepAlive: true)
Future<TokenService> tokenService(Ref ref) async {
  final storage = ref.read(secureStorageHelperProvider);
  final apiClient = await ref.read(apiClientProvider.future);

  return TokenServiceImpl(
    storage,
    AuthRemoteDatasourceImpl(apiClient),
  );
}

abstract interface class TokenService {
  Future<String> refreshAccessToken();
  Future<void> clearTokens();
  Future<String?> getAccessToken();
}

class TokenServiceImpl implements TokenService {
  final SecureStorageHelper storage;
  final AuthRemoteDatasource remote;

  TokenServiceImpl(this.storage, this.remote);

  @override
  Future<String> refreshAccessToken() async {
    try{
      final token = await remote.refreshAccessToken();
      if (token == null) throw ServerFailure('Token is null');
      await storage.updateAccessToken(token);
      return token;
    } catch(e){
      rethrow;
    }
  }

  @override
  Future<void> clearTokens() => storage.deleteAll();

  @override
  Future<String?> getAccessToken() async {
    final data = await storage.get();
    return data?.authResponseModel?.accessToken;
  }
}
