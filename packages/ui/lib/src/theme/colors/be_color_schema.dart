import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Modern Material 3 color scheme using the brand color 0xFFBE3455
class BeColorSchemeLight {
  static const Color primary = BeColors.primary;
  static const Color onPrimary = BeColors.onPrimary;
  static const Color primaryContainer = BeColors.primaryContainer;
  static const Color onPrimaryContainer = BeColors.onPrimaryContainer;
  static const Color primaryFixed = BeColors.primaryFixed;
  static const Color primaryFixedDim = BeColors.primaryFixedDim;
  static const Color onPrimaryFixed = BeColors.onPrimaryFixed;
  static const Color onPrimaryFixedVariant = BeColors.onPrimaryFixedVariant;

  static const Color secondary = BeColors.secondary;
  static const Color onSecondary = BeColors.onSecondary;
  static const Color secondaryContainer = BeColors.secondaryContainer;
  static const Color onSecondaryContainer = BeColors.onSecondaryContainer;

  static const Color tertiary = BeColors.tertiary;
  static const Color onTertiary = BeColors.onTertiary;
  static const Color tertiaryContainer = BeColors.tertiaryContainer;
  static const Color onTertiaryContainer = BeColors.onTertiaryContainer;

  static const Color error = BeColors.error;
  static const Color onError = BeColors.onError;
  static const Color errorContainer = BeColors.errorContainer;
  static const Color onErrorContainer = BeColors.onErrorContainer;

  static const Color surface = BeColors.surface;
  static const Color onSurface = BeColors.onSurface;
  static const Color surfaceVariant = BeColors.neutralVariant90;
  static const Color onSurfaceVariant = BeColors.onSurfaceVariant;
  static const Color surfaceDim = BeColors.surfaceDim;
  static const Color surfaceBright = BeColors.surfaceBright;
  static const Color surfaceContainer = BeColors.surfaceContainer;
  static const Color surfaceContainerHigh = BeColors.surfaceContainerHigh;
  static const Color surfaceContainerHighest = BeColors.surfaceContainerHighest;
  static const Color surfaceContainerLow = BeColors.surfaceContainerLow;
  static const Color surfaceContainerLowest = BeColors.surfaceContainerLowest;

  static const Color background = BeColors.surface;
  static const Color onBackground = BeColors.onSurface;

  static const Color outline = BeColors.outline;
  static const Color outlineVariant = BeColors.outlineVariant;
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  static const Color inverseSurface = Color(0xFF322F35);
  static const Color onInverseSurface = Color(0xFFF5EFF7);
  static const Color inversePrimary = BeColors.primaryLight;
  static const Color surfaceTint = BeColors.primary;

  static ColorScheme lightScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    shadow: shadow,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
  );
}

class BeColorSchemeDark {
  // Dark theme colors using the brand color system
  static const Color primary = BeColors.primaryLight;
  static const Color onPrimary = BeColors.primaryDark;
  static const Color primaryContainer = BeColors.primaryDark;
  static const Color onPrimaryContainer = BeColors.primaryContainer;

  // Secondary colors
  static const Color secondary = BeColors.secondaryLight;
  static const Color onSecondary = BeColors.secondaryDark;
  static const Color secondaryContainer = BeColors.secondaryDark;
  static const Color onSecondaryContainer = BeColors.secondaryContainer;

  // Tertiary colors
  static const Color tertiary = BeColors.tertiaryLight;
  static const Color onTertiary = BeColors.tertiaryDark;
  static const Color tertiaryContainer = BeColors.tertiaryDark;
  static const Color onTertiaryContainer = BeColors.tertiaryContainer;

  // Error colors
  static const Color error = BeColors.errorLight;
  static const Color onError = BeColors.errorDark;
  static const Color errorContainer = BeColors.errorDark;
  static const Color onErrorContainer = BeColors.errorContainer;

  // Surface colors for dark theme - using appropriate contrasts
  static const Color surface = Color(0xFF1C1B1F); // Dark surface
  static const Color onSurface = Color(0xFFE6E1E5); // Light text on dark
  static const Color surfaceVariant = Color(0xFF49454F); // Dark surface variant
  static const Color onSurfaceVariant = Color(0xFFCAC4D0); // Light text on dark variant

  // Additional surface colors for dark theme
  static const Color surfaceContainer = Color(0xFF211F26);
  static const Color surfaceContainerLow = Color(0xFF1C1B1F);
  static const Color surfaceContainerHigh = Color(0xFF2B2930);
  static const Color surfaceContainerHighest = Color(0xFF36343B);

  // Background colors
  static const Color background = Color(0xFF1C1B1F);
  static const Color onBackground = Color(0xFFE6E1E5);

  // Outline colors
  static const Color outline = BeColors.neutralVariant50;
  static const Color outlineVariant = BeColors.neutralVariant30;

  // Shadow and other colors
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  // Inverse colors
  static const Color inverseSurface = BeColors.surface;
  static const Color onInverseSurface = BeColors.onSurface;
  static const Color inversePrimary = BeColors.primary;

  static ColorScheme darkScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    shadow: shadow,
    inverseSurface: inverseSurface,
    onInverseSurface: onInverseSurface,
    inversePrimary: inversePrimary,
  );
}
