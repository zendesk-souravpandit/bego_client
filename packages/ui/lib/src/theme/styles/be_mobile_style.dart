import 'dart:ui';

import 'package:beui/src/theme/be_style_value.dart';
import 'package:beui/src/theme/colors/be_colors.dart';

class BeMobileValue implements BeAdaptiveStyle {
  const BeMobileValue();

  // Display styles - Modern scaling for mobile
  @override
  double get displayLargeTextSize => 48; // Large hero text
  @override
  double get displayLargeLineHeight => 56; // 1.167 ratio for tight spacing
  @override
  double get displayMediumTextSize => 36;
  @override
  double get displayMediumLineHeight => 44; // 1.222 ratio
  @override
  double get displaySmallTextSize => 30;
  @override
  double get displaySmallLineHeight => 36; // 1.2 ratio

  // Headline styles - Optimized for mobile readability
  @override
  double get headlineLargeTextSize => 24;
  @override
  double get headlineLargeLineHeight => 30; // 1.25 ratio
  @override
  double get headlineMediumTextSize => 20;
  @override
  double get headlineMediumLineHeight => 26; // 1.3 ratio
  @override
  double get headlineSmallTextSize => 18;
  @override
  double get headlineSmallLineHeight => 24; // 1.333 ratio

  @override
  double get titleLargeTextSize => 20;
  @override
  double get titleLargeLineHeight => 28;
  @override
  double get titleMediumTextSize => 16;
  @override
  double get titleMediumLineHeight => 24;
  @override
  double get titleSmallTextSize => 14;
  @override
  double get titleSmallLineHeight => 20;

  // Body text - Enhanced for mobile reading comfort
  @override
  double get bodyLargeTextSize => 16;
  @override
  double get bodyLargeLineHeight => 26; // 1.625 ratio for comfortable reading
  @override
  double get bodyMediumTextSize => 14;
  @override
  double get bodyMediumLineHeight => 22; // 1.571 ratio
  @override
  double get bodySmallTextSize => 12;
  @override
  double get bodySmallLineHeight => 18; // 1.5 ratio

  @override
  double get labelLargeTextSize => 14;
  @override
  double get labelLargeLineHeight => 20;
  @override
  double get labelMediumTextSize => 12;
  @override
  double get labelMediumLineHeight => 16;
  @override
  double get labelSmallTextSize => 10;
  @override
  double get labelSmallLineHeight => 12;

  // Form-specific text sizes - Mobile optimized
  @override
  double get inputTextSize => 16; // Large enough to prevent zoom on iOS
  @override
  double get inputLabelTextSize => 14; // Clear label text
  @override
  double get inputHintTextSize => 16; // Same as input for consistency
  @override
  double get inputErrorTextSize => 12; // Small but readable error text
  @override
  double get inputHelperTextSize => 12; // Small helper text

  // Button text sizes - Mobile friendly
  @override
  double get buttonLargeTextSize => 16; // Large touch target
  @override
  double get buttonMediumTextSize => 14; // Standard button text
  @override
  double get buttonSmallTextSize => 12; // Compact button text

  // Form spacing - Touch-friendly mobile spacing
  @override
  double get inputContentPaddingHorizontal => 16; // Comfortable touch padding
  @override
  double get inputContentPaddingVertical => 16; // Adequate vertical space
  @override
  double get inputBorderRadius => 12; // Modern rounded corners
  @override
  double get buttonBorderRadius => 12; // Consistent with inputs

  // Button sizing - Optimized for mobile touch targets
  @override
  double get buttonLargeHeight => 56; // WCAG touch target minimum
  @override
  double get buttonMediumHeight => 48; // Standard button height
  @override
  double get buttonSmallHeight => 40; // Compact button height
  @override
  double get buttonLargePaddingHorizontal => 24; // Spacious padding
  @override
  double get buttonMediumPaddingHorizontal => 20; // Standard padding
  @override
  double get buttonSmallPaddingHorizontal => 16; // Compact padding

  // Component sizing for mobile
  @override
  double get notificationMaxWidth => 360; // Optimized for mobile screens

  @override
  int get notificationMaxCount => 3; // Prevent notification overflow

  @override
  Color get deviceColor => BeColors.primary;
}

// @immutable
// class BeEdgeInsets extends ThemeExtension<BeEdgeInsets> implements BeInsets {
//   const BeEdgeInsets({required this.gutter,
//   required this.textInset, required this.buttonInset});
//   @override
//   final EdgeInsets gutter;
//   @override
//   final EdgeInsets textInset;
//   final EdgeInsets buttonInset;

//   static const BeEdgeInsets light = BeEdgeInsets(
//     gutter: EdgeInsets.all(16),
//     textInset: EdgeInsets.all(100),
//     buttonInset: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//   );

//   static const BeEdgeInsets dark = BeEdgeInsets(
//     gutter: EdgeInsets.all(20),
//     textInset: EdgeInsets.all(10),
//     buttonInset: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
//   );

//   @override
//   BeEdgeInsets copyWith({EdgeInsets? gutter, EdgeInsets? textInset,
//   EdgeInsets? buttonInset}) => BeEdgeInsets(
//     gutter: gutter ?? this.gutter,
//     textInset: textInset ?? this.textInset,
//     buttonInset: buttonInset ?? this.buttonInset,
//   );

//   @override
//   BeEdgeInsets lerp(BeEdgeInsets? other, double t) {
//     if (other is! BeEdgeInsets) {
//       return this;
//     }
//     return BeEdgeInsets(
//       gutter: EdgeInsets.lerp(gutter, other.gutter, t)!,
//       textInset: EdgeInsets.lerp(textInset, other.textInset, t)!,
//       buttonInset: EdgeInsets.lerp(buttonInset, other.buttonInset, t)!,
//     );
//   }
// }
