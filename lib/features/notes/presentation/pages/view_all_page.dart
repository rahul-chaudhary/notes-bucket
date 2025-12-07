import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/widgets/notes_app_bar.dart';

class ViewAllPage extends ConsumerWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NotesAppBar('View All')
        ]
      )
    );
  }
}
