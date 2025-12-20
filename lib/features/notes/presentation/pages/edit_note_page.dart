import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/presentation/providers/edit_note_state_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/select_folder_dialog.dart';

class EditNotePage extends ConsumerStatefulWidget {
  final int? noteId;

  const EditNotePage({super.key, required this.noteId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditNotePageState();
}

class _EditNotePageState extends ConsumerState<EditNotePage> {
  NoteEntity? note;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    if (widget.noteId != null) {
      note = await ref.read(fetchNoteByIdProvider(widget.noteId!).future);
      if (note != null) {
        ref.read(editNoteStateProvider.notifier).set(note);
        titleController.text = note!.title ?? '';
        bodyController.text = note!.content ?? '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteController = ref.read(noteControllerProvider.notifier);
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
          IconButton(
            onPressed: () async {
              if (note != null) {
                final updateNote = note!.copyWith(
                  title: titleController.text,
                  content: bodyController.text,
                );
                await noteController.updateNote(updateNote);
                Navigator.of(context).pop();
              } else {
                final selectedFolderId = await showDialog<int?>(
                  context: context,
                  builder: (BuildContext context) {
                    return const SelectFolderDialog();
                  },
                );
                if (selectedFolderId != null) {
                  final newNote = NoteEntity(
                    id: 0,
                    folderId: selectedFolderId,
                    title: titleController.text,
                    content: bodyController.text,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  await noteController.addNote(newNote);
                }
              }
            },
            icon: Icon(
              Icons.save_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingAllM,
      child: Column(
        children: [
          AppEditNoteTextField(hintText: 'Title', controller: titleController),
          Divider(color: Theme.of(context).dividerColor),
          AppEditNoteTextField(
            hintText: 'Start writing your note here...',
            controller: bodyController,
          ),
        ],
      ),
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
