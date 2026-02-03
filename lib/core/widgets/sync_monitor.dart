import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/features/sync/sync_service.dart';

import '../../features/sync/sync_service_provider.dart';

class SyncMonitor extends ConsumerWidget {
  const SyncMonitor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncMonitorProvider);

    switch (syncState.status) {
      case SyncingStatus.syncingFolders:
        return _buildText(context, "Syncing folders…");
      case SyncingStatus.syncingNotes:
        return _buildText(context, "Syncing notes…");
      case SyncingStatus.success:
        return _buildText(context, 'All synced ✨');
      case SyncingStatus.failure:
        return _buildText(context, syncState.message ?? 'error');
      default:
        return Text('Everything up to date 🎉', style: AppTextStyles.bodySmall(context));
    }
  }

  Text _buildText(BuildContext context, String text) =>
      Text(text, style: AppTextStyles.bodySmall(context));
}
