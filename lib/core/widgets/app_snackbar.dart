import 'package:flutter/material.dart';

enum SnackBarType {
  success,
  error,
  info,
  warning,
}

class AppSnackBar {
  // Static method to show snackbar - no need for StatelessWidget
  static void show(
      BuildContext context, {
        required String message,
        SnackBarType type = SnackBarType.info,
        Duration duration = const Duration(seconds: 3),
        bool showCloseIcon = true,
      }) {
    // Remove any existing snackbar first
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    Color backgroundColor;
    Color textColor = Colors.white;
    IconData? icon;
    Color iconColor = Colors.white;

    // Set colors and icons based on type
    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        icon = Icons.error;
        break;
      case SnackBarType.info:
        backgroundColor = Colors.blue;
        icon = Icons.info;
        break;
      case SnackBarType.warning:
        backgroundColor = Colors.yellow.shade600;
        textColor = Colors.black;
        icon = Icons.warning;
        iconColor = Colors.black;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            ...[
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
          ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        padding: const EdgeInsets.all(16.0),
        showCloseIcon: showCloseIcon,
        closeIconColor: iconColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Convenience methods for different types
  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.error);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.info);
  }
  static void showWarning(BuildContext context, String message) {
    show(context, message: message, type: SnackBarType.warning);
  }
}
