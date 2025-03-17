import 'package:beui/src/theme/be_theme_value.dart';

class BeMobileInset implements BeThemeValue {
  const BeMobileInset();

  @override
  double get displayLargeTextSize => 48;
  @override
  double get displayLargeLineHeight => 60;
  @override
  double get displayMediumTextSize => 36;
  @override
  double get displayMediumLineHeight => 44;
  @override
  double get displaySmallTextSize => 30;
  @override
  double get displaySmallLineHeight => 38;

  @override
  double get headlineLargeTextSize => 24;
  @override
  double get headlineLargeLineHeight => 32;
  @override
  double get headlineMediumTextSize => 20;
  @override
  double get headlineMediumLineHeight => 28;
  @override
  double get headlineSmallTextSize => 18;
  @override
  double get headlineSmallLineHeight => 24;

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

  @override
  double get bodyLargeTextSize => 16;
  @override
  double get bodyLargeLineHeight => 24;
  @override
  double get bodyMediumTextSize => 14;
  @override
  double get bodyMediumLineHeight => 20;
  @override
  double get bodySmallTextSize => 12;
  @override
  double get bodySmallLineHeight => 16;

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
}

// @immutable
// class BeEdgeInsets extends ThemeExtension<BeEdgeInsets> implements BeInsets {
//   const BeEdgeInsets({required this.gutter, required this.textInset, required this.buttonInset});
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
//   BeEdgeInsets copyWith({EdgeInsets? gutter, EdgeInsets? textInset, EdgeInsets? buttonInset}) => BeEdgeInsets(
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
