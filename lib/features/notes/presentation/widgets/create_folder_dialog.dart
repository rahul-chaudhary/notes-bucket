import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CreateFolderDialog extends HookConsumerWidget {
  final int? parentId;

  const CreateFolderDialog({required this.parentId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    useListenable(controller);

    // Local state: whether to show the error
    final showError = useState(false);

    final folderController = ref.read(folderControllerProvider.notifier);

    final textEmpty = controller.text.trim().isEmpty;

    return AppAlertDialog(
      dialogHeader: Text('Create New Folder'),
      primaryButtonText: 'Create',
      primaryButtonColor: textEmpty
          ? Theme.of(context).disabledColor
          : Theme.of(context).colorScheme.primary,
      content: AppTextField(
        controller: controller,
        hintText: 'Folder Name',
        errorText: showError.value && textEmpty
            ? 'Folder name cannot be empty'
            : null,
      ),
      secondaryButtonText: 'Cancel',
      onPressPrimary: () async {
        final name = controller.text.trim();
        if (name.isEmpty) {
          showError.value = true;
          return;
        }

        final newFolder = FolderEntity(
          id: 0,
          name: name,
          parentId: parentId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        try {
          await folderController.create(newFolder);

          ref.invalidate(foldersByParentProvider);
          ref.invalidate(rootFoldersProvider);

          if (context.mounted) {
            Navigator.pop(context);
            AppSnackBar.showSuccess(context, 'Folder created successfully!');
          }
        } catch (e) {
          if (context.mounted) {
            Navigator.pop(context);
            AppSnackBar.showError(context, 'Failed: $e');
          }
        }
      },
      onPressSecondary: () => Navigator.pop(context),
    );
  }
}




