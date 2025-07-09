import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.background,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: AppColors.textPrimary,
    onError: Colors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    bodyLarge: AppTextStyles.displayLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    labelSmall: AppTextStyles.labelSmall,
    labelLarge: AppTextStyles.labelLarge,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  ),
);
