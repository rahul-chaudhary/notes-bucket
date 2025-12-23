import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/buttons/app_fab.dart';
import 'package:notes_bucket/core/widgets/buttons/app_text_button.dart';
import 'package:notes_bucket/core/widgets/buttons/folder_button.dart';
import 'package:notes_bucket/core/widgets/cards/info_card.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/core/widgets/skeletons/folder_grid_view_skeleton.dart';
import 'package:notes_bucket/features/notes/presentation/pages/view_all_page.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/create_folder_dialog.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/home_page_header.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar(title: 'Notes Bucket', isBackButtonVisible: false),
          myFoldersSliverAppBar(context, ref),
          recentNoteSliverBox(context),
        ],
      ),
      floatingActionButton: AppElevatedButton(),
    );
  }

  SliverAppBar myFoldersSliverAppBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 190,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: AppSpacing.paddingAllS,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              myFolderHeader(context),
              myFolderListView(ref, context),
              viewAllButton(context),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Align viewAllButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppTextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.viewAll);
        },
      ),
    );
  }

  SliverToBoxAdapter recentNoteSliverBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppSpacing.paddingAllS,
        child: Column(
          children: [
            HomePageHeader(title: 'Recent Notes'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: const RecentNotes(),
            ),
            InfoCard(
              message: 'You have reached the void\n\n',
              primaryImage: AppImages.playfulCat,
            ),
          ],
        ),
      ),
    );
  }

  Container myFolderListView(WidgetRef ref, BuildContext context) {
    final rootFoldersAsync = ref.watch(
      rootFoldersProvider(limit: 3, offset: 0),
    );
    return Container(
      color: Colors.transparent,
      height: 120,
      child: rootFoldersAsync.when(
        loading: () => FolderGridVewSkeleton(itemCount: 3),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (data) => data.isEmpty
            ? Center(
                child: Text(
                  'No folders found. Create a new folder!',
                  style: AppTextStyles.bodyMedium(context),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final folder = data[index];
                  return FolderButton(
                    folder: folder,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewAllPage(folderId: folder.id),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }

  Row myFolderHeader(BuildContext context) {
    return Row(
      children: [
        HomePageHeader(title: 'My Folders'),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) => CreateFolderDialog(parentId: null),
            );
          },
          icon: const Icon(Icons.add_circle_rounded),
        ),
      ],
    );
  }
}
