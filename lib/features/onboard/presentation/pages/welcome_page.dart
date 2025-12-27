import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = getScreenHeight(context);

    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _animationPageView(context)),
            _authBtnsModal(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _animationPageView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAnimations.browsing,
              decoder: customDecoder,
              fit: BoxFit.fitWidth,
            ),
            Text(
              'Always Find What You Need',
              style: AppTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Stay effortlessly organized with smart grouping and quick access.',
              style: AppTextStyles.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            SmoothPageIndicator(
              controller: PageController(),
              count:  3,
              effect:  ExpandingDotsEffect(
                activeDotColor: Colors.white,
                spacing: 20,
              ),
            ),
          ],
        ),
    );
  }
  Container _authBtnsModal(BuildContext context, ThemeData theme) {
    return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36,),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppElevatedButton(
                            borderRadius: 8,
                            horizontalPadding: 50,
                            verticalPadding: 20,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.signIn,
                              );
                            },
                            text: 'Sign In',
                          ),
                          AppElevatedButton(
                            borderRadius: 8,
                            horizontalPadding: 50,
                            verticalPadding: 20,
                            btnColor: theme.colorScheme.primary,
                            btnTextColor: theme.colorScheme.onPrimary,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.signUp,
                              );
                            },
                            text: 'Register',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Maybe later, Skip',
                          style: AppTextStyles.button(
                            context,
                          ).copyWith(
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                );
  }
}

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(
    bytes,
    filePicker: (files) {
      for (final f in files) {
        if (f.name.startsWith('animations/') && f.name.endsWith('.json')) {
          return f;
        }
      }
      return null;
    },
  );
}
