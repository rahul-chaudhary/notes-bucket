import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';

class RecentNotes extends StatelessWidget {
  const RecentNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      // Number of columns
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: 10,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return NoteItem(
          title: 'This is my title of the notes',
          content:
              'Lorem ipsum txt is just random shit which does not mean anything. It just used to add element to mock website to see the look of the website.',
          onTap: () {

          }
        );
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
        child: Container(
          height: content.length > 100 ? 150 : 100,
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
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
                  style: AppTextStyles.bodyMedium(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
