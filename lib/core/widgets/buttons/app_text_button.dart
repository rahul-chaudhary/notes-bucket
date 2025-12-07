import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AppTextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
          'View All',
          style: AppTextStyles.hyperlink(context)
      ),
    );
  }
}
