
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/select_folder_dialog.dart';

class EditNotePage extends ConsumerWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesId = ModalRoute.of(context)?.settings.arguments as int?;

    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Edit Note'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(onPressed: (){
            // Open select folder dialog
           showDialog(
               context: context,
               builder: (BuildContext context) {
                 return SelectFolderDialog();
               });
          }, child: const Text('Select Folder')),
        ],
      ),
      body: Padding(
        padding: AppSpacing.paddingAllM,
        child: Column(
          children: [
            AppEditNoteTextField(hintText: 'Title', controller: titleController,),
            Divider(color: Theme.of(context).dividerColor,),
            AppEditNoteTextField(hintText: 'Start writing your note here...', controller:  bodyController,),
          ],
        ),
      )
    );
  }
}

class AppEditNoteTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const AppEditNoteTextField({
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
