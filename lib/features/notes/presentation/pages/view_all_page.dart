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
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/create_folder_dialog.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootFoldersAsync = ref.watch(
      rootFoldersProvider(limit: AppConstants.folderPageLimit, offset: 0),
    );
    final controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar('View All'),
          SliverFillRemaining(
            child: Padding(
              padding: AppSpacing.paddingAllS,
              child: rootFoldersAsync.when(
                data: (data) => data.isEmpty
                ? InfoCard(message: 'No folders found!', primaryImage: AppImages.confusedCat)
                : GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final folder = data[index];
                    return FolderButton(folder: folder);
                  },
                ),
                error: (err, st) => AppErrorWidget(
                  onRetry: () => ref.refresh(
                    rootFoldersProvider(
                      limit: AppConstants.folderPageLimit,
                      offset: 0,
                    ),
                  ),
                ),
                loading: () => FolderGridVewSkeleton(itemCount: 20),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AppFab(
        onPressed: () async {
          await createFolderDialog(context, ref, controller);
        },
      ),
    );
  }
}
