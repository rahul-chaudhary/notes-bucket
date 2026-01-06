import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_bucket/core/constants/app_assets.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/notification/providers/notification_api_controller_provider.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_helper.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_providers.dart';
import 'package:notes_bucket/core/theme/app_color.dart';
import 'package:notes_bucket/core/utils/app_utils_func.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late String _nextScreen;
  late final AnimationController _controller;
  final Completer<void> _animationCompleter = Completer<void>();
  PackageInfo? packageInfo;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          !_animationCompleter.isCompleted) {
        _animationCompleter.complete();
      }
    });

    _initializeAndWaitForAnimation();
    getPackageInfo();
  }

  void getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  Future<void> _saveFcmToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token == null || token.isEmpty) {
        dbPrint('FCM Token is null or empty');
        return;
      }
      dbPrint('FCM Token: $token');
      final notiController = await ref.read(
        notificationApiControllerProvider.future,
      );
      await notiController.saveFCMToken(token, getDeviceType);
    } catch (e, stack) {
      dbPrint('Error getting FCM Token:', e: e, st: stack);
    }
  }

  Future<void> _initializeAndWaitForAnimation() async {
    try {
      await _initializeApp();
      if (mounted) {
        Navigator.pushReplacementNamed(context, _nextScreen);
      }
    } catch (e, s) {
      dbPrint('Splash init error: $e\n$s');
      rethrow;
    }
  }

  Future<void> _initializeApp() async {
    final splashMinDuration = Future.delayed(
      const Duration(milliseconds: 3000),
    );

    final secureStorageHelper = ref.read(secureStorageHelperProvider);
    final secureStorageData = await secureStorageHelper.get(
      SecureStorageKeys.secureStorageKey,
    );

    _nextScreen = AppRoutes.welcome;
    if (secureStorageData != null) {
      if (!secureStorageData.isFirstLaunch) {
        _nextScreen = AppRoutes.home;
      }
    }
    await splashMinDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.scaffoldBackground),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            if (packageInfo != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Version : ${packageInfo!.version} (${packageInfo!.buildNumber})",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            Positioned.fill(
              child: Lottie.asset(
                AppAnimations.infinityLoading,
                decoder: dotLottieDecoder2,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
