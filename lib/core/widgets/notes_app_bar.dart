import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/core/widgets/internet_connection_widget.dart';
import 'package:notes_bucket/core/widgets/sync_monitor.dart';

class NotesAppBar extends ConsumerWidget {
  final String title;
  final bool isBackButtonVisible;
  final bool isSettingsBtnVisible;
  final VoidCallback? onBackButtonPressed;
  const NotesAppBar({
    super.key,
    required this.title,
    this.isBackButtonVisible = true,
    this.isSettingsBtnVisible = false,
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
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.headlineMedium(context),
            ),
            // InternetConnectionWidget(),
            const SizedBox(height: 2),
            SyncMonitor()
          ],
        ),
        centerTitle: true,
      ),
      actions: [
        if (isSettingsBtnVisible)
        Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            splashColor: theme.colorScheme.primary.withAlpha(100),
            child: AppContainer(
              child: Icon(Icons.settings_rounded, color: theme.colorScheme.onSurface),
            ),
          ),
        )
      ],
    );
  }
}
