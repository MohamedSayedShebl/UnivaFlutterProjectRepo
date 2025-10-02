import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Color
  static const primary = Color(0xFF016A69);
  
  // Text Colors
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  
  // Background & Surface Colors
  static const background = Color(0xFFF8F9FA);
  static const card = Color(0xFFFFFFFF);
  
  // Border Color
  static const border = Color(0xFFE0E0E0);
  
  //Search Background Color
  static const searchBackground = Color(0xFFF0F2F5);
  
  // Feedback Colors (Optional but good to have)
  static const success = Color(0xFF4CAF50);
  static const error = Color(0xFFF44336);
  static const warning = Color(0xFFFF9800);
}

class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}

// Add any other global constants here
class AppConstants {
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
}