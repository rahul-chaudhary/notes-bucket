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
          height: (index % 5 + 1) * 50, // Random height variation
          child: Center(
            child: Text(
              'Item $index',
              style: AppTextStyles.bodyMedium(context),
            ),
          ),
        );
      },
    );
  }
}