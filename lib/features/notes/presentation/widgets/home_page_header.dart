import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/app_alert_dialog.dart';


class HomePageHeader extends ConsumerWidget {
  final String title;
  const HomePageHeader({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headlineLarge(context),),
      ],
    );
  }
}
