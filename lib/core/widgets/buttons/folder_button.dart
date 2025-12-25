import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/folder_dialogs.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_style.dart';

class FolderButton extends ConsumerWidget {
  final Color? color;
  final FolderEntity folder;
  final int itemCount;
  final VoidCallback onTap;

  const FolderButton({
    this.color,
    super.key,
    required this.folder,
    required this.onTap,
    required this.itemCount,
  });

  void _showOptionsBottomSheet(
    BuildContext context,
    WidgetRef ref,
    FolderController folderController,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Rename Folder'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => RenameFolderDialog(folder: folder),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'Delete Folder',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, ref, folderController);
              },
            ),
          ],
        ),
      ),
    );
  }


  void _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    FolderController folderController,
  ) {
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        dialogHeader: Text('Delete Folder'),
        primaryButtonText: 'Delete',
        primaryBtnTextColor: Colors.white,
        primaryButtonColor: Theme.of(context).colorScheme.error,
        secondaryButtonText: 'Cancel',
        onPressPrimary: () async {
          try {
            await folderController.delete(folder.id, folder.parentId);
            AppSnackBar.showSuccess(
              context,
              '"${folder.name}" deleted successfully!',
            );
            ref.invalidate(foldersByParentProvider);
            ref.invalidate(rootFoldersProvider);
          } catch (e, st) {
            AppSnackBar.showError(context, 'Failed to delete folder: $e');
            dbPrint('Failed to delete the folder', e: e, st: st);
            rethrow;
          } finally {
            Navigator.pop(context);
          }
        },
        onPressSecondary: () {
          Navigator.pop(context);
        },
        content: Text(
          'Are you sure you want to delete "${folder.name}"? This action cannot be undone.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderController = ref.read(folderControllerProvider.notifier);

    return InkWell(
      onTap: onTap,
      onLongPress: () => _showOptionsBottomSheet(context, ref, folderController),
      splashColor: Theme.of(context).colorScheme.primary.withAlpha(100),
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppSvgs.blueMacFolder,
                  colorFilter: color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
                  height: 100,
                  clipBehavior: Clip.none,
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      folder.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 18,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white54,
              ),
              child: Text(
                '$itemCount',
                style: AppTextStyles.bodySmall(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
