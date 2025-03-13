import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeStyleDark implements BeStyle {
  const BeStyleDark({this.color = const BeColorsDark(), this.inset = const BeMobileInset()});
  final BeColor color;
  final BeInset inset;

  @override
  BoxDecoration get cardDecoration => BoxDecoration(
    color: color.background,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [BoxShadow(color: color.background, offset: const Offset(0, 2), blurRadius: inset.blurRadius)],
  );
  // @override
  // TextStyle get bodyLarge => BegoTextStyle.bodyLarge;

  // @override
  // TextStyle get bodyMedium => BegoTextStyle.bodyMedium;

  // @override
  // TextStyle get bodySmall => BegoTextStyle.bodySmall;

  // @override
  // TextStyle get displayLarge => BegoTextStyle.displayLarge;
  // @override
  // TextStyle get displayMedium => BegoTextStyle.displayMedium;

  // @override
  // TextStyle get displaySmall => BegoTextStyle.displaySmall;

  // @override
  // TextStyle get headlineLarge => BegoTextStyle.headlineLarge;

  // @override
  // TextStyle get headlineMedium => BegoTextStyle.headlineMedium;

  // @override
  // TextStyle get headlineSmall => BegoTextStyle.headlineSmall;

  // @override
  // TextStyle get labelLarge => BegoTextStyle.labelLarge;

  // @override
  // TextStyle get labelMedium => BegoTextStyle.labelMedium;

  // @override
  // TextStyle get labelSmall => BegoTextStyle.labelSmall;

  // @override
  // TextStyle get titleLarge => BegoTextStyle.titleLarge;

  // @override
  // TextStyle get titleMedium => BegoTextStyle.titleMedium;

  // @override
  // TextStyle get titleSmall => BegoTextStyle.titleSmall;

  // @override
  // BorderRadius get borderRadius =>
  //     const BorderRadius.horizontal(left: Radius.elliptical(16, 14), right: Radius.elliptical(16, 14));

  // @override
  // BorderRadius get xsRadius => BegoStyle.borderRadius4;
  // // To-do(sourav) : change to dynamic style based on breakpoint
  // @override
  // TextStyle textStyle(BeTextType? textType, BeBreakpoint breakpoint) => switch (textType) {
  //   BeTextType.displayLarge => displayLarge,
  //   //.copyWith(fontSize:BegoTextStyle.displayLargeTextSize*BegoStyle.textScleFactor),
  //   BeTextType.displayMedium => displayMedium,
  //   //.copyWith(fontSize:BegoTextStyle.displayMediumTextSize*BegoStyle.textScleFactor),
  //   BeTextType.displaySmall => displaySmall,
  //   //.copyWith(fontSize:BegoTextStyle.displaySmallTextSize*BegoStyle.textScleFactor),
  //   BeTextType.headlineLarge => headlineLarge,
  //   //.copyWith(fontSize:BegoTextStyle.headlineLargeTextSize*BegoStyle.textScleFactor),
  //   BeTextType.headlineMedium => headlineMedium,
  //   //.copyWith(fontSize:BegoTextStyle.headlineMediumTextSize*BegoStyle.textScleFactor),
  //   BeTextType.headlineSmall => headlineSmall,
  //   //.copyWith(fontSize:BegoTextStyle.headlineSmallTextSize*BegoStyle.textScleFactor),
  //   BeTextType.titleLarge => titleLarge,
  //   //.copyWith(fontSize:BegoTextStyle.titleLargeTextSize*BegoStyle.textScleFactor),
  //   BeTextType.titleMedium => titleMedium,
  //   //.copyWith(fontSize:BegoTextStyle.titleMediumTextSize*BegoStyle.textScleFactor),
  //   BeTextType.titleSmall => titleSmall,
  //   //.copyWith(fontSize:BegoTextStyle.titleSmallTextSize*BegoStyle.textScleFactor),
  //   BeTextType.bodyLarge => bodyLarge,
  //   //.copyWith(fontSize:BegoTextStyle.bodyLargeTextSize*BegoStyle.textScleFactor),
  //   BeTextType.bodyMedium => bodyMedium,
  //   //.copyWith(fontSize:BegoTextStyle.bodyMediumTextSize*BegoStyle.textScleFactor),
  //   BeTextType.bodySmall => bodySmall,
  //   //.copyWith(fontSize:BegoTextStyle.bodySmallTextSize*BegoStyle.textScleFactor),
  //   BeTextType.labelLarge => labelLarge,
  //   //.copyWith(fontSize:BegoTextStyle.labelLargeTextSize*BegoStyle.textScleFactor),
  //   BeTextType.labelMedium => labelMedium,
  //   //.copyWith(fontSize:BegoTextStyle.labelMediumTextSize*BegoStyle.textScleFactor),
  //   BeTextType.labelSmall => labelSmall,
  //   //.copyWith(fontSize:BegoTextStyle.labelSmallTextSize*BegoStyle.textScleFactor),
  //   _ => bodyMedium,
  // };

  // @override
  // BorderRadius get cardRadius => BegoStyle.cardRadiusMedium;

  // @override
  // BorderRadius get radius40 => const BorderRadius.all(Radius.circular(40));

  // @override
  // BorderRadiusGeometry get bottomSheetRadius => const BorderRadius.vertical(top: Radius.elliptical(16, 14));

  // @override
  // BorderRadius sizeRadius(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return switch (size) {
  //     _ => const BorderRadius.all(Radius.circular(28)),
  //   };
  // }

  // @override
  // BorderRadius get tileRadius => const BorderRadius.all(Radius.circular(12));
}
