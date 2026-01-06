import 'package:notes_bucket/core/network/providers/network_providers.dart';
import 'package:notes_bucket/core/notification/controllers/notification_api_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_api_controller_provider.g.dart';

@riverpod
Future<NotificationApiController> notificationApiController(Ref ref) async {
  final apiClient = await ref.watch(apiClientProvider.future);
  return NotificationApiController(apiClient);
}
