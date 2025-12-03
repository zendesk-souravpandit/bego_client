import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeDesktopValue implements BeAdaptiveStyle {
  const BeDesktopValue();

  // Display styles - Desktop optimized for larger screens
  @override
  double get displayLargeTextSize => 36; // +2 from tablet
  @override
  double get displayLargeLineHeight => 54; // 1.5 ratio
  @override
  double get displayMediumTextSize => 32;
  @override
  double get displayMediumLineHeight => 48; // 1.5 ratio
  @override
  double get displaySmallTextSize => 28;
  @override
  double get displaySmallLineHeight => 42; // 1.5 ratio

  // Headline styles - Desktop optimized hierarchy
  @override
  double get headlineLargeTextSize => 24; // +2 from tablet
  @override
  double get headlineLargeLineHeight => 36; // 1.5 ratio
  @override
  double get headlineMediumTextSize => 22;
  @override
  double get headlineMediumLineHeight => 33; // 1.5 ratio
  @override
  double get headlineSmallTextSize => 20;
  @override
  double get headlineSmallLineHeight => 30; // 1.5 ratio

  // Title
  @override
  double get titleLargeTextSize => 22; // +2 from tablet
  @override
  double get titleLargeLineHeight => 33; // 1.5 ratio
  @override
  double get titleMediumTextSize => 19; // +2 from tablet
  @override
  double get titleMediumLineHeight => 28; // 1.5 ratio (rounded from 28.5)
  @override
  double get titleSmallTextSize => 17; // +2 from tablet
  @override
  double get titleSmallLineHeight => 25; // 1.5 ratio (rounded from 25.5)

  // Body text - Desktop reading comfort
  @override
  double get bodyLargeTextSize => 18; // +1 from tablet
  @override
  double get bodyLargeLineHeight => 27; // 1.5 ratio
  @override
  double get bodyMediumTextSize => 16; // +1 from tablet
  @override
  double get bodyMediumLineHeight => 24; // 1.5 ratio
  @override
  double get bodySmallTextSize => 15; // +1 from tablet
  @override
  double get bodySmallLineHeight => 23; // 1.5 ratio (rounded from 22.5)

  // Label
  @override
  double get labelLargeTextSize => 16; // +1 from tablet
  @override
  double get labelLargeLineHeight => 24; // 1.5 ratio
  @override
  double get labelMediumTextSize => 14; // +1 from tablet
  @override
  double get labelMediumLineHeight => 21; // 1.5 ratio
  @override
  double get labelSmallTextSize => 13; // +1 from tablet
  @override
  double get labelSmallLineHeight => 20; // 1.5 ratio (rounded from 19.5)

  // Form-specific sizing - Desktop optimizations (Design System Typography Tokens)
  @override
  double get inputTextSize => 16; // Design System: standard desktop input size
  @override
  double get inputLabelTextSize => 16; // Design System: label font size
  @override
  double get inputHintTextSize => 16; // Consistent with input
  @override
  double get inputErrorTextSize => 14; // Larger for desktop readability
  @override
  double get inputHelperTextSize => 14; // Clear helper text for desktop

  // Button text - Desktop friendly (Design System Typography Tokens)
  @override
  double get buttonLargeTextSize => 20; // Design System: button font size (18-20 pt)
  @override
  double get buttonMediumTextSize => 20; // Design System: consistent button font size
  @override
  double get buttonSmallTextSize => 18; // Compact desktop button

  // Form spacing - Desktop generous spacing (Design System Component Tokens)
  @override
  double get inputContentPaddingHorizontal => 24; // Design System: TextField horizontal padding
  @override
  double get inputContentPaddingVertical => 18; // Design System: TextField vertical padding
  @override
  double get inputBorderRadius => 16; // Design System: borderRadiusMd for inputs
  @override
  double get buttonBorderRadius => 16; // Design System: borderRadiusMd for buttons

  // Button sizing - Desktop optimized (Design System Component Tokens)
  @override
  double get buttonLargeHeight => 56; // Desktop standard large
  @override
  double get buttonMediumHeight => 48; // Desktop standard medium
  @override
  double get buttonSmallHeight => 40; // Desktop compact
  @override
  double get buttonLargePaddingHorizontal => 40; // Design System: button horizontal padding
  @override
  double get buttonMediumPaddingHorizontal => 32; // Generous desktop padding
  @override
  double get buttonSmallPaddingHorizontal => 24; // Compact desktop padding

  @override
  Color get deviceColor => BeColors.tertiary;

  // Component sizing for mobile
  @override
  double get notificationMaxWidth => 360; // Optimized for mobile screens

  @override
  int get notificationMaxCount => 3; // Prevent notification overflow
}
