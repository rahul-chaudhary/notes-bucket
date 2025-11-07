import 'package:flutter/material.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';

class SelectFolderDialog extends StatefulWidget {
  const SelectFolderDialog({super.key});

  @override
  State<SelectFolderDialog> createState() => _SelectFolderDialogState();
}

class _SelectFolderDialogState extends State<SelectFolderDialog> {
  String? selectedFolder;

  void _showCreateFolderDialog() {
    final TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppAlertDialog(
          dialogTitle: 'Create New Folder',
          primaryButtonText: 'Create',
          primaryButtonColor: Theme.of(context).colorScheme.primary,
          secondaryButtonText: 'Cancel',
          onPressPrimary: () {
            if (folderNameController.text.isNotEmpty) {
              setState(() {
                selectedFolder = folderNameController.text;
              });
              Navigator.of(context).pop();
            }
          },
          onPressSecondary: () {
            Navigator.of(context).pop();
          },
          content: AppTextField(controller: folderNameController, hintText: 'Folder Name')
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
        dialogTitle: 'Select Folder',
        primaryButtonText: 'Select',
        primaryButtonColor: Theme.of(context).colorScheme.primary,
        secondaryButtonText: 'Cancel',
        onPressPrimary: () {
          Navigator.of(context).pop(selectedFolder);
        },
        onPressSecondary: () {
          Navigator.of(context).pop(null);
        },
        content: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.folder,
                color: selectedFolder == 'Work'
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              title: const Text('Work'),
              selected: selectedFolder == 'Work',
              onTap: () {
                setState(() {
                  selectedFolder = 'Work';
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.folder,
                color: selectedFolder == 'Personal'
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              title: const Text('Personal'),
              selected: selectedFolder == 'Personal',
              onTap: () {
                setState(() {
                  selectedFolder = 'Personal';
                });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.folder,
                color: selectedFolder == 'Ideas'
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              title: const Text('Ideas'),
              selected: selectedFolder == 'Ideas',
              onTap: () {
                setState(() {
                  selectedFolder = 'Ideas';
                });
              },
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
              onTap: _showCreateFolderDialog,
            ),
          ],
        ));
  }
}