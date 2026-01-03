import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/app_snackbar.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/buttons/app_rich_text_button.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:notes_bucket/features/auth/domain/usecases/auth_usecases.dart';
import 'package:notes_bucket/features/auth/presentation/providers/auth_provider.dart';
import 'package:notes_bucket/features/auth/presentation/widgets/common_auth_widget.dart';
import 'package:notes_bucket/features/auth/presentation/widgets/otp_pin_input.dart';

class OtpVerificationPage extends HookConsumerWidget {
  final AuthType authType;
  final String email;

  const OtpVerificationPage({super.key, required this.email, required this.authType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authController = ref.read(authControllerProvider.notifier);
    final otpController = useTextEditingController();
    final resendOtpTimer = useState(60);
    final isBtnLoading = useState(false);

    final isOtpLengthValid = useState(false);

    useEffect(() {
      void listener() {
        isOtpLengthValid.value = otpController.text.length == 4;
      }

      otpController.addListener(listener);
      return () => otpController.removeListener(listener);
    }, [otpController]);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (resendOtpTimer.value > 0) {
          resendOtpTimer.value--;
        } else {
          timer.cancel();
        }
      });

      return timer.cancel;
    });


    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: AppContainer(
              innerPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              outerPadding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter Your OTP',
                      style: AppTextStyles.headlineLarge(context),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'We\'ve sent a verification code to your email',
                      style: AppTextStyles.bodyMedium(context),
                    ),
                    Text(
                      email,
                      style: AppTextStyles.bodyMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 40),
                    OtpPinInput(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                        otpController: otpController,
                        onCompleted: (value) {}),
                    const SizedBox(height: 48),
                    Align(
                      alignment: Alignment.center,
                      child: AppElevatedButton(
                        text: 'Verify',
                        btnColor: isOtpLengthValid.value ? theme.colorScheme.secondary : theme.disabledColor,
                        horizontalPadding: 100,
                        borderRadius: 8,
                        onPressed: () async {
                          try{
                            if (!isOtpLengthValid.value) return;
                            isBtnLoading.value = true;
                            final authParams = AuthParams(
                                authType: authType,
                                email: email,
                                otp: otpController.text.trim());
                            final user = await authController.authenticate(authParams);
                            dbPrint(user.toString());
                            Navigator.pushNamed(context, AppRoutes.home);
                          } catch(e) {
                            AppSnackBar.showError(context, e.toString());
                            rethrow;
                          } finally {
                            isBtnLoading.value = false;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.center,
                      child: resendOtpTimer.value > 0
                      ? AppRichTextButton(
                        primaryText: 'Resend OTP in ',
                        btnText: '${resendOtpTimer.value}',
                        onBtnPressed: () {},
                      )
                      : AppRichTextButton(
                        primaryText: 'Didn\'t receive the code? ',
                        btnText: 'Resend',
                        onBtnPressed: () async {
                          try{
                            resendOtpTimer.value = 60;
                            otpController.clear();
                            final message = await authController.sendOtp(
                              email.trim(),
                            );
                            if (context.mounted) AppSnackBar.showSuccess(context, message);
                          } catch(e){
                            AppSnackBar.showError(context, e.toString());
                            rethrow;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
