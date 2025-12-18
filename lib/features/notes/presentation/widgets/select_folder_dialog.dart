import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/core/widgets/buttons/app_arrow_button.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/view_all_provider.dart';

import '../../domain/entities/folder_entity.dart';
import 'folder_list_tile.dart';

class SelectFolderDialog extends ConsumerWidget {
  const SelectFolderDialog({super.key});

  void _showCreateFolderDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppAlertDialog(
          dialogHeader: Text('Create New Folder'),
          primaryButtonText: 'Create',
          primaryButtonColor: Theme.of(context).colorScheme.primary,
          secondaryButtonText: 'Cancel',
          onPressPrimary: () {
            if (folderNameController.text.isNotEmpty) {
              var selectedFolder = folderNameController.text;

              Navigator.of(context).pop();
            }
          },
          onPressSecondary: () {
            Navigator.of(context).pop();
          },
          content: AppTextField(
            controller: folderNameController,
            hintText: 'Folder Name',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FolderEntity? selectedFolder;
    String warningText = '';

    final rootFoldersAsync = ref.watch(
      rootFoldersProvider(limit: 15, offset: 0),
    );

    return AppAlertDialog(
      dialogHeader: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppArrowButton(position: ArrowPosition.back,),
          Text('Select Folder'),
          AppArrowButton(position: ArrowPosition.forward,),
        ],
      ),
      primaryButtonText: 'Save Here',
      primaryButtonColor: selectedFolder != null
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).disabledColor,
      secondaryButtonText: 'Cancel',
      onPressPrimary: () {
        if (selectedFolder == null) {
          warningText = 'Please select a folder to save your note in.';
        } else {
          Navigator.of(context).pop(selectedFolder);
        }
      },
      onPressSecondary: () {
        Navigator.of(context).pop(null);
      },
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: getScreenHeight(context) / 2,
            width: double.maxFinite,
            child: rootFoldersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return FolderListTile(title: item.name);
                }
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.create_new_folder,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Create New Folder',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () => _showCreateFolderDialog(context, ref),
          ),
          Text(
            warningText,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }


}



