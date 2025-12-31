import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/utils/app_validator.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:notes_bucket/features/auth/presentation/providers/auth_provider.dart';
import '../widgets/common_auth_widget.dart';

class UserSignInPage extends HookConsumerWidget {
  const UserSignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final emailError = useState<String?>(null);
    final theme = Theme.of(context);

    // Validate email on text change
    useEffect(() {
      void listener() {
        final error = ValidationHelper.validateEmail(emailController.text);
        emailError.value = error;
      }

      emailController.addListener(listener);
      return () => emailController.removeListener(listener);
    }, [emailController]);

    final isEmailValid =
        emailError.value == null && emailController.text.isNotEmpty;

    return CommonAuthWidget(
      emailController: emailController,
      emailError: emailError,
      isEmailValid: isEmailValid,
      authType: AuthType.signIn,
      googleBtnOnPressed: () {},
      onContinuePressed: () async {
        try {
          final userExists = await ref.read(doesUserExistProvider(emailController.text.trim()).future);

          if (userExists) {
            await ref.read(sendOtpProvider(emailController.text).future);

            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OtpVerificationPage(email: emailController.text),
                ),
              );
            }
          } else {
            if (context.mounted) {
              AppSnackBar.showError(context, 'No user with this found. Use another email or sign Up!');
            }
          }
        } catch (e) {
          if (context.mounted) {
            AppSnackBar.showError(context, e.toString());
          }
          rethrow;
        }
      }
    );
  }
}
