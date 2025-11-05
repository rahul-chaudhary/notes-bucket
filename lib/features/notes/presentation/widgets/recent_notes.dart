import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/theme/app_text_style.dart';

class RecentNotes extends StatelessWidget {

  const RecentNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2, // Number of columns
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: 10,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return NoteItem(title: 'This is my title of the notes', content: 'Lorem ipsum txt is just random shit which does not mean anything. It just used to add element to mock website to see the look of the website.',);
      },
    );
  }
}

class NoteItem extends StatelessWidget {
  final String title;
  final String content;
  const NoteItem({
    super.key, required this.title, required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      height: content.length > 100 ? 150: 100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0 , 8.0, 16.0),
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
    );
  }
}