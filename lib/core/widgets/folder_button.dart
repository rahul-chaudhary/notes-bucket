import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';

class FolderButton extends ConsumerWidget {
  final FolderEntity folder;

  const FolderButton({super.key, required this.folder});

  void _showOptionsBottomSheet(BuildContext context) {
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
                _showRenameDialog(context);
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
                _showDeleteConfirmation(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: folder.name);
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
            onPressed: () {
              // TODO: Implement rename logic
              Navigator.pop(context);
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
          dialogTitle: 'Delete Folder',
          primaryButtonText: 'Delete',
          primaryButtonColor: Theme.of(context).colorScheme.error,
          secondaryButtonText: 'Cancel',
          onPressPrimary: () {
            Navigator.pop(context);
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
    return InkWell(
      onTap: () {},
      onLongPress: () => _showOptionsBottomSheet(context),
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
                    height: 80,
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
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              ),
              child: const Text('2'),
            ),
          ),
        ],
      ),
    );
  }
}
