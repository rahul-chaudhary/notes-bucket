import 'package:flutter/material.dart';

class FolderListTile extends StatelessWidget {
  final String title;
  const FolderListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      onTap: () {

      },
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