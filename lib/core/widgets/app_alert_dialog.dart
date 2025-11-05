import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

class AppAlertDialog extends StatelessWidget {
  final String dialogTitle;
  final String primaryButtonText;
  final Color primaryButtonColor;
  final String secondaryButtonText;
  final VoidCallback onPressPrimary;
  final VoidCallback onPressSecondary;
  final Widget content;

  const AppAlertDialog({
    super.key,
    required this.dialogTitle,
    required this.primaryButtonText,
    required this.primaryButtonColor,
    required this.secondaryButtonText,
    required this.onPressPrimary,
    required this.onPressSecondary,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      backgroundColor: Theme.of(context).cardColor,
      content: content,
      actions: [
        TextButton(
          onPressed: onPressSecondary,
          child: Text(secondaryButtonText, style: AppTextStyles.bodySmall(context)),
        ),
        FilledButton(
          onPressed: onPressPrimary,
          style: FilledButton.styleFrom(
            backgroundColor: primaryButtonColor,
          ),
          child: Text(primaryButtonText),
        ),
      ],
    );
  }
}
