import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class NotesAppBar extends ConsumerWidget {
  final String title;
  final bool isBackButtonVisible;
  const NotesAppBar(this.title,{this.isBackButtonVisible = true, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: isBackButtonVisible
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
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
