import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_strings.dart';
///Get device type
String get getDeviceType {
  if (kIsWeb) {
    return 'web';
  } else if (Platform.isIOS) {
    return 'ios';
  } else if (Platform.isAndroid) {
    return 'android';
  } else {
    return 'unknown';
  }
}

/// Launch TOS URL
// Future<void> launchTOSUrl(BuildContext context) async {
//   try {
//     final Uri tosUri = Uri.parse(ApiService.baseUrl + ApiRoute.tos);
//     if (await canLaunchUrl(tosUri)) {
//       await launchUrl(tosUri);
//     } else {
//       if (!context.mounted) return;
//       AppSnackBar.showError(
//         context,
//         'Could not launch Terms of service in the browser.',
//       );
//     }
//   } catch (e, s) {
//     dbPrint('Error launching tos URL: $e\n$s');
//     rethrow;
//   }
// }

/// Launch Privacy Policy URL
// Future<void> launchPrivacyPolicyUrl(BuildContext context) async {
//   try {
//     final Uri privacyPolicyUrl = Uri.parse(AppStrings.privacyPolicyUrl);
//     if (await canLaunchUrl(privacyPolicyUrl)) {
//       await launchUrl(privacyPolicyUrl);
//     } else {
//       if (!context.mounted) return;
//       AppSnackBar.showError(
//         context,
//         'Could not launch Privacy Policy in the browser.',
//       );
//     }
//   } catch (e, s) {
//     dbPrint('Error launching Privacy Policy URL: $e\n$s');
//     rethrow;
//   }
// }

/// Launches the support email client with pre-filled subject and body.
// Future<void> launchSupportEmail(BuildContext context) async {
//   try {
//     sendEmail(
//       toEmail: AppStrings.helpEmail,
//       subject: 'Help & Feedback - FunTables App',
//       body:
//           '[Mention your issue or feedback here].\n\n'
//           'App Version: \n'
//           'Device: \n'
//           'OS Version: \n',
//     );
//   } catch (e, s) {
//     dbPrint('Error launching support email: $e\n$s');
//     rethrow;
//   }
// }

Future<void> sendEmail({
  required String toEmail,
  String? subject,
  String? body,
}) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: toEmail,
    query: encodeQueryParameters({
      'subject': subject ?? 'Support Request',
      'body': body ?? '',
    }),
  );
  launchUrl(emailLaunchUri);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map(
        (MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
      )
      .join('&');
}

int generateRandomNumber(int min, int max) {
  if (min >= max) {
    throw ArgumentError('Minimum value must be less than maximum value.');
  }
  return min +
      (max - min) * (DateTime.now().microsecondsSinceEpoch % 1000) ~/ 1000;
}

void dbPrint(
    Object? object, {
      StackTrace? st,
      Object? e,
      bool isPointyLineVisible = true,
    }) {
  if (kDebugMode) {
    final output = object.toString();
    final pattern = RegExp('.{1,800}'); // chunk size

    // Decide emoji based on whether this is an error
    final emoji = e != null ? '🔴' : '🔵';

    if (isPointyLineVisible) {
      log('$emoji ${AppStrings.pointyLine}'); // visual separator
    }

    for (final match in pattern.allMatches(output)) {
      log(
        '$emoji ${match.group(0) ?? ''}',
        stackTrace: st,
        error: e,
      );
    }
  }
}


double getScreenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getBottomPadding(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom;
