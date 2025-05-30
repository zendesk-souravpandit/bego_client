import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

/// Generates a consistent color int from a string.
/// Use `lightTone = true` for light colors, false for dark colors.
int stringToColor(final String input, {final bool lightTone = true}) {
  final bytes = utf8.encode(input);
  final digest = md5.convert(bytes);

  final int hashInt = digest.bytes.sublist(0, 4).fold(0, (final a, final b) => (a << 8) + b) & 0xFFFFFFFF;
  final double hue = (hashInt % 360).toDouble();

  const double saturation = 0.4;

  // Choose lightness based on tone
  final double lightness = lightTone ? 0.85 : 0.35; // light or dark tone

  return _hslToColor(hue, saturation, lightness).toARGB32();
}

Color _hslToColor(double h, final double s, final double l) {
  h = h % 360;
  final double c = (1 - (2 * l - 1).abs()) * s;
  final double x = c * (1 - ((h / 60) % 2 - 1).abs());
  final double m = l - c / 2;

  double r = 0, g = 0, b = 0;

  if (h < 60) {
    r = c;
    g = x;
  } else if (h < 120) {
    r = x;
    g = c;
  } else if (h < 180) {
    g = c;
    b = x;
  } else if (h < 240) {
    g = x;
    b = c;
  } else if (h < 300) {
    r = x;
    b = c;
  } else {
    r = c;
    b = x;
  }

  final int red = ((r + m) * 255).round();
  final int green = ((g + m) * 255).round();
  final int blue = ((b + m) * 255).round();

  return Color.fromARGB(255, red, green, blue);
}
