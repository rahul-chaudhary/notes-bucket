import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
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

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    if (widget.noteId != null) {
      note = await ref.read(fetchNoteByIdProvider(widget.noteId!).future);
      if (note != null) {
        titleController.text = note!.title ?? '';
        bodyController.text = note!.content ?? '';
      }
    }
  }

  void _discardChangesDialog() {
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        dialogHeader: Text('Discard Changes?'),
        primaryButtonText: 'Discard',
        primaryButtonColor: Theme.of(context).primaryColor,
        secondaryButtonText: 'Cancel',
        onPressPrimary: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPressSecondary: () => Navigator.of(context).pop(),
        content: Text('Are you sure you want to discard the changes?'),
      ),
    );
  }

  void _handleBackNavigation() {
    final bool hasUnsavedChanges = note != null
        ? (note!.title != titleController.text ||
        note!.content != bodyController.text)
        : (titleController.text.isNotEmpty ||
        bodyController.text.isNotEmpty);

    if (hasUnsavedChanges) {
      _discardChangesDialog();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteController = ref.read(noteControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context, noteController),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) _handleBackNavigation();
        },
        child: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, NoteController noteController) {
    return AppBar(
      title: const Text('Edit Note'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => _handleBackNavigation(),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            try {
              if (note != null) {
                final updatedNote = note!.copyWith(
                  title: titleController.text,
                  content: bodyController.text,
                );
                if (note == updatedNote) {
                  if (mounted) {
                    AppSnackBar.showInfo(context, 'No changes to save');
                  }
                  return;
                }
                await noteController.updateNote(updatedNote);
                note = updatedNote;
                dbPrint(
                  'Is note and update note equal ${note.hashCode == updateNote.hashCode}',
                );
                if (context.mounted) {
                  AppSnackBar.showSuccess(context, 'Note saved successfully');
                  ref.invalidate(fetchAllNotesProvider);
                }
              } else {
                final selectedFolderId = await showDialog<int?>(
                  context: context,
                  builder: (BuildContext context) {
                    return const SelectFolderDialog();
                  },
                );
                dbPrint('Selected folder id is $selectedFolderId');
                if (selectedFolderId != null) {
                  final newNote = NoteEntity(
                    id: 0,
                    folderId: selectedFolderId,
                    title: titleController.text,
                    content: bodyController.text,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  note = await noteController.addNote(newNote);
                  ref.invalidate(fetchAllNotesProvider);
                  if (context.mounted) {
                    AppSnackBar.showSuccess(context, 'Note saved successfully');
                  }
                }
              }
            } catch (e, s) {
              dbPrint('Failed to save the note', e: e, st: s);
              if (context.mounted) {
                AppSnackBar.showError(context, 'Failed to save the note: $e');
              }
              rethrow;
            }
          },
          icon: Icon(Icons.save_rounded, color: Theme.of(context).primaryColor),
        ),
      ],
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
