import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeColorsDark extends BeColorsLight {
  const BeColorsDark();

  @override
  bool get isDark => true;

  // Primary colors remain the same
  @override
  Color get primary => BeColors.primary;
  @override
  Color get primaryDark => BeColors.primaryDark;
  @override
  Color get primaryLight => BeColors.primaryLight;

  // Dark theme surface system
  @override
  Color get surface => const Color(0xFF141218); // Dark surface
  @override
  Color get surfaceDim => const Color(0xFF141218); // Same as surface for dark
  @override
  Color get surfaceBright => const Color(0xFF3B383E); // Bright surface in dark mode
  @override
  Color get surfaceContainer => const Color(0xFF211F26); // Dark container
  @override
  Color get surfaceContainerHigh => const Color(0xFF2B2930); // High container dark
  @override
  Color get surfaceContainerHighest => const Color(0xFF36343B); // Highest container dark
  @override
  Color get surfaceContainerLow => const Color(0xFF1D1B20); // Low container dark
  @override
  Color get surfaceContainerLowest => const Color(0xFF0F0D13); // Lowest container dark
  @override
  Color get surfaceVariant => const Color(0xFF49454F); // Dark surface variant
  @override
  Color get onSurface => const Color(0xFFE6E0E9); // Light text on dark surface
  @override
  Color get onSurfaceVariant => const Color(0xFFCAC4D0); // Light text on dark surface variant

  // Dark theme neutral inversions
  @override
  Color get neutral10 => BeColors.neutral99; // Lightest becomes darkest text
  @override
  Color get neutral20 => BeColors.neutral90; // Light becomes secondary text
  @override
  Color get neutral30 => BeColors.neutral80; // Medium becomes tertiary text
  @override
  Color get neutral40 => BeColors.neutral60; // Medium-dark for disabled states
  @override
  Color get neutral50 => BeColors.neutral50; // Stays the same (middle point)
  @override
  Color get neutral60 => BeColors.neutral40; // Medium-light for subtle elements
  @override
  Color get neutral80 => BeColors.neutral30; // Dark becomes light elements
  @override
  Color get neutral90 => BeColors.neutral20; // Very dark becomes backgrounds
  @override
  Color get neutral95 => BeColors.neutral10; // Darkest becomes surface
  @override
  Color get neutral99 => BeColors.neutral10; // Pure white becomes dark surface

  // Dark theme text colors (inverted)
  @override
  Color get textPrimary => neutral10; // Lightest for dark theme
  @override
  Color get textSecondary => neutral30; // Light neutral for secondary text

  // Icon color for dark theme
  @override
  Color get icon => neutral20; // Light enough for good contrast

  // Enhanced semantic colors for dark mode
  @override
  Color get success => const Color(0xFF10B981); // Emerald-500
  @override
  Color get error => const Color(0xFFEF4444); // Red-500
  @override
  Color get warning => const Color(0xFFF59E0B); // Amber-500
  @override
  Color get info => const Color(0xFF3B82F6); // Blue-500

  // Form fill color for dark theme
  @override
  Color get formFillColor => surfaceContainer; // Dark container for forms

  // Disabled state for dark theme
  @override
  Color get disabled => neutral60.withValues(alpha: 0.4); // Less opaque for dark theme

  // Dark theme outline adjustments
  @override
  Color get outline => const Color(0xFF938F99); // Lighter outline for dark
  @override
  Color get outlineVariant => const Color(0xFF49454F); // Subtle outline for dark
}
