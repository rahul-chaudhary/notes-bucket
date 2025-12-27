import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class AppRichTextButton extends StatelessWidget {
  final String primaryText;
  final String btnText;
  final VoidCallback onBtnPressed;
  const AppRichTextButton({
    super.key, required this.primaryText, required this.btnText, required this.onBtnPressed,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: primaryText,
        // style: ,
        children: <TextSpan>[
          TextSpan(
            text: btnText,
            style: AppTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onBtnPressed,
          ),
        ],
      ),
    );
  }
}