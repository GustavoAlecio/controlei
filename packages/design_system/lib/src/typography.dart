import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const displayLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: AppColors.textPrimary,
  );

  static const displayMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  static const bodyLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const labelSmall = TextStyle(
    fontFamily: 'Roboto',
    fontStyle: FontStyle.italic,
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const labelLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
  );
}
