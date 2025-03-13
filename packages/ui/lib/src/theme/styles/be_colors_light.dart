import 'package:beui/src/theme/be_color.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColor {
  const BeColorsLight();

  @override
  Color get primary => const Color(0xFF007AFF);
  @override
  Color get accent => const Color(0xFF34C759);
  // Add other color properties...

  // /// Linear interpolation between two [BeColorsLight] instances.
  // static BeColorsLight lerp(BeColorsLight a, BeColorsLight b, double t) => BeColorsLight(
  //   // Interpolate each color property:
  //   primary: Color.lerp(a.primary, b.primary, t)!,
  //   accent: Color.lerp(a.accent, b.accent, t)!,
  //   // Add other properties...
  // );
}
