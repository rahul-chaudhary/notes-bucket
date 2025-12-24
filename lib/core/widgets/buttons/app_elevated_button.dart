import 'package:flutter/material.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: theme.colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.editNotes),
      child: Text(
        'Create Note',
        style: AppTextStyles.button(context).copyWith(color: theme.colorScheme.onSecondary),
      ),
    );
  }
}
