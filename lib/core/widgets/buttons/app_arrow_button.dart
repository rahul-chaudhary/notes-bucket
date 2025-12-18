import 'package:flutter/material.dart';

enum ArrowPosition { back, forward }

class AppArrowButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool disabled;
  final ArrowPosition position;

  const AppArrowButton({super.key,required this.position, this.disabled = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).splashColor,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            position == ArrowPosition.back
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_forward_ios_rounded,
            size: 12,
          ),
        ),
      ),
    );
  }
}
