import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/features/notes/domain/entities/note_entity.dart';
import 'package:notes_bucket/features/notes/domain/usecases/note_usecases.dart';
import 'package:notes_bucket/features/notes/presentation/pages/edit_note_page.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_style.dart';

class RecentNotes extends ConsumerWidget {
  const RecentNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(fetchAllNotesProvider(
      const FetchAllNotesParams(limit: 20, offset: 0),
    ));

    return notesAsync.when(
      data: (notes) => MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: notes.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = notes[index];
          return NoteItemWidget(
            note: item,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNotePage(noteId: item.id),
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: ${error.toString()}'),
      ),
    );
  }
}

class NoteItemWidget extends ConsumerWidget {
  final NoteEntity note;
  final VoidCallback onTap;

  const NoteItemWidget({
    super.key,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteFolderAsync = ref.read(folderByIdProvider(note.folderId));
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(12),
      elevation: 4,
      shadowColor: Theme.of(context).splashColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12), // Match container radius
        splashColor: Colors.amber.withAlpha(100),
        child: Stack(
          children: [
            Container(
              height: (note.content?.length?? 0) > 100 ? 150 : 100,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title ?? 'Untitled',
                    maxLines: 1,
                    style: AppTextStyles.headlineSmall(context),
                  ),
                  Flexible(
                    child: Text(
                      note.content ?? '',
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmall(context),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: noteFolderAsync.when(
                  data: (folder) => FolderTag(folderName: folder!.name),
                  error: (error, stack) => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink()),
            ),
          ],
        ),
      ),
    );
  }
}

class FolderTag extends StatelessWidget {
  final String folderName;
  const FolderTag({
    super.key,
    required this.folderName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.folder_open_rounded, size: 10, color: Theme.of(context).colorScheme.onSecondary,),
          AppSpacing.gapXS,
          Text('Homework', style: AppTextStyles.bodyXSmall(context).copyWith(color: Theme.of(context).colorScheme.onSecondary),),
        ],
      ),
    );
  }
}
