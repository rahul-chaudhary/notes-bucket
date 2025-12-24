import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class NotesAppBar extends ConsumerWidget {
  final String title;
  final bool isBackButtonVisible;
  final VoidCallback? onBackButtonPressed;
  const NotesAppBar({
    super.key,
    required this.title,
    this.isBackButtonVisible = true,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      backgroundColor: Colors.transparent,
      leading: isBackButtonVisible
          ? IconButton(
        icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          color: theme.colorScheme.onSurface,
        ),
        onPressed: onBackButtonPressed ?? () => Navigator.of(context).pop(),
      )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: AppTextStyles.headlineMedium(context),
        ),
        centerTitle: true,
      ),
    );
  }
}
