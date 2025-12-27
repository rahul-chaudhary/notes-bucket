import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color? btnColor;
  final Color? btnTextColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final VoidCallback onPressed;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.btnColor,
    this.borderRadius,
    this.btnTextColor,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20,
          vertical: verticalPadding ?? 15,
        ),
        backgroundColor: btnColor ?? theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.button(
          context,
        ).copyWith(color: btnTextColor ?? theme.colorScheme.onSecondary),
      ),
    );
  }
}
