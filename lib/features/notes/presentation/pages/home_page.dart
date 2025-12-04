import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/core/widgets/folder_button.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/home_page_header.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/recent_notes.dart';
import '../../domain/entities/folder_entity.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final rootFoldersAsync = ref.watch(rootFoldersProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Notes Bucket',
                style: AppTextStyles.headlineMedium(context),
              ),
              centerTitle: true,
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 150,
            toolbarHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: AppSpacing.paddingAllS,
                child: Column(
                  children: [
                    Row(
                      children: [
                        HomePageHeader(title: 'My Folders'),
                        const Spacer(),
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
                                onPressPrimary: () async {
                                  final folderName = controller.text.trim();
                                  if (folderName.isNotEmpty) {
                                    final newFolder = FolderEntity(
                                      id: 0,
                                      name: folderName,
                                      parentId: null,
                                      createdAt: DateTime.now(),
                                      updatedAt: DateTime.now(),
                                    );
                                    try {
                                      await ref
                                          .read(folderControllerProvider
                                              .notifier)
                                          .createFolder(newFolder);
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        AppSnackBar.showSuccess(
                                          context,
                                          'Folder created successfully!',
                                        );
                                      }

                                    } catch (e) {
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                        AppSnackBar.showError(
                                          context,
                                          'Failed to create folder: $e',
                                        );
                                      }
                                      rethrow;
                                    }
                                  }
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
                    rootFoldersAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                      data: (data) => SizedBox(
                        height: 100,
                        child: data.isEmpty
                            ? Center(
                                child: Text(
                                  'No folders found. Create a new folder!',
                                  style: AppTextStyles.bodyMedium(context),
                                ),
                              )
                            : ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                separatorBuilder: (context, index) =>
                                    AppSpacing.gapM,
                                itemBuilder: (context, index) {
                                  final folder = data[index];
                                  return FolderButton(folder: folder);
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.paddingAllS,
              child: Column(
                children: [
                  HomePageHeader(title: 'Recent Notes'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: const RecentNotes(),
                  ),
                  SizedBox(height: 150, child: SvgPicture.asset(AppSvgs.moon)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.editNotes);
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
