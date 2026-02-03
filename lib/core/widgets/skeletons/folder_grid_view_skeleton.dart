import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/widgets/buttons/folder_button.dart';
import 'package:notes_bucket/features/notes/domain/entities/folder_entity.dart';
import 'package:notes_bucket/features/sync/models/sync_status_enum.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FolderGridVewSkeleton extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;

  const FolderGridVewSkeleton({
    super.key,
    this.crossAxisCount = 3,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          mainAxisExtent: 120,
        ),
        itemBuilder: (context, index) {
          final sampleFolder = FolderEntity(
            id: '',
            name: 'Loading...',
            retryCount: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            syncStatus: SyncStatus.synced,
          );
          return SizedBox(
            height: 100,
            child: FolderButton(
              color: AppColors.shimmer,
              folder: sampleFolder,
              itemCount: 0,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
