import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Identidade Visual
  static const Color background = Color(0xFFF8F4E3);
  static const Color primary = Color(0xFFC65D3B);
  static const Color secondary = Color(0xFFE58E6A);

  static const Color textPrimary = Color(0xFF4E342E);
  static const Color textSecondary = Color(0xFF6D4C41);

  // Neutras
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF9E9E9E);
  static const Color divider = Color(0xFFE0E0E0);

  // Feedback
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE53935);
}

class AppSizes {
  AppSizes._();

  // Padding
  static const double padding = 20;
  static const double paddingSmall = 12;
  static const double paddingLarge = 32;

  // Espaçamentos
  static const double spacingSmall = 8;
  static const double spacingMedium = 16;
  static const double spacingLarge = 24;
  static const double spacingXLarge = 40;

  // Componentes
  static const double borderRadius = 16;
  static const double buttonHeight = 56;
  static const double iconSize = 24;

  // Logo
  static const double logoSize = 140;
}

class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}