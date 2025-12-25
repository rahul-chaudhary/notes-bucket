import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _CommonFolderDialog extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> showError;
  final bool textEmpty;
  final VoidCallback onPressPrimaryBtn;
  final String dialogTitle;
  final String primaryButtonText;
  final String errorMessage;

  const _CommonFolderDialog({
    super.key,
    required this.onPressPrimaryBtn,
    required this.controller,
    required this.showError,
    required this.textEmpty,
    required this.dialogTitle,
    required this.primaryButtonText,
    this.errorMessage = 'Folder name cannot be empty',
  });

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      dialogHeader: Text(dialogTitle),
      primaryButtonText: primaryButtonText,
      primaryBtnTextColor: Colors.white,
      primaryButtonColor: textEmpty
          ? Theme.of(context).disabledColor
          : Theme.of(context).colorScheme.primary,
      content: AppTextField(
        controller: controller,
        maxChar: AppConstants.maxFolderNameLength,
        hintText: 'Folder Name',
        errorText: showError.value && textEmpty ? errorMessage : null,
      ),
      secondaryButtonText: 'Cancel',
      onPressPrimary: onPressPrimaryBtn,
      onPressSecondary: () => Navigator.pop(context),
    );
  }
}

Future<void> _handleFolderOperation({
  required BuildContext context,
  required WidgetRef ref,
  required TextEditingController controller,
  required ValueNotifier<bool> showError,
  required Future<void> Function() operation,
  required String successMessage,
}) async {
  final name = controller.text.trim();
  if (name.isEmpty) {
    showError.value = true;
    return;
  }

  try {
    await operation();
    ref.invalidate(foldersByParentProvider);
    ref.invalidate(rootFoldersProvider);

    if (context.mounted) {
      Navigator.pop(context);
      AppSnackBar.showSuccess(context, successMessage);
    }
  } catch (e) {
    if (context.mounted) {
      Navigator.pop(context);
      AppSnackBar.showError(context, 'Failed: $e');
    }
  }
}

class CreateFolderDialog extends HookConsumerWidget {
  final int? parentId;

  const CreateFolderDialog({required this.parentId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    useListenable(controller);

    final showError = useState(false);
    final folderController = ref.read(folderControllerProvider.notifier);
    final textEmpty = controller.text.trim().isEmpty;

    return _CommonFolderDialog(
      dialogTitle: 'Create New Folder',
      primaryButtonText: 'Create',
      controller: controller,
      showError: showError,
      textEmpty: textEmpty,
      onPressPrimaryBtn: () => _handleFolderOperation(
        context: context,
        ref: ref,
        controller: controller,
        showError: showError,
        operation: () async {
          final newFolder = FolderEntity(
            id: 0,
            name: controller.text.trim(),
            parentId: parentId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );
          await folderController.create(newFolder);
          ref.invalidate(totalItemsCountProvider);
        },
        successMessage: 'Folder created successfully!',
      ),
    );
  }
}

class RenameFolderDialog extends HookConsumerWidget {
  final FolderEntity folder;

  const RenameFolderDialog({super.key, required this.folder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: folder.name);
    useListenable(controller);

    final showError = useState(false);
    final folderController = ref.read(folderControllerProvider.notifier);
    final textEmpty = controller.text.trim().isEmpty;

    return _CommonFolderDialog(
      dialogTitle: 'Rename Folder',
      primaryButtonText: 'Rename',
      controller: controller,
      showError: showError,
      textEmpty: textEmpty,
      onPressPrimaryBtn: () => _handleFolderOperation(
        context: context,
        ref: ref,
        controller: controller,
        showError: showError,
        operation: () async {
          await folderController.rename(folder, controller.text.trim());
        },
        successMessage: 'Folder renamed successfully!',
      ),
    );
  }
}
