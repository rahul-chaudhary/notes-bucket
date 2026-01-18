import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/utils/internet_status.dart';

class InternetConnectionWidget extends ConsumerWidget {
  const InternetConnectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internetStatus = ref.watch(internetListenerProvider);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(
        Icons.circle,
        size: 10,
        color: internetStatus == InternetStatus.connected
            ? Colors.green
            : Colors.red,
      ),
    );
  }
}
