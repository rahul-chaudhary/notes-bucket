import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/widgets/buttons/app_fab.dart';
import 'package:notes_bucket/core/widgets/cards/info_card.dart';
import 'package:notes_bucket/core/widgets/errors/app_error_widget.dart';
import 'package:notes_bucket/core/widgets/buttons/folder_button.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/core/widgets/skeletons/folder_grid_view_skeleton.dart';
import 'package:notes_bucket/features/notes/presentation/pages/edit_note_page.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/view_all_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/create_folder_dialog.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeParentId = ModalRoute.of(context)?.settings.arguments as int?;
    final selectedParentId = ref.watch(selectedParentIdProvider);
    int pageOffset = 0;

    if (selectedParentId == null && routeParentId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedParentIdProvider.notifier).setId(routeParentId);
      });
    }

    AsyncValue currentPathAsync = ref.watch(
      currentPathProvider(parentId: selectedParentId),
    );

    AsyncValue folderAsync = ref.watch(
      foldersByParentProvider(
        parentId: selectedParentId,
        limit: AppConstants.folderPageLimit,
        offset: pageOffset,
      ),
    );

    final notesAsync = ref.watch(fetchNotesByFolderIdProvider(selectedParentId));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar('View All'),
          SliverToBoxAdapter(child: Text('Path: ${currentPathAsync.value}')),
          SliverFillRemaining(
            child: Padding(
              padding: AppSpacing.paddingAllS,
              child: _buildCombinedGrid(folderAsync, notesAsync, ref, selectedParentId),
            ),
          ),
        ],
      ),
      floatingActionButton: AppFab(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => CreateFolderDialog(parentId: selectedParentId),
          );
        },
      ),
    );
  }

  Widget _buildCombinedGrid(
      AsyncValue folderAsync,
      AsyncValue notesAsync,
      WidgetRef ref,
      int? selectedParentId,
      ) {
    if (folderAsync.isLoading || notesAsync.isLoading) {
      return FolderGridVewSkeleton(itemCount: 20);
    }

    if (folderAsync.hasError) {
      return AppErrorWidget(
        onRetry: () => ref.refresh(
          rootFoldersProvider(
            limit: AppConstants.folderPageLimit,
            offset: 0,
          ),
        ),
      );
    }

    final folders = folderAsync.value ?? [];
    final notes = notesAsync.value ?? [];
    final totalItems = folders.length + notes.length;

    if (totalItems == 0) {
      return InfoCard(
        message: 'Nothing here!',
        primaryImage: AppImages.confusedCat,
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
          final folder = folders[index];
          return FolderButton(
            folder: folder,
            onTap: () {
              ref.read(selectedParentIdProvider.notifier).setId(folder.id);
              ref.invalidate(currentPathProvider(parentId: folder.id));
              ref.invalidate(
                foldersByParentProvider(
                  parentId: folder.id,
                  limit: AppConstants.folderPageLimit,
                  offset: 0,
                ),
              );
            },
          );
        } else {
          final note = notes[index - folders.length];
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
