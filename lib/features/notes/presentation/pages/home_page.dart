import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/buttons/folder_button.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/core/widgets/cards/info_card.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';
import 'package:notes_bucket/core/widgets/skeletons/folder_grid_view_skeleton.dart';
import 'package:notes_bucket/features/user/data/models/user.dart';
import 'package:notes_bucket/features/notes/presentation/pages/view_all_page.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/folder_dialogs.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/home_page_header.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secureStorageController = ref.watch(secureStorageControllerProvider);
    final user = useState<User?>(null);
    secureStorageController.whenData(
      (data) => user.value = data?.authResponseModel?.user,
    );
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            NotesAppBar(
              title: 'Notes Bucket',
              isSettingsBtnVisible: true,
              isBackButtonVisible: false,
            ),
            SliverToBoxAdapter(
              child: AppContainer(child: Text(user.value.toString())),
            ),
            myFoldersSliverAppBar(context, ref),
            recentNoteSliverBox(context),
          ],
        ),
        floatingActionButton: Padding(
          padding: AppSpacing.paddingAllS,
          child: AppElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.editNotes),
            text: 'New Note',
          ),
        ),
      ),
    );
  }

  SliverAppBar myFoldersSliverAppBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: true,
      backgroundColor: Colors.transparent,
      expandedHeight: 230,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: AppContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              myFolderHeader(context),
              Expanded(child: Center(child: myFolderListView(ref, context))),
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
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.pushNamed(context, AppRoutes.viewAll),
        child: AppContainer(child: Text('View All')),
      ),
    );
  }

  SliverToBoxAdapter recentNoteSliverBox(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppContainer(
        child: Column(
          children: [
            HomePageHeader(title: '📝 Notes'),
            const SizedBox(height: 15),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: const RecentNotes(),
            ),
            InfoCard(message: 'You have reached the void\n\n'),
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
      padding: AppSpacing.verticalS,
      height: 160,
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
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final folder = data[index];
                  final count = ref.watch(totalItemsCountProvider(folder.id));

                  return count.when(
                    loading: () => const SizedBox(
                      width: 100,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (error, stack) => ErrorWidget(error),
                    data: (value) => FolderButton(
                      itemCount: value,
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
                    ),
                  );
                },
              ),
      ),
    );
  }

  Row myFolderHeader(BuildContext context) {
    return Row(
      children: [
        HomePageHeader(title: '📁 Folders'),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) => CreateFolderDialog(parentId: null),
            );
          },
          icon: AppContainer(
            outerPadding: const EdgeInsets.all(0),
            innerPadding: const EdgeInsets.all(2),
            borderRadius: 12,
            child: Icon(
              Icons.add_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
