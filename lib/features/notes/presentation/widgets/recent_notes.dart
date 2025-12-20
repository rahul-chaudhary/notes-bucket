import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/features/notes/presentation/providers/notes_provider.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_style.dart';

class RecentNotes extends ConsumerWidget {
  const RecentNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final notes = ref.watch();
    return MasonryGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      // Number of columns
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      // itemCount: notes.value?.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return SizedBox.shrink();
        // final item = notes.value?[index];
        // return NoteItem(
        //   title: item?.title ?? 'Untitled',
        //   content: item?.content ?? '',
        //   onTap: () => Navigator.pushNamed(context, AppRoutes.editNotes),
        //
        // );
      },
    );
  }
}

class NoteItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  const NoteItem({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
              height: content.length > 100 ? 150 : 100,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: AppTextStyles.headlineSmall(context),
                  ),
                  Flexible(
                    child: Text(
                      content,
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
              child: FolderTag(folderName: 'Homework'),
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
