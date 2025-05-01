import 'package:flutter/material.dart';

class BeColorSchemeLight {
  static const Color primary = Color(0xFFBE3455);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFFFD7DC); // soft tone
  static const Color onPrimaryContainer = Color(
    0xFF430012,
  ); // dark for contrast

  static const Color secondary = Color(0xFF5755A3);
  static const Color onSecondary = Colors.white;
  static const Color secondaryContainer = Color(0xFFD9D8FF);
  static const Color onSecondaryContainer = Color(0xFF1C1A5E);

  static const Color tertiary = Color(0xFF4DA28D);
  static const Color onTertiary = Colors.white;
  static const Color tertiaryContainer = Color(0xFFBDECE1);
  static const Color onTertiaryContainer = Color(0xFF00382C);

  static const Color error = Color(0xFFB00020);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xFFF9DEDC);
  static const Color onErrorContainer = Color(0xFF370001);

  static const Color background = Color(0xFFFFFBFF);
  static const Color onBackground = Color(0xFF1C1B1F);

  static const Color surface = Color(0xFFFFFBFF);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  static const Color onSurfaceVariant = Color(0xFF49454F);

  static const Color outline = Color(0xFF79747E);
  static const Color shadow = Color(0xFF000000);

  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(
    0xFFFFB1C0,
  ); // light version of primary

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
  // Light scheme primary (from previous request)
  static const Color lightPrimary = Color(0xFFBE3455);
  static const Color darkPrimary = Color(0xFFEF7A85);

  // DARK color scheme values
  static const Color primary = darkPrimary;
  static const Color onPrimary = Color(0xFF520010);
  static const Color primaryContainer = Color(0xFF7F1027);
  static const Color onPrimaryContainer = Color(0xFFFFD9DD);

  static const Color secondary = Color(0xFFBFC0FF);
  static const Color onSecondary = Color(0xFF23235C);
  static const Color secondaryContainer = Color(0xFF3B3C80);
  static const Color onSecondaryContainer = Color(0xFFE0E0FF);

  static const Color tertiary = Color(0xFF88D2C0);
  static const Color onTertiary = Color(0xFF00382C);
  static const Color tertiaryContainer = Color(0xFF0A4F44);
  static const Color onTertiaryContainer = Color(0xFFBDECE1);

  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color background = Color(0xFF1C1B1F);
  static const Color onBackground = Color(0xFFE6E1E5);

  static const Color surface = Color(0xFF1C1B1F);
  static const Color onSurface = Color(0xFFE6E1E5);
  static const Color surfaceVariant = Color(0xFF49454F);
  static const Color onSurfaceVariant = Color(0xFFCAC4D0);

  static const Color outline = Color(0xFF938F99);
  static const Color shadow = Color(0xFF000000);

  static const Color inverseSurface = Color(0xFFE6E1E5);
  static const Color onInverseSurface = Color(0xFF313033);
  static const Color inversePrimary = Color(0xFFBE3455);

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
