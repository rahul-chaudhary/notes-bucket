import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final VoidCallback onPressed;
  const AppTextButton({super.key, required this.onPressed, required this.text, this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
          text,
          style: textStyle ?? AppTextStyles.hyperlink(color)
      ),
    );
  }
}
