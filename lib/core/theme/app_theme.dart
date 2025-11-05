// lib/style/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(

    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
        brightness: Brightness.light,
        primary: Colors.amber,
        secondary: Colors.blueAccent,
        error: Colors.red.shade500,
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.amber.withAlpha(30),
    // fontFamily: "Inter",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    cardColor: Colors.white,
    dividerColor: Colors.grey.shade300,
    shadowColor: Colors.grey.withAlpha(50),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.amber,
      selectionHandleColor: Colors.amber,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.dark,
      primary: Colors.amber,
      secondary: Colors.blueAccent,
      error: Colors.red.shade500,
    ),
    brightness: Brightness.dark,
    fontFamily: "Inter",
    scaffoldBackgroundColor: Colors.black87,
    splashColor: Colors.amber.withAlpha(30),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0b1014),
      surfaceTintColor: Color(0xFF0b1014),
    ),
    cardColor: const Color(0xFF222222),
    dividerColor: Colors.grey.shade700.withAlpha(50),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.amber,
      selectionHandleColor: Colors.amber,
    ),
  );
}
