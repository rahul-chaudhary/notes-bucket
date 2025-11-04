import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_text_style.dart';

class FolderButton extends ConsumerWidget {
  final String title;
  const FolderButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.primary.withAlpha(100),
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Column(
            children: [
              Icon(Icons.folder, size: 80, color: Theme.of(context).colorScheme.primary),
              Text(title, style: AppTextStyles.bodySmall(context)),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                ),
                child: const Text('2')),
          ),
        ],
      ),
    );
  }
}