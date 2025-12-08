import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';

Future<void> createFolderDialog(BuildContext context, WidgetRef ref, TextEditingController controller ) {
  return showDialog(
    context: context,
    builder: (context) => AppAlertDialog(
      dialogTitle: 'Create New Folder',
      primaryButtonText: 'Create',
      primaryButtonColor: Theme.of(context).colorScheme.primary,
      content: AppTextField(
        controller: controller,
        hintText: 'Folder Name',
      ),
      secondaryButtonText: 'Cancel',
      onPressPrimary: () async {
        final folderName = controller.text.trim();
        if (folderName.isNotEmpty) {
          final newFolder = FolderEntity(
            id: 0,
            name: folderName,
            parentId: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          try {
            await ref
                .read(folderControllerProvider.notifier)
                .create(newFolder);
            if (context.mounted) {
              Navigator.pop(context);
              AppSnackBar.showSuccess(
                context,
                'Folder created successfully!',
              );
            }
          } catch (e) {
            if (context.mounted) {
              Navigator.pop(context);
              AppSnackBar.showError(
                context,
                'Failed to create folder: $e',
              );
            }
            rethrow;
          }
        }
      },
      onPressSecondary: () {
        Navigator.pop(context);
      },
    ),
  );
}