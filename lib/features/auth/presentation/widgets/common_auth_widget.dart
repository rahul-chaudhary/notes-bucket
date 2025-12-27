
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/buttons/app_rich_text_button.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';

enum AuthType { signIn, signUp }

class CommonAuthWidget extends StatelessWidget {
  const CommonAuthWidget({
    super.key,
    required this.emailController,
    required this.emailError,
    required this.isEmailValid,
    required this.authType,
    required this.onContinuePressed,
    required this.googleBtnOnPressed,
  });

  final TextEditingController emailController;
  final ValueNotifier<String?> emailError;
  final bool isEmailValid;
  final AuthType authType;
  final VoidCallback onContinuePressed;
  final VoidCallback googleBtnOnPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      authType == AuthType.signUp
                          ? 'Create an Account'
                          : "Let's sign you in",
                      style: AppTextStyles.headlineLarge(context),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      authType == AuthType.signUp
                          ? 'Just a few steps to get started'
                          : 'Welcome back!',
                      style: AppTextStyles.bodyMedium(context),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 50),
                    AppTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      errorText: emailController.text.isEmpty
                          ? null
                          : emailError.value,
                      hintText: 'example@email.com',
                    ),
                    const SizedBox(height: 50),
                    AppElevatedButton(
                      text: 'Continue',
                      borderRadius: 8,
                      horizontalPadding: 100,
                      btnColor: isEmailValid
                          ? theme.colorScheme.secondary
                          : theme.disabledColor,
                      verticalPadding: 20,
                      onPressed: () {
                        if (!isEmailValid) return;
                        onContinuePressed();
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(child: const Divider(thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text( 'or sign ${authType == AuthType.signUp ? 'up' : 'in'} using'),
                        ),
                        Flexible(child: const Divider(thickness: 2)),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: AppContainer(
                        innerPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: SvgPicture.asset(height: 30, AppSvgs.googleIcon),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppRichTextButton(
                      primaryText: authType == AuthType.signUp
                          ? 'Already have an account? '
                          : 'Don\'t have an account? ',
                      btnText: authType == AuthType.signUp
                          ? 'Sign In'
                          : 'Sign Up',
                      onBtnPressed: ()=> Navigator.pushReplacementNamed(
                        context,
                        authType == AuthType.signUp
                            ? AppRoutes.userSignIn
                            : AppRoutes.registerUser,
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