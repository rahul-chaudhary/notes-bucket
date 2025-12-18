import 'package:flutter/material.dart';

class FolderListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const FolderListTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          Icons.folder,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(title),
      ),
    );
  }
}