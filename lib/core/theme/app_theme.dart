// lib/style/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(

    colorScheme: ColorScheme.fromSeed(
        seedColor: _AppThemeCommon.seedColor,
        primary: _AppThemeCommon.primaryColor,
        onSurface: _AppThemeCommon.onSurfaceColor,
        surface: _AppThemeCommon.surfaceColor,
        secondary: _AppThemeCommon.secondaryColor,
        onSecondary: _AppThemeCommon.onSecondaryColor,
        brightness: Brightness.light,
        error: _AppThemeCommon.errorColor,
    ),
    brightness: Brightness.light,
    disabledColor: _AppThemeCommon.disabledColor,
    splashColor: _AppThemeCommon.splashColor,
    fontFamily: "Inter",
    cardColor: _AppThemeCommon.cardColor,
    dividerColor: Colors.grey.shade300,
    textSelectionTheme: _AppThemeCommon.textSelectionTheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _AppThemeCommon.seedColor,
      primary: _AppThemeCommon.primaryColor,
      secondary: _AppThemeCommon.secondaryColor,
      onSecondary: _AppThemeCommon.onSecondaryColor,
      onSurface: _AppThemeCommon.onSurfaceColor,
      surface: _AppThemeCommon.surfaceColor,
      brightness: Brightness.dark,
      error: _AppThemeCommon.errorColor,
    ),
    disabledColor: _AppThemeCommon.disabledColor,
    brightness: Brightness.dark,
    fontFamily: "Inter",
    cardColor: _AppThemeCommon.cardColor,
    splashColor: _AppThemeCommon.splashColor,
    dividerColor: Colors.grey.shade700.withAlpha(50),
    textSelectionTheme: _AppThemeCommon.textSelectionTheme,
  );
}


abstract final class _AppThemeCommon {
  static const seedColor = Colors.amber;
  static const primaryColor = Color(0xff2995e6);
  static const secondaryColor = Color(0xffddfc73);
  static const onSecondaryColor = Colors.black;
  static final errorColor = Colors.red.shade500;
  static final splashColor = Colors.blue.withAlpha(30);
  static const surfaceColor = Colors.black;
  static const onSurfaceColor = Colors.white;
  static const cardColor = Color(0xff0F0E0E);
  static const disabledColor = Color(0x80526d82);


  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: Colors.amber,
    selectionHandleColor: Colors.amber,
  );


}