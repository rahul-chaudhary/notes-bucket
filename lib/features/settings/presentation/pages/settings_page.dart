import 'package:flutter/material.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradient.scaffoldBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            NotesAppBar(title: 'Settings', isBackButtonVisible: true),
          ],
        ),
      ),
    );
  }
}
