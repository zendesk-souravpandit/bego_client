import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeTabletValue extends BeMobileValue {
  const BeTabletValue();

  // Display
  @override
  double get displayLargeTextSize => 56; // +8 from mobile
  @override
  double get displayLargeLineHeight => 70; // 56 * 1.25
  @override
  double get displayMediumTextSize => 42; // +6 from mobile
  @override
  double get displayMediumLineHeight => 52.5; // 42 * 1.25
  @override
  double get displaySmallTextSize => 35; // +5 from mobile
  @override
  double get displaySmallLineHeight => 43.75; // 35 * 1.25

  // Headline
  @override
  double get headlineLargeTextSize => 28; // +4 from mobile
  @override
  double get headlineLargeLineHeight => 37.33; // 28 * 1.333
  @override
  double get headlineMediumTextSize => 24; // +4 from mobile
  @override
  double get headlineMediumLineHeight => 32; // 24 * 1.333
  @override
  double get headlineSmallTextSize => 20; // +2 from mobile
  @override
  double get headlineSmallLineHeight => 26.66; // 20 * 1.333

  // Title
  @override
  double get titleLargeTextSize => 24; // +4 from mobile
  @override
  double get titleLargeLineHeight => 32; // 24 * 1.333
  @override
  double get titleMediumTextSize => 18; // +2 from mobile
  @override
  double get titleMediumLineHeight => 24; // 18 * 1.333
  @override
  double get titleSmallTextSize => 16; // +2 from mobile
  @override
  double get titleSmallLineHeight => 21.33; // 16 * 1.333

  // Body
  @override
  double get bodyLargeTextSize => 18; // +2 from mobile
  @override
  double get bodyLargeLineHeight => 27; // 18 * 1.5
  @override
  double get bodyMediumTextSize => 16; // +2 from mobile
  @override
  double get bodyMediumLineHeight => 24; // 16 * 1.5
  @override
  double get bodySmallTextSize => 14; // +2 from mobile
  @override
  double get bodySmallLineHeight => 21; // 14 * 1.5

  // Label
  @override
  double get labelLargeTextSize => 16; // +2 from mobile
  @override
  double get labelLargeLineHeight => 24; // 16 * 1.5
  @override
  double get labelMediumTextSize => 14; // +2 from mobile
  @override
  double get labelMediumLineHeight => 21; // 14 * 1.5
  @override
  double get labelSmallTextSize => 12; // +2 from mobile
  @override
  double get labelSmallLineHeight => 18; // 12 * 1.5

  @override
  Color get deviceColor => BeColors.blue;
}
