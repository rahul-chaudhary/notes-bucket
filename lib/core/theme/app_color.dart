
import 'package:flutter/cupertino.dart';

abstract final class AppColors {
  static const Color shimmer = Color(0xffe9e9f1);
}

abstract final class AppGradient {
  static const LinearGradient scaffoldBackground = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff000746),
        Color(0xff050303),
      ] );
}

//0xff006e2c