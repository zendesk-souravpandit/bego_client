import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeStyleLight implements BeStyle {
  const BeStyleLight({this.color = const BeColorsLight(), this.inset = const BeMobileInset()});
  final BeColor color;
  final BeInset inset;

  @override
  BoxDecoration get cardDecoration => BoxDecoration(
    color: inset.cardColor,
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
  // BorderRadius get borderRadius => const BorderRadius.all(Radius.elliptical(16, 14));

  // @override
  // TextStyle textStyle(BeTextType? textType, BeBreakpoint breakpoint) =>
  //     textType != null
  //         ? textType.style
  //         : switch (textType) {
  //           BeTextType.displayLarge => displayLarge,
  //           BeTextType.bodyMedium => bodyMedium,
  //           _ => bodyMedium,
  //         };

  // @override
  // BorderRadius get cardRadius => BegoStyle.cardRadiusMedium;

  // @override
  // BorderRadius get xsRadius => const BorderRadius.all(Radius.elliptical(6, 5));
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
