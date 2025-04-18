import 'package:beui/src/theme/be_style_values.dart';

class BeDesktopValues implements BeStyleValues {
  const BeDesktopValues();

  // Display
  @override
  double get displayLargeTextSize => 64; // +8 from tablet
  @override
  double get displayLargeLineHeight => 80; // 64 * 1.25
  @override
  double get displayMediumTextSize => 48; // +6 from tablet
  @override
  double get displayMediumLineHeight => 60; // 48 * 1.25
  @override
  double get displaySmallTextSize => 40; // +5 from tablet
  @override
  double get displaySmallLineHeight => 50; // 40 * 1.25

  // Headline
  @override
  double get headlineLargeTextSize => 32; // +4 from tablet
  @override
  double get headlineLargeLineHeight => 42.66; // 32 * 1.333
  @override
  double get headlineMediumTextSize => 28; // +4 from tablet
  @override
  double get headlineMediumLineHeight => 37.33; // 28 * 1.333
  @override
  double get headlineSmallTextSize => 24; // +4 from tablet
  @override
  double get headlineSmallLineHeight => 32; // 24 * 1.333

  // Title
  @override
  double get titleLargeTextSize => 28; // +4 from tablet
  @override
  double get titleLargeLineHeight => 37.33; // 28 * 1.333
  @override
  double get titleMediumTextSize => 20; // +2 from tablet
  @override
  double get titleMediumLineHeight => 26.66; // 20 * 1.333
  @override
  double get titleSmallTextSize => 18; // +2 from tablet
  @override
  double get titleSmallLineHeight => 24; // 18 * 1.333

  // Body
  @override
  double get bodyLargeTextSize => 20; // +2 from tablet
  @override
  double get bodyLargeLineHeight => 30; // 20 * 1.5
  @override
  double get bodyMediumTextSize => 18; // +2 from tablet
  @override
  double get bodyMediumLineHeight => 27; // 18 * 1.5
  @override
  double get bodySmallTextSize => 16; // +2 from tablet
  @override
  double get bodySmallLineHeight => 24; // 16 * 1.5

  // Label
  @override
  double get labelLargeTextSize => 18; // +2 from tablet
  @override
  double get labelLargeLineHeight => 27; // 18 * 1.5
  @override
  double get labelMediumTextSize => 16; // +2 from tablet
  @override
  double get labelMediumLineHeight => 24; // 16 * 1.5
  @override
  double get labelSmallTextSize => 14; // +2 from tablet
  @override
  double get labelSmallLineHeight => 21; // 14 * 1.5
}
