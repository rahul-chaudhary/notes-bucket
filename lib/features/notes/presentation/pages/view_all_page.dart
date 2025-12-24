import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/widgets/buttons/app_fab.dart';
import 'package:notes_bucket/core/widgets/cards/info_card.dart';
import 'package:notes_bucket/core/widgets/errors/app_error_widget.dart';
import 'package:notes_bucket/core/widgets/buttons/folder_button.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/core/widgets/skeletons/folder_grid_view_skeleton.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/presentation/pages/edit_note_page.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/create_folder_dialog.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/path_navigation_widget.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

class ViewAllPage extends HookConsumerWidget {
  final int? folderId;

  const ViewAllPage({super.key, this.folderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFolderID = useState(folderId);
    final pageOffset = useState(0);

    final currentPathAsync = ref.watch(
      currentPathProvider(folderParentId: currentFolderID.value),
    );

    AsyncValue folderAsync = ref.watch(
      foldersByParentProvider(
        parentId: currentFolderID.value,
        limit: AppConstants.folderPageLimit,
        offset: pageOffset.value,
      ),
    );

    final notesAsync = ref.watch(
      fetchNotesByFolderIdProvider(currentFolderID.value),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.scaffoldBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            NotesAppBar(
              title: 'View All',
              onBackButtonPressed: () async {
                if (currentFolderID.value == null) {
                  Navigator.of(context).pop();
                  return;
                } else {
                  final selectedFolder = await ref.read(
                    folderByIdProvider(currentFolderID.value!).future,
                  );
                  currentFolderID.value = selectedFolder?.parentId;
                }
              },
            ),
            // SliverToBoxAdapter(child: Text('Path: ${currentPathAsync.value}')),
            SliverToBoxAdapter(
              child: PathNavigationWidget(
                folders: currentPathAsync.value ?? [],
                selectedFolderId: currentFolderID.value,
                onPathSelected: (id) {
                  currentFolderID.value = id;
                },
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: AppSpacing.paddingAllS,
                child: _buildCombinedGrid(
                  folderAsync,
                  notesAsync,
                  ref,
                  currentFolderID,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: AppFab(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) =>
                  CreateFolderDialog(parentId: currentFolderID.value),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCombinedGrid(
    AsyncValue folderAsync,
    AsyncValue notesAsync,
    WidgetRef ref,
    ValueNotifier<int?> currentFolderId,
  ) {
    if (folderAsync.isLoading || notesAsync.isLoading) {
      return FolderGridVewSkeleton(itemCount: 20);
    }

    if (folderAsync.hasError) {
      return AppErrorWidget(
        onRetry: () => ref.refresh(
          rootFoldersProvider(limit: AppConstants.folderPageLimit, offset: 0),
        ),
      );
    }

    final folders = folderAsync.value ?? [];
    final notes = notesAsync.value ?? [];
    final totalItems = folders.length + notes.length;

    if (totalItems == 0) {
      return InfoCard(
        message: 'Nothing here!',
      );
    }

    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: totalItems,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        // Show folders first, then notes
        if (index < folders.length) {
          final FolderEntity folder = folders[index];
          final count = ref.watch(totalItemsCountProvider(folder.id));
          return count.when(
            loading: () => const SizedBox(
              width: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => ErrorWidget(error),
            data: (value) => FolderButton(
              folder: folder,
              itemCount: value,
              onTap: () {
                currentFolderId.value = folder.id;
              },
            ),
          );
        } else {
          final NoteEntity note = notes[index - folders.length];
          return NoteItemWidget(
            note: note,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNotePage(noteId: note.id),
              ),
            ),
          );
        }
      },
    );
  }
}


