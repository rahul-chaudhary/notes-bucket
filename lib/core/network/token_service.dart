import 'package:dio/dio.dart';
import 'package:notes_bucket/core/errors/error_handler.dart';
import 'package:notes_bucket/core/errors/failures.dart';
import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_service.g.dart';

// ============================================================================
// Token Service (Uses Base API Client - No circular dependency!)
// ============================================================================

@Riverpod(keepAlive: true)
TokenService tokenService(Ref ref) {
  final storage = ref.read(secureStorageHelperProvider);
  final apiClient = ref.watch(baseApiClientProvider); // ← Uses BASE client

  return TokenServiceImpl(storage, apiClient);
}

abstract interface class TokenService {
  Future<String> refreshAccessToken();

  Future<void> clearTokens();

  Future<String?> getAccessToken();
}

class TokenServiceImpl implements TokenService {
  final SecureStorageHelper storage;
  final ApiClient apiClient;

  TokenServiceImpl(this.storage, this.apiClient);

  @override
  Future<String> refreshAccessToken() async {
    try {
      final refreshToken = await storage.getRefreshToken();
      if (refreshToken == null) throw CacheFailure('Refresh token is null');
      final response = await apiClient.post(
          ApiEndpoints.refreshAccessToken,
          data: {"refresh_token" : refreshToken},
      );
      final token = response.data['access_token'];
      if (token == null) throw ServerFailure('Token is null');
      await storage.updateAccessToken(token);
      return token;
    } on DioException catch (e) {
      throw DioExceptionHandler.handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearTokens() async {
    try {
      return await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      final data = await storage.get();
      return data?.authResponseModel?.accessToken;
    } catch (e) {
      rethrow;
    }
  }
}
