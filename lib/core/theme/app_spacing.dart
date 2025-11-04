import 'package:flutter/material.dart';

/// A centralized class that defines standard spacing and gaps
/// for consistent UI padding, margins, and layout gaps.
///
/// Usage:
/// - `AppSpacing.s` → small spacing (8)
/// - `AppSpacing.m` → medium spacing (16)
/// - `AppSpacing.l` → large spacing (24)
class AppSpacing {
  // 🔹 Scalar spacing values
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // 🔹 EdgeInsets shortcuts for padding/margin
  static const EdgeInsets paddingAllS = EdgeInsets.all(s);
  static const EdgeInsets paddingAllM = EdgeInsets.all(m);
  static const EdgeInsets paddingAllL = EdgeInsets.all(l);

  static const EdgeInsets horizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontalS = EdgeInsets.symmetric(horizontal: s);
  static const EdgeInsets horizontalM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets horizontalL = EdgeInsets.symmetric(horizontal: l);

  static const EdgeInsets verticalXS = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalS = EdgeInsets.symmetric(vertical: s);
  static const EdgeInsets verticalM = EdgeInsets.symmetric(vertical: m);
  static const EdgeInsets verticalL = EdgeInsets.symmetric(vertical: l);

  // 🔹 SizedBoxes for gaps
  static const SizedBox gapXS = SizedBox(height: xs, width: xs);
  static const SizedBox gapS = SizedBox(height: s, width: s);
  static const SizedBox gapM = SizedBox(height: m, width: m);
  static const SizedBox gapL = SizedBox(height: l, width: l);
  static const SizedBox gapXL = SizedBox(height: xl, width: xl);
}
