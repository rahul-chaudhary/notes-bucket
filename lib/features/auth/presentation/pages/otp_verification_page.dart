import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/buttons/app_rich_text_button.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends HookConsumerWidget {
  final String email;

  const OtpVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final otpController = useTextEditingController();
    final resendOtpTimer = useState(60);

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

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.disabledColor),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        backgroundBlendMode: BlendMode.dst,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: theme.colorScheme.secondary),
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: theme.colorScheme.secondary,
        // backgroundBlendMode: BlendMode.dst,
        // borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.secondary),
      ),
    );

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
                    Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      validator: (s) {
                        return s == '2222' ? null : 'OTP is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      length: 4,
                      controller: otpController,
                      onCompleted: (pin) => dbPrint(pin),
                    ),
                    const SizedBox(height: 48),
                    Align(
                      alignment: Alignment.center,
                      child: AppElevatedButton(
                        text: 'Verify',
                        horizontalPadding: 100,
                        borderRadius: 8,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.home);
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
                        onBtnPressed: () {
                          resendOtpTimer.value = 60;
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
