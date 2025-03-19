import 'package:flutter/material.dart';

enum ColorSwatchLevel {
  shade50,
  shade100,
  shade200,
  shade300,
  shade400,
  shade500,
  shade600,
  shade700,
  shade800,
  shade900,
}

const lightModeValues = {
  ColorSwatchLevel.shade50: 0.95,
  ColorSwatchLevel.shade100: 0.90,
  ColorSwatchLevel.shade200: 0.80,
  ColorSwatchLevel.shade300: 0.70,
  ColorSwatchLevel.shade400: 0.60,
  ColorSwatchLevel.shade600: 0.40,
  ColorSwatchLevel.shade700: 0.30,
  ColorSwatchLevel.shade800: 0.20,
  ColorSwatchLevel.shade900: 0.10,
};

// Dark mode reverses the scale except 400 and 500
const darkModeValues = {
  ColorSwatchLevel.shade50: 0.10,
  ColorSwatchLevel.shade100: 0.20,
  ColorSwatchLevel.shade200: 0.30,
  ColorSwatchLevel.shade300: 0.40,
  ColorSwatchLevel.shade400: 0.60,
  ColorSwatchLevel.shade600: 0.70,
  ColorSwatchLevel.shade700: 0.80,
  ColorSwatchLevel.shade800: 0.90,
  ColorSwatchLevel.shade900: 0.95,
};

class ColorUtils {
  static Map<int, Color> tonalPalette(Color baseColor, {bool isDark = false}) {
    final hsl = HSLColor.fromColor(baseColor);
    return {
      0: hsl.withLightness(isDark ? 0.0 : 1.0).toColor(),
      10: hsl.withLightness(isDark ? 0.10 : 0.90).toColor(),
      20: hsl.withLightness(isDark ? 0.20 : 0.80).toColor(),
      30: hsl.withLightness(isDark ? 0.30 : 0.70).toColor(),
      40: hsl.withLightness(isDark ? 0.40 : 0.60).toColor(),
      50: hsl.withLightness(isDark ? 0.50 : 0.50).toColor(),
      60: hsl.withLightness(isDark ? 0.60 : 0.40).toColor(),
      70: hsl.withLightness(isDark ? 0.70 : 0.30).toColor(),
      80: hsl.withLightness(isDark ? 0.80 : 0.20).toColor(),
      90: hsl.withLightness(isDark ? 0.90 : 0.10).toColor(),
      95: hsl.withLightness(isDark ? 0.95 : 0.05).toColor(),
      99: hsl.withLightness(isDark ? 0.99 : 0.01).toColor(),
      100: hsl.withLightness(isDark ? 1.0 : 0.0).toColor(),
    };
  }

  static MaterialColor createColorSwatch(Color color, {bool isDarkMode = false}) {
    final hsl = HSLColor.fromColor(color);

    double getLightness(int key) {
      final baseLightness = hsl.lightness;
      final lightnessValues = {
        50: isDarkMode ? 0.10 : 0.95,
        100: isDarkMode ? 0.20 : 0.90,
        200: isDarkMode ? 0.30 : 0.80,
        300: isDarkMode ? 0.40 : 0.70,
        400: isDarkMode ? 0.60 : 0.60, // Maintain same mid-point
        500: baseLightness, // Original color lightness
        600: isDarkMode ? 0.70 : 0.40,
        700: isDarkMode ? 0.80 : 0.30,
        800: isDarkMode ? 0.90 : 0.20,
        900: isDarkMode ? 0.95 : 0.10,
      };
      return lightnessValues[key]!;
    }

    return MaterialColor(color.toARGB32(), {
      for (final key in [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
        key: hsl.withLightness(getLightness(key)).toColor(),
    });
  }

  static Color createColorSwatchLevel(
    Color baseColor, {
    ColorSwatchLevel level = ColorSwatchLevel.shade50,
    bool isDarkMode = false,
  }) {
    // Directly return base color for 500 level
    if (level == ColorSwatchLevel.shade500) {
      return baseColor;
    }

    final hsl = HSLColor.fromColor(baseColor);
    final lightness = _getLightnessForLevel(level, isDarkMode);

    return hsl.withLightness(lightness).toColor();
  }

  static double _getLightnessForLevel(ColorSwatchLevel level, bool isDarkMode) =>
      isDarkMode ? darkModeValues[level] ?? lightModeValues[level]! : lightModeValues[level]!;
}
