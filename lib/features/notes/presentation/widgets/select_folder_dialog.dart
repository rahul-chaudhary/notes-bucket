import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_constants.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/app_alert_dialog.dart';
import 'package:notes_bucket/core/widgets/buttons/app_arrow_button.dart';
import 'package:notes_bucket/features/notes/presentation/providers/folder_provider.dart';
import 'package:notes_bucket/features/notes/presentation/widgets/path_navigation_widget.dart';
import 'create_folder_dialog.dart';
import 'folder_list_tile.dart';

class SelectFolderDialog extends HookConsumerWidget {
  const SelectFolderDialog({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFolderId = useState<int?>(null);
    final warningText = useState<String>('');
    final pageOffset = useState(0);
    final currentPathAsync = ref.watch(
      currentPathProvider(folderParentId: currentFolderId.value),
    );
    AsyncValue folderAsync = ref.watch(
      foldersByParentProvider(
        parentId: currentFolderId.value,
        limit: AppConstants.folderPageLimit,
        offset: pageOffset.value,
      ),
    );

    return AppAlertDialog(
      dialogHeader: Row(
        children: [
          AppArrowButton(
            position: ArrowPosition.back,
            disabled: currentFolderId.value == null,
            onTap: () async {
              if (currentFolderId.value != null) {
                try {
                  final folder = await ref.read(
                    folderByIdProvider(currentFolderId.value!).future,
                  );
                  dbPrint('Folder ${folder?.toString()}');
                  currentFolderId.value = folder?.parentId;
                } catch (e) {
                  dbPrint('Error fetching folder:', e: e);
                }
              }
            },
          ),
          Expanded(child: Center(child: Text('Select Folder'))),
        ],
      ),
      primaryButtonText: 'Save Here',
      primaryBtnTextColor: Colors.white,
      primaryButtonColor: currentFolderId.value != null
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).disabledColor,
      secondaryButtonText: 'Cancel',
      onPressPrimary: () {
        if (currentFolderId.value == null) {
          warningText.value = 'Please select a folder to save your note in.';
        } else {
          Navigator.of(context).pop(currentFolderId.value);
        }
      },
      onPressSecondary: () {
        Navigator.of(context).pop(null);
      },
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
              height: getScreenHeight(context) / 2,
              width: double.maxFinite,
              child: folderAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return FolderListTile(
                      title: item.name,
                      onTap: () {
                        warningText.value = '';
                        currentFolderId.value = item.id;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          const Divider(),
          PathNavigationWidget(
            folders: currentPathAsync.value ?? [],
            selectedFolderId: currentFolderId.value,
            onPathSelected: (id) {
              currentFolderId.value = id;
            },
          ),
          ListTile(
            leading: Icon(
              Icons.create_new_folder,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Create New Folder',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () async => await showDialog(
              context: context,
              builder: (context) => CreateFolderDialog(parentId: currentFolderId.value),
            ),
          ),
          Text(
            warningText.value,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
