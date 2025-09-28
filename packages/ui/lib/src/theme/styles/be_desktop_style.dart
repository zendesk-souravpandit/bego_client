import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeDesktopValue implements BeAdaptiveStyle {
  const BeDesktopValue();

  // Display styles - Desktop optimized for larger screens
  @override
  double get displayLargeTextSize => 72; // Generous size for desktop
  @override
  double get displayLargeLineHeight => 80; // 1.111 ratio for tight hero text
  @override
  double get displayMediumTextSize => 56;
  @override
  double get displayMediumLineHeight => 64; // 1.143 ratio
  @override
  double get displaySmallTextSize => 48;
  @override
  double get displaySmallLineHeight => 56; // 1.167 ratio

  // Headline styles - Desktop optimized hierarchy
  @override
  double get headlineLargeTextSize => 36;
  @override
  double get headlineLargeLineHeight => 44; // 1.222 ratio
  @override
  double get headlineMediumTextSize => 30;
  @override
  double get headlineMediumLineHeight => 38; // 1.267 ratio
  @override
  double get headlineSmallTextSize => 26;
  @override
  double get headlineSmallLineHeight => 32; // 1.231 ratio

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

  // Body text - Desktop reading comfort
  @override
  double get bodyLargeTextSize => 20;
  @override
  double get bodyLargeLineHeight => 32; // 1.6 ratio for comfortable desktop reading
  @override
  double get bodyMediumTextSize => 18;
  @override
  double get bodyMediumLineHeight => 30; // 1.667 ratio
  @override
  double get bodySmallTextSize => 16;
  @override
  double get bodySmallLineHeight => 26; // 1.625 ratio

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

  // Form-specific sizing - Desktop optimizations
  @override
  double get inputTextSize => 16; // Standard desktop input size
  @override
  double get inputLabelTextSize => 16; // Larger for desktop hierarchy
  @override
  double get inputHintTextSize => 16; // Consistent with input
  @override
  double get inputErrorTextSize => 14; // Larger for desktop readability
  @override
  double get inputHelperTextSize => 14; // Clear helper text for desktop

  // Button text - Desktop friendly
  @override
  double get buttonLargeTextSize => 18; // Larger for desktop prominence
  @override
  double get buttonMediumTextSize => 16; // Standard desktop button
  @override
  double get buttonSmallTextSize => 14; // Compact desktop button

  // Form spacing - Desktop generous spacing
  @override
  double get inputContentPaddingHorizontal => 20; // Desktop comfortable padding
  @override
  double get inputContentPaddingVertical => 16; // Balanced vertical space
  @override
  double get inputBorderRadius => 16; // Larger radius for desktop elegance
  @override
  double get buttonBorderRadius => 16; // Consistent with inputs

  // Button sizing - Desktop optimized
  @override
  double get buttonLargeHeight => 56; // Desktop standard large
  @override
  double get buttonMediumHeight => 48; // Desktop standard medium
  @override
  double get buttonSmallHeight => 40; // Desktop compact
  @override
  double get buttonLargePaddingHorizontal => 32; // Generous desktop padding
  @override
  double get buttonMediumPaddingHorizontal => 24; // Standard desktop padding
  @override
  double get buttonSmallPaddingHorizontal => 20; // Compact desktop padding

  @override
  Color get deviceColor => BeColors.tertiary;

  // Component sizing for mobile
  @override
  double get notificationMaxWidth => 360; // Optimized for mobile screens

  @override
  int get notificationMaxCount => 3; // Prevent notification overflow
}
