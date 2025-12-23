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
      child: ListView.separated(
        itemCount: folders.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildPathButton(
              context: context,
              label: 'Home',
              folderId: null,
              onPressed: () => onPathSelected(null),
            );
          }

          final folder = folders[index - 1];
          return _buildPathButton(
            context: context,
            label: folder.name,
            folderId: folder.id,
            onPressed: () => onPathSelected(folder.id),
          );
        },
        separatorBuilder: (context, index) =>
        const Icon(Icons.arrow_forward_ios_rounded, size: 12),
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
      child: Text(
        label,
        style: AppTextStyles.bodyMedium(context).copyWith(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).textTheme.bodyMedium?.color,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
