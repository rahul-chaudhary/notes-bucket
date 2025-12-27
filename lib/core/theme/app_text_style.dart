import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A centralized typography class using poppins font that adapts to the active Theme.
class AppTextStyles {
  /// Large headline text (e.g., screen titles)
  static TextStyle headlineLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );

  /// Medium headline text
  static TextStyle headlineMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  /// Small headline text
  static TextStyle headlineSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  /// Body text (regular)
  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: 14,
    color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
  );

  /// Small secondary text
  static TextStyle bodySmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 12,
    color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
  );

  static TextStyle bodyXSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: 10,
    color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
  );

  /// Button text
  static TextStyle button(BuildContext context) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  ///Hyperlink text
  static TextStyle hyperlink(Color? color) => GoogleFonts.poppins(
    fontSize: 14,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w600,
    decorationColor: color ?? Colors.blueAccent,
    decorationThickness: 1.5,
    decorationStyle: TextDecorationStyle.solid,
    color: color ?? Colors.blueAccent,
  );
}
