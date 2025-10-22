/// BeInsets should build responsive padding and margin based on device type of screen size
/// Yet to be developed based on design system
///
library;

import 'package:flutter/material.dart';
// ignore_for_file: lines_longer_than_80_chars

abstract class BeAdaptiveStyle {
  Color get deviceColor;

  // Display
  double get displayLargeTextSize;
  double get displayLargeLineHeight;
  double get displayMediumTextSize;
  double get displayMediumLineHeight;
  double get displaySmallTextSize;
  double get displaySmallLineHeight;

  // Headline
  double get headlineLargeTextSize;
  double get headlineLargeLineHeight;
  double get headlineMediumTextSize;
  double get headlineMediumLineHeight;
  double get headlineSmallTextSize;
  double get headlineSmallLineHeight;

  // Title
  double get titleLargeTextSize;
  double get titleLargeLineHeight;
  double get titleMediumTextSize;
  double get titleMediumLineHeight;
  double get titleSmallTextSize;
  double get titleSmallLineHeight;

  // Body
  double get bodyLargeTextSize;
  double get bodyLargeLineHeight;
  double get bodyMediumTextSize;
  double get bodyMediumLineHeight;
  double get bodySmallTextSize;
  double get bodySmallLineHeight;

  // Label
  double get labelLargeTextSize;
  double get labelLargeLineHeight;
  double get labelMediumTextSize;
  double get labelMediumLineHeight;
  double get labelSmallTextSize;
  double get labelSmallLineHeight;

  // Form-specific text sizes
  double get inputTextSize;
  double get inputLabelTextSize;
  double get inputHintTextSize;
  double get inputErrorTextSize;
  double get inputHelperTextSize;

  // Button text sizes
  double get buttonLargeTextSize;
  double get buttonMediumTextSize;
  double get buttonSmallTextSize;

  // Form spacing
  double get inputContentPaddingHorizontal;
  double get inputContentPaddingVertical;
  double get inputBorderRadius;
  double get buttonBorderRadius;

  // Button sizing
  double get buttonLargeHeight;
  double get buttonMediumHeight;
  double get buttonSmallHeight;
  double get buttonLargePaddingHorizontal;
  double get buttonMediumPaddingHorizontal;
  double get buttonSmallPaddingHorizontal;

  // Notification
  double get notificationMaxWidth;
  int get notificationMaxCount;
}
