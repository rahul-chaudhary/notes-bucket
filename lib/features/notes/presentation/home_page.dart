import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/folder_button.dart';
import 'widgets/home_page_header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Home Page'),
      ),
      body: Padding(
        padding: AppSpacing.paddingAllS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageHeader(title: 'My Folders'),
            AppSpacing.gapS,
            Row(
              children: [
                FolderButton(title: 'Homework',),
                FolderButton(title: 'Workout',),
                FolderButton(title: 'Sports',),
              ],
            ),
            AppSpacing.gapM,
            HomePageHeader(title: 'Recent Notes'),

            Expanded(
              child: RecentNotes(),
            ),
          ],
        ),
      ),
    );
  }
}







