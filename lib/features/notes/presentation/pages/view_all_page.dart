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
import 'package:notes_bucket/features/notes/presentation/providers/view_all_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/create_folder_dialog.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // take route arg once and seed the state provider if needed
    final routeParentId = ModalRoute.of(context)?.settings.arguments as int?;
    final selectedParentId = ref.watch(selectedParentIdProvider);
    int pageOffset = 0;
    if (selectedParentId == null && routeParentId != null) {
      // set initial parent id after the first frame to avoid build loops
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

    final controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar('View All'),
          SliverToBoxAdapter(child: Text('Path: ${currentPathAsync.value}')),
          SliverFillRemaining(
            child: Padding(
              padding: AppSpacing.paddingAllS,
              child: folderAsync.when(
                data: (data) => data.isEmpty
                    ? InfoCard(
                        message: 'Nothing here!',
                        primaryImage: AppImages.confusedCat,
                      )
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                            ),
                        itemBuilder: (context, index) {
                          final folder = data[index];
                          return FolderButton(
                            folder: folder,
                            onTap: () {
                              // update the selected parent id via the provider
                              ref
                                  .read(selectedParentIdProvider.notifier)
                                  .setId(folder.id);
                              // optionally invalidate dependent providers to force refresh
                              ref.invalidate(
                                currentPathProvider(parentId: folder.id),
                              );
                              ref.invalidate(
                                foldersByParentProvider(
                                  parentId: folder.id,
                                  limit: AppConstants.folderPageLimit,
                                  offset: 0,
                                ),
                              );
                            },
                          );
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
          await createFolderDialog(context, ref, controller, selectedParentId);
        },
      ),
    );
  }
}
