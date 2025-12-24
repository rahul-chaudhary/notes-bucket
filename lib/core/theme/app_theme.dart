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
        brightness: Brightness.light,
        error: _AppThemeCommon.errorColor,
    ),
    brightness: Brightness.light,
    splashColor: _AppThemeCommon.splashColor,
    fontFamily: "Inter",
    cardColor: Colors.white,
    dividerColor: Colors.grey.shade300,
    textSelectionTheme: _AppThemeCommon.textSelectionTheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _AppThemeCommon.seedColor,
      primary: _AppThemeCommon.primaryColor,
      secondary: _AppThemeCommon.secondaryColor,
      onSurface: _AppThemeCommon.onSurfaceColor,
      surface: _AppThemeCommon.surfaceColor,
      brightness: Brightness.dark,
      error: _AppThemeCommon.errorColor,
    ),
    brightness: Brightness.dark,
    fontFamily: "Inter",
    splashColor: _AppThemeCommon.splashColor,
    dividerColor: Colors.grey.shade700.withAlpha(50),
    textSelectionTheme: _AppThemeCommon.textSelectionTheme,
  );
}


abstract final class _AppThemeCommon {
  static const seedColor = Colors.amber;
  static const primaryColor = Color(0xff2995e6);
  static const secondaryColor = Color(0xffddfc73);
  static final errorColor = Colors.red.shade500;
  static final splashColor = Colors.blue.withAlpha(30);
  static const surfaceColor = Colors.black;
  static const onSurfaceColor = Colors.white;

  static const cardColor = Colors.white10;


  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: Colors.amber,
    selectionHandleColor: Colors.amber,
  );


}