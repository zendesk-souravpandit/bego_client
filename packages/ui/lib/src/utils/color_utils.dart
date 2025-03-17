import 'package:flutter/material.dart';

Map<int, Color> tonalPalette(Color baseColor, {bool isDark = false}) {
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

MaterialColor createColorSwatch(Color color) {
  final hsl = HSLColor.fromColor(color);
  return MaterialColor(color.toARGB32(), {
    50: hsl.withLightness(0.95).toColor(),
    100: hsl.withLightness(0.90).toColor(),
    200: hsl.withLightness(0.80).toColor(),
    300: hsl.withLightness(0.70).toColor(),
    400: hsl.withLightness(0.60).toColor(),
    500: color, // Use original color directly
    600: hsl.withLightness(0.40).toColor(),
    700: hsl.withLightness(0.30).toColor(),
    800: hsl.withLightness(0.20).toColor(),
    900: hsl.withLightness(0.10).toColor(),
  });
}
