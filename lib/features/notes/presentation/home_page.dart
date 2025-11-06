import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_alert_dialog.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/folder_button.dart';
import 'widgets/home_page_header.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Notes Home Page')),
      body: Padding(
        padding: AppSpacing.paddingAllS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                HomePageHeader(title: 'My Folders'),
                IconButton(
                  onPressed: () {
                    // Add dialog to create new folder
                    showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                        dialogTitle: 'Create New Folder',
                        primaryButtonText: 'Create',
                        primaryButtonColor: Theme.of(
                          context,
                        ).colorScheme.primary,
                        content: AppTextField(
                          controller: controller,
                          hintText: 'Folder Name',
                        ),
                        secondaryButtonText: 'Cancel',
                        onPressPrimary: () {
                          // Handle folder creation logic here
                          Navigator.pop(context);
                        },
                        onPressSecondary: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_circle_rounded),
                ),
              ],
            ),
            AppSpacing.gapS,
            Row(
              children: [
                FolderButton(title: 'Homework'),
                FolderButton(title: 'Workout'),
                FolderButton(title: 'Sports'),
              ],
            ),
            AppSpacing.gapM,
            HomePageHeader(title: 'Recent Notes'),

            Expanded(child: RecentNotes()),
          ],
        ),
      ),
    );
  }
}
