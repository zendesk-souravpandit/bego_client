import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeColorsDark extends BeColorsLight {
  const BeColorsDark();

  @override
  bool get isDark => true;

  @override
  Color get primary => BeColors.primary;
  @override
  Color get primaryDark => BeColors.primaryDark;
  @override
  Color get primaryLight => BeColors.primaryLight;

  @override
  Color get neutral50 => const Color(0xFF181A1B);
  @override
  Color get neutral100 => const Color(0xFF1F2223);
  @override
  Color get neutral200 => const Color(0xFF25292B);
  @override
  Color get neutral300 => const Color(0xFF2D3235);
  @override
  Color get neutral400 => const Color(0xFF3C4448);
  @override
  Color get neutral500 => const Color(0xFF505A5E);
  @override
  Color get neutral600 => const Color(0xFF6B767C);
  @override
  Color get neutral700 => const Color(0xFF889198);
  @override
  Color get neutral800 => const Color(0xFFA3ACB3);
  @override
  Color get neutral900 => const Color(0xFFCDD5DA);

  @override
  Color get success => const Color(0xFF16A34A);
  @override
  Color get error => const Color(0xFFDC2626);
  @override
  Color get warning => const Color(0xFFEAB308);
  @override
  Color get info => const Color(0xFF2563EB);

  @override
  Color get background => const Color(0xFF121212);
  @override
  Color get surface => const Color(0xFF1E1E1E);
  @override
  Color get surfaceVariant => const Color(0xFF2A2A2A);

  @override
  Color get textPrimary => BeColors.darkTextPrimary;
  @override
  Color get textSecondary => const Color(0xFFB0B7C3);
  @override
  Color get icon => const Color(0xFFD1D5DB);
}
