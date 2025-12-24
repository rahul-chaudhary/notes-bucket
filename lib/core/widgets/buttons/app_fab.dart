import 'package:flutter/material.dart';

class AppFab extends StatelessWidget {
  final Widget? child;
  final VoidCallback onPressed;
  const AppFab({super.key, required this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      backgroundColor: theme.colorScheme.secondary,
      onPressed: onPressed,

      child: child ?? Icon(
        Icons.add,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}
