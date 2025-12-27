import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPinInput extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController otpController;
  final Function(String) onCompleted;

  const OtpPinInput({super.key, required this.validator, required this.otpController, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      keyboardType: TextInputType.number,
      length: 4,
      controller: otpController,
      onCompleted: onCompleted,
    );
  }
}
