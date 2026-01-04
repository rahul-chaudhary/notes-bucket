import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_bucket/core/constants/app_routes.dart';
import 'package:notes_bucket/core/secure_storage/secure_storage_model.dart';
import 'package:notes_bucket/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:notes_bucket/features/auth/presentation/widgets/common_auth_widget.dart';
import 'package:notes_bucket/features/notes/presentation/pages/edit_note_page.dart';
import 'package:notes_bucket/features/notes/presentation/pages/view_all_page.dart';
import 'package:notes_bucket/features/onboard/presentation/pages/welcome_page.dart';
import 'package:notes_bucket/features/settings/presentation/pages/settings_page.dart';
import 'core/secure_storage/secure_storage_helper.dart';
import 'core/secure_storage/secure_storage_providers.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/register_user_page.dart';
import 'features/auth/presentation/pages/user_sign_in_page.dart';
import 'features/notes/presentation/pages/home_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secureStorageHelper = ref.read(secureStorageHelperProvider);

    return FutureBuilder<String?>(
      future: secureStorageHelper.get(SecureStorageKeys.secureStorageKey),
      builder: (context, snapshot) {
        String initialRoute = AppRoutes.welcome;

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {

          final secureData = snapshot.data == null ? null : SecureStorageModelMapper.fromJson(snapshot.data!);
          if(secureData != null) {
            final isFirstLaunch = secureData.isFirstLaunch;
            final isLoggedIn = secureData.isLoggedIn && secureData.authResponseModel != null;
            if(!isFirstLaunch || isLoggedIn) {
              initialRoute = AppRoutes.home;
            }
          }
        }

        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.home: (context) => const HomePage(),
            AppRoutes.editNotes: (context) => const EditNotePage(noteId: null),
            AppRoutes.viewAll: (context) => const ViewAllPage(),
            AppRoutes.settings: (context) => const SettingsPage(),
            AppRoutes.welcome: (context) => const WelcomePage(),
            AppRoutes.registerUser: (context) => const RegisterUserPage(),
            AppRoutes.userSignIn: (context) => const UserSignInPage(),
            AppRoutes.otpVerification: (context) =>
            const OtpVerificationPage(authType: AuthType.signUp, email: ''),
          },
        );
      },
    );
  }
}

