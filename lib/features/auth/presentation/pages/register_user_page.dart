import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/utils/app_validator.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:notes_bucket/features/auth/presentation/providers/auth_provider.dart';
import '../widgets/common_auth_widget.dart';

class RegisterUserPage extends HookConsumerWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final emailController = useTextEditingController();
    final emailError = useState<String?>(null);
    final isContinueBtnLoading = useState(false);

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
      authType: AuthType.signUp,
      googleBtnOnPressed: () {},
      isContinueBtnLoading: isContinueBtnLoading.value,
      onContinuePressed: () async {
        try {
          isContinueBtnLoading.value = true;
          final email = emailController.text.trim();

          // Check if user exists
          final userExists = await authController.doesEmailExist(email);

          if (userExists) {
            if (context.mounted) {
              AppSnackBar.showError(
                context,
                'This email is already registered. Use another email or sign in!',
              );
            }
            return;
          }

          // Send OTP
          final message = await authController.sendOtp(
            emailController.text.trim(),
          );
          if (context.mounted) AppSnackBar.showSuccess(context, message);

          // Navigate after both operations complete
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OtpVerificationPage(
                        authType: AuthType.signIn,
                        email: emailController.text.trim()),
              ),
            );
          }
        } catch (e) {
          if (context.mounted) {
            AppSnackBar.showError(context, e.toString());
          }
          rethrow;
        } finally {
          isContinueBtnLoading.value = false;
        }
      },
    );
  }
}
