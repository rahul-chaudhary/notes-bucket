import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_spacing.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final Color color;
  const AppContainer({
    super.key,
    this.child,
    this.borderRadius = 12.0,
    this.outerPadding = AppSpacing.paddingAllS,
    this.innerPadding = AppSpacing.paddingAllS,
    this.color = Colors.white10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Container(
        padding: innerPadding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Colors.white24,
            width: 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
