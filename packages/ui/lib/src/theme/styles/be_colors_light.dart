import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColor {
  const BeColorsLight();

  @override
  bool get isDark => false;

  @override
  Color get primary => BeColors.primary;
  @override
  Color get primaryDark => BeColors.primaryDark;
  @override
  Color get primaryLight => BeColors.primaryLight;

  @override
  Color get neutral50 => const Color(0xFFFFFFFF);
  @override
  Color get neutral100 => const Color(0xFFF8F9FA);
  @override
  Color get neutral200 => const Color(0xFFEDEEF0);
  @override
  Color get neutral300 => const Color(0xFFD1D5DB);
  @override
  Color get neutral400 => const Color(0xFFB0B7C3);
  @override
  Color get neutral500 => const Color(0xFF8A94A6);
  @override
  Color get neutral600 => const Color(0xFF6B7280);
  @override
  Color get neutral700 => const Color(0xFF4B5563);
  @override
  Color get neutral800 => const Color(0xFF374151);
  @override
  Color get neutral900 => const Color(0xFF111827);

  @override
  Color get success => const Color(0xFF16A34A);
  @override
  Color get error => const Color(0xFFDC2626);
  @override
  Color get warning => const Color(0xFFEAB308);
  @override
  Color get info => const Color(0xFF2563EB);

  @override
  Color get background => const Color(0xFFFDFDFD);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFECECEC);

  @override
  Color get textPrimary => BeColors.lightTextPrimary;
  @override
  Color get textSecondary => const Color(0xFF6B7280);
  @override
  Color get icon => const Color(0xFF374151);
}
