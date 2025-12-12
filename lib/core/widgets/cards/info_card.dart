import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';

class InfoCard extends StatelessWidget {
  final String message;
  final String primaryImage;

  const InfoCard({
    super.key,
    required this.message,
    required this.primaryImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: AppSpacing.paddingAllM,
          child: Image.asset(primaryImage, height: 150),
        ),
        Text(message, style: AppTextStyles.headlineSmall(context)),
      ],
    );
  }
}
