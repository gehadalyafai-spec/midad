import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF176B5B);
  static const primaryDark = Color(0xFF0F4F44);
  static const secondary = Color(0xFFD8A94E);
  static const background = Color(0xFFF7F8F4);
  static const surfaceSoft = Color(0xFFEAF3EF);
  static const textPrimary = Color(0xFF18302B);
  static const textSecondary = Color(0xFF66756F);
}

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      surface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      dividerColor: const Color(0xFFE3E8E5),
    );
  }
}
