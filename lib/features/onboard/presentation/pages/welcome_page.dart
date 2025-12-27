import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/theme/app_text_style.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:notes_bucket/core/widgets/buttons/app_elevated_button.dart';
import 'package:notes_bucket/features/onboard/domain/entities/onboard_slide_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

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

    const List<OnboardSlideItem> slides = [
      OnboardSlideItem(
        animationPath: AppAnimations.browsing,
        title: 'Always Find What You Need',
        subtitle:
        'Stay effortlessly organized with smart grouping and quick access.',
      ),
      OnboardSlideItem(
        animationPath: AppAnimations.student,
        title: 'Neat folders, calm mind, better thinking',
        subtitle:
        'Sort your ideas and create your own system of folders for every thought.',
      ),
      OnboardSlideItem(
        animationPath: AppAnimations.folder,
        title: 'Structure That Feels Natural',
        subtitle:
        'Sort your ideas, create your own structure, and stay effortlessly organized.',
      ),
    ];
    final pageController = usePageController(
      initialPage: 1000 * slides.length,
      viewportFraction: 1,
    );

    final currentPage = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        final nextPage = pageController.page!.toInt() + 1;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });

      return timer.cancel;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                currentPage.value = index % slides.length;
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = slides[index % slides.length];
                return Column(
                  children: [
                    Lottie.asset(
                      item.animationPath,
                      decoder: dotLottieDecoder,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      item.title,
                      style: AppTextStyles.headlineMedium(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: AppTextStyles.bodyMedium(context),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 60),
          AnimatedSmoothIndicator(
            activeIndex: currentPage.value,
            count: slides.length,
            effect: const ExpandingDotsEffect(
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
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
                  Navigator.pushNamed(context, AppRoutes.signIn);
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
                  Navigator.pushNamed(context, AppRoutes.signUp);
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
              ).copyWith(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}


