import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

class AppAlertDialog extends StatelessWidget {
  final Widget dialogHeader;
  final String primaryButtonText;
  final Color primaryButtonColor;
  final Color primaryBtnTextColor;
  final String secondaryButtonText;
  final VoidCallback onPressPrimary;
  final VoidCallback onPressSecondary;
  final Widget content;

  const AppAlertDialog({
    super.key,
    required this.dialogHeader,
    required this.primaryButtonText,
    required this.primaryButtonColor,
    required this.primaryBtnTextColor,
    required this.secondaryButtonText,
    required this.onPressPrimary,
    required this.onPressSecondary,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: dialogHeader,
      backgroundColor: theme.cardColor,
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
          child: Text(primaryButtonText, style: AppTextStyles.bodyMedium(context).copyWith(color: primaryBtnTextColor),),
        ),
      ],
    );
  }
}
