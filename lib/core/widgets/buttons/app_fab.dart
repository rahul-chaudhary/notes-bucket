import 'package:flutter/material.dart';

class AppFab extends StatelessWidget {
  final VoidCallback onPressed;
  const AppFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
