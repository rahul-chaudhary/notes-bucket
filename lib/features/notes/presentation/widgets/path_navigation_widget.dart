import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';

class PathNavigationWidget extends StatelessWidget {
  final List<FolderEntity> folders;
  final int? selectedFolderId;
  final Function(int?) onPathSelected;

  const PathNavigationWidget({
    super.key,
    required this.folders,
    required this.selectedFolderId,
    required this.onPathSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Home button
            _buildPathButton(
              context: context,
              label: 'Home',
              folderId: null,
              onPressed: () => onPathSelected(null),
            ),

            // Folders in path
            ...folders.expand((folder) => [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(Icons.arrow_forward_ios_rounded, size: 12),
              ),
              _buildPathButton(
                context: context,
                label: folder.name,
                folderId: folder.id,
                onPressed: () => onPathSelected(folder.id),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildPathButton({
    required BuildContext context,
    required String label,
    required int? folderId,
    required VoidCallback onPressed,
  }) {
    final isSelected = folderId == selectedFolderId;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        backgroundColor: isSelected ? Colors.white10: null,
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyMedium(context).copyWith(
          color: Theme.of(context).textTheme.bodyMedium?.color,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}