
import 'package:flutter/cupertino.dart';

abstract final class AppColors {
  static const Color shimmer = Color(0xffe9e9f1);
}

abstract final class AppGradient {
  static const LinearGradient scaffoldBackground = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff2f2869),
        Color(0xff1c1a27),
      ] );
}