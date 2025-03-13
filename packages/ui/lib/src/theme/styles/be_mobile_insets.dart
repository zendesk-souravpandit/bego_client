import 'package:beui/src/theme/be_insets.dart';
import 'package:flutter/material.dart';

class BeMobileInset implements BeInset {
  const BeMobileInset();
  @override
  EdgeInsets get gutter => const EdgeInsets.all(16);
  @override
  EdgeInsets get textInset => const EdgeInsets.all(40);

  @override
  double get blurRadius => 10;

  @override
  Color get cardColor => const Color.fromARGB(255, 85, 106, 151);
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
