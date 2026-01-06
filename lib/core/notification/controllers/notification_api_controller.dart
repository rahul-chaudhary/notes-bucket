import 'package:notes_bucket/core/network/api_client.dart';
import 'package:notes_bucket/core/network/constants/api_endpoints.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';

class NotificationApiController {
  final ApiClient _apiClient;

  NotificationApiController(this._apiClient);

  Future<String?> saveFCMToken(String token, String device) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.saveFCMToken,
        data: {'fcm_token': token, 'device_type': device},
      );

      return response.data;
    } catch (e, s) {
      dbPrint('saveFCMToken error', e: e, st: s);
      rethrow;
    }
  }
}
