import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_text_style.dart';

class HomePageHeader extends ConsumerWidget {
  final String title;
  const HomePageHeader({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(title, style: AppTextStyles.headlineLarge(context),);
  }
}