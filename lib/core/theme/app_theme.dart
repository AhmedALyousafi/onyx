import 'package:onyx/core/theme/app_colors.dart';
import 'package:onyx/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.success,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.surface,
      ),
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.regular15,
        bodyMedium: AppTextStyles.regular13,
        bodySmall: AppTextStyles.regular12,
        labelLarge: AppTextStyles.medium15,
        labelMedium: AppTextStyles.medium13,
        labelSmall: AppTextStyles.medium12,
      ),
      fontFamily: 'Readex Pro',
      useMaterial3: true,
    );
  }
}
