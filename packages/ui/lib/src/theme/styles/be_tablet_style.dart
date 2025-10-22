import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeTabletValue implements BeAdaptiveStyle {
  const BeTabletValue();
  // Display styles - Tablet optimized scaling
  @override
  double get displayLargeTextSize => 56; // Larger than mobile, smaller than desktop
  @override
  double get displayLargeLineHeight => 64; // 1.143 ratio
  @override
  double get displayMediumTextSize => 42;
  @override
  double get displayMediumLineHeight => 48; // 1.143 ratio
  @override
  double get displaySmallTextSize => 35;
  @override
  double get displaySmallLineHeight => 40; // 1.143 ratio

  // Headline styles - Tablet optimized readability
  @override
  double get headlineLargeTextSize => 28;
  @override
  double get headlineLargeLineHeight => 34; // 1.214 ratio
  @override
  double get headlineMediumTextSize => 24;
  @override
  double get headlineMediumLineHeight => 30; // 1.25 ratio
  @override
  double get headlineSmallTextSize => 20;
  @override
  double get headlineSmallLineHeight => 26; // 1.3 ratio

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
  // Body text - Enhanced readability for tablet
  @override
  double get bodyLargeTextSize => 18;
  @override
  double get bodyLargeLineHeight => 28; // 1.556 ratio for comfortable reading
  @override
  double get bodyMediumTextSize => 16;
  @override
  double get bodyMediumLineHeight => 26; // 1.625 ratio
  @override
  double get bodySmallTextSize => 14;
  @override
  double get bodySmallLineHeight => 22; // 1.571 ratio

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

  // Form-specific sizing - Tablet optimizations (Design System Typography Tokens)
  @override
  double get inputTextSize => 16; // Design System: consistent with mobile for form usability
  @override
  double get inputLabelTextSize => 16; // Design System: label font size
  @override
  double get inputHintTextSize => 16; // Consistent with input
  @override
  double get inputErrorTextSize => 14; // Better readability on larger screens
  @override
  double get inputHelperTextSize => 14; // Better readability on larger screens

  // Button text - Optimized for tablet (Design System Typography Tokens)
  @override
  double get buttonLargeTextSize => 18; // Design System: button font size
  @override
  double get buttonMediumTextSize => 18; // Design System: consistent button font size
  @override
  double get buttonSmallTextSize => 16; // Compact but readable

  // Form spacing - Tablet comfortable spacing (Design System Component Tokens)
  @override
  double get inputContentPaddingHorizontal => 20; // Design System: TextField horizontal padding
  @override
  double get inputContentPaddingVertical => 16; // Design System: TextField vertical padding
  @override
  double get inputBorderRadius => 14; // Design System: borderRadiusMd for inputs
  @override
  double get buttonBorderRadius => 14; // Design System: borderRadiusMd for buttons

  // Button sizing - Tablet optimized (Design System Component Tokens)
  @override
  double get buttonLargeHeight => 60; // Larger for tablet interaction
  @override
  double get buttonMediumHeight => 52; // Standard for tablet
  @override
  double get buttonSmallHeight => 44; // Compact but usable
  @override
  double get buttonLargePaddingHorizontal => 32; // Design System: button horizontal padding
  @override
  double get buttonMediumPaddingHorizontal => 28; // More generous padding
  @override
  double get buttonSmallPaddingHorizontal => 24; // Compact tablet padding

  @override
  Color get deviceColor => BeColors.secondary;

  // Component sizing for mobile
  @override
  double get notificationMaxWidth => 360; // Optimized for mobile screens

  @override
  int get notificationMaxCount => 3; // Prevent notification overflow
}
