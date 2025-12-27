import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/widgets/app_text_field.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/core/widgets/cards/app_container.dart';

class RegisterUserPage extends HookConsumerWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final isEmailValid = useState<bool>(false);
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: AppContainer(
              innerPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              outerPadding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create an Account',
                      style: AppTextStyles.headlineLarge(context),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Just a few steps to get started',
                      style: AppTextStyles.bodyMedium(context),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 50),
                    AppTextField(
                      controller: emailController,
                      hintText: 'example@email.com',
                    ),
                    const SizedBox(height: 50),
                    AppElevatedButton(
                      text: 'Continue',
                      borderRadius: 8,
                      horizontalPadding: 100,
                      btnColor: isEmailValid.value
                          ? theme.colorScheme.secondary
                          : theme.disabledColor,
                      verticalPadding: 20,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(child: const Divider(thickness: 2)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('or sign up using'),
                        ),
                        Flexible(child: const Divider(thickness: 2)),
                      ],
                    ),
                
                    IconButton(
                      onPressed: () {},
                      icon: AppContainer(
                        innerPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                        child: SvgPicture.asset(
                            height: 30,
                            AppSvgs.googleIcon),
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
