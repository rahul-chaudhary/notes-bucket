import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/utils/app_validator.dart';
import 'package:notes_bucket/features/auth/presentation/pages/otp_verification_page.dart';
import '../widgets/common_auth_widget.dart';

class RegisterUserPage extends HookConsumerWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      onContinuePressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OtpVerificationPage(
                  authType: AuthType.signUp,
                  email: emailController.text),
        ),
      ),
    );
  }
}
