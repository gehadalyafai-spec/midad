import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFF5557D9);
  static const primaryDark = Color(0xFF2E327F);
  static const secondary = Color(0xFFFFB454);
  static const accent = Color(0xFFFF756B);
  static const background = Color(0xFFF3F0E9);
  static const surfaceSoft = Color(0xFFE8E9FF);
  static const textPrimary = Color(0xFF20212B);
  static const textSecondary = Color(0xFF73737F);

  static const darkBackground = Color(0xFF11121A);
  static const darkSurface = Color(0xFF1A1B25);
  static const darkSurfaceSoft = Color(0xFF252638);
  static const darkTextPrimary = Color(0xFFF6F5F2);
  static const darkTextSecondary = Color(0xFFB4B3BE);
}

class AppTheme {
  const AppTheme._();

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      surface: isDark ? AppColors.darkSurface : const Color(0xFFFFFDF8),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isDark ? AppColors.darkBackground : AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDark ? AppColors.darkBackground : AppColors.background,
        foregroundColor:
            isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      dividerColor: isDark
          ? Colors.white.withValues(alpha: 0.08)
          : const Color(0xFFD9D6CF),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isDark ? const Color(0xFF292A36) : AppColors.textPrimary,
        contentTextStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
