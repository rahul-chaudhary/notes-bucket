import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/widgets/errors/app_error_widget.dart';
import 'package:notes_bucket/core/widgets/folder_button.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/core/widgets/skeletons/folder_grid_view_skeleton.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootFoldersAsync = ref.watch(
      rootFoldersProvider(limit: 15, offset: 0),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar('View All'),
          SliverFillRemaining(
            child: Padding(
              padding: AppSpacing.paddingAllS,
              child: rootFoldersAsync.when(
                  data: (data) => GridView.builder(
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
                      return FolderButton(folder: folder);
                    },),
                  error: (err, st) => AppErrorWidget(onRetry: () => ref.refresh(rootFoldersProvider(limit: 15, offset: 0))),
                  loading: () => FolderGridVewSkeleton(itemCount: 20),)
            ),
          ),
        ],
      ),
    );
  }
}


