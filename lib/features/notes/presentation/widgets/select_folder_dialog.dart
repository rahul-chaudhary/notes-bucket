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
            SizedBox(
              height: 100,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  // for (var folder in )
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  //     child: ChoiceChip(
                  //       label: Text(folder),
                  //       selected: selectedFolder == folder,
                  //       onSelected: (bool selected) {
                  //         setState(() {
                  //           selectedFolder = selected ? folder : null;
                  //         });
                  //       },
                  //     ),
                  //   ),
                ],
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
              onTap: _showCreateFolderDialog,
            ),
          ],
        ));
  }
}