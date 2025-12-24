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
                _showRenameDialog(context, folderController);
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
                _showDeleteConfirmation(context, folderController);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(
    BuildContext context,
    FolderController folderController,
  ) {
    final TextEditingController controller = TextEditingController(
      text: folder.name,
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename Folder'),
        backgroundColor: Theme.of(context).cardColor,
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Folder Name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: AppTextStyles.bodySmall(context)),
          ),
          FilledButton(
            onPressed: () async {
              final newName = controller.text.trim();
              try {
                await folderController.rename(folder, newName);
                if (context.mounted) {
                  AppSnackBar.showSuccess(
                    context,
                    '"${folder.name}" renamed to "$newName" successfully!',
                  );
                }
              } catch (e, st) {
                if (context.mounted) {
                  AppSnackBar.showError(context, 'Failed to rename folder: $e');
                }
                dbPrint('Failed to rename the folder', e: e, st: st);
                rethrow;
              } finally {
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    FolderController folderController,
  ) {
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        dialogHeader: Text('Delete Folder'),
        primaryButtonText: 'Delete',
        primaryButtonColor: Theme.of(context).colorScheme.error,
        secondaryButtonText: 'Cancel',
        onPressPrimary: () {
          try {
            folderController.delete(folder.id, folder.parentId);
            AppSnackBar.showSuccess(
              context,
              '"${folder.name}" deleted successfully!',
            );
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
      onLongPress: () => _showOptionsBottomSheet(context, folderController),
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
