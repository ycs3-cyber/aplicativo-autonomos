import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ==========================
  // Identidade Visual
  // ==========================
  static const Color background = Color(0xFFF8F4E3);
  static const Color primary = Color(0xFFC65D3B);
  static const Color secondary = Color(0xFFE58E6A);
  static const Color textPrimary = Color(0xFF4E342E);

  // ==========================
  // Neutras
  // ==========================
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF9E9E9E);

  // ==========================
  // Feedback
  // ==========================
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);
}

class AppSizes {
  AppSizes._();

  static const double padding = 20.0;
  static const double borderRadius = 16.0;

  static const double buttonHeight = 56.0;

  static const double iconSize = 24.0;

  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
}

class AppDurations {
  AppDurations._();

  static const Duration normal = Duration(milliseconds: 300);
}