import 'package:flutter/material.dart';

class BeUIConst {
  const BeUIConst._();
  static const String packageName = 'beui';
  static const String fontFamily = 'Roboto';
  static const List<Shadow> textShadow = [Shadow(color: Color(0x0A000000), blurRadius: 1, offset: Offset(0, 1))];
}

class BeStyleConst {
  const BeStyleConst._();

  static const double enabled = 1;
  static const double disabled = .6;

  // Border Radius Constants - Modern design system
  static const double borderRadius4 = 4.0;
  static const double borderRadius8 = 8.0;
  static const double borderRadius12 = 12.0;
  static const double borderRadius16 = 16.0;
  static const double borderRadius20 = 20.0;
  static const double borderRadius24 = 24.0;
  static const double borderRadius28 = 28.0;

  static const BorderRadius borderRadiusSmall = BorderRadius.all(Radius.circular(borderRadius8));
  static const BorderRadius borderRadiusMedium = BorderRadius.all(Radius.circular(borderRadius12));
  static const BorderRadius borderRadiusLarge = BorderRadius.all(Radius.circular(borderRadius16));
  static const BorderRadius borderRadiusXLarge = BorderRadius.all(Radius.circular(borderRadius24));

  // Input field specific border radius
  static const BorderRadius inputBorderRadius = borderRadiusMedium;
  static const BorderRadius buttonBorderRadius = borderRadiusMedium;
  static const BorderRadius cardBorderRadius = borderRadiusLarge;

  // Spacing Constants - 8pt grid system
  static const double spacing2 = 2.0;
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  // Form field spacing
  static const double inputPaddingHorizontal = spacing16;
  static const double inputPaddingVertical = spacing16;
  static const EdgeInsets inputContentPadding = EdgeInsets.symmetric(
    horizontal: inputPaddingHorizontal,
    vertical: inputPaddingVertical,
  );

  // Button spacing
  static const double buttonPaddingHorizontal = spacing24;
  static const double buttonPaddingVertical = spacing16;
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: buttonPaddingHorizontal,
    vertical: buttonPaddingVertical,
  );

  // Icon button sizing
  static const double iconButtonSize = 48.0;
  static const double iconSize = 24.0;

  // Border widths
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 1.5;
  static const double borderWidthThick = 2.0;
  static const double borderWidthFocus = 2.0;

  // Form field states border widths
  static const double inputBorderWidthDefault = borderWidthThin;
  static const double inputBorderWidthFocus = borderWidthThick;
  static const double inputBorderWidthError = borderWidthThin;

  // Animation durations
  static const Duration animationDurationFast = Duration(milliseconds: 150);
  static const Duration animationDurationMedium = Duration(milliseconds: 250);
  static const Duration animationDurationSlow = Duration(milliseconds: 350);

  // Transition curves
  static const Curve transitionCurveDefault = Curves.easeInOut;
  static const Curve transitionCurveEmphasized = Curves.easeOutCubic;
}

final class BeUIShadow {
  // static const boxShadow1 = [shadow1a, shadow1b];
  static const boxShadow2 = [shadow2a, shadow2b];
  // static const boxShadow3 = [shadow3a, shadow3b];
  // static const boxShadow4 = [shadow4a, shadow4b];
  // static const boxShadow5 = [shadow5a, shadow5b];

  // // Elevation Light/1
  // static const shadow1a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow1b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 2,
  //   spreadRadius: 0,
  // );

  // // Elevation Light/2
  // static const shadow2a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 2),
  //   blurRadius: 6,
  //   spreadRadius: 1,
  // );

  // static const shadow2b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 2,
  //   spreadRadius: 0,
  // );

  // // Elevation Light/3
  // static const shadow3a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 0,
  // );

  // static const shadow3b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 4),
  //   blurRadius: 8,
  //   spreadRadius: 3,
  // );

  // // Elevation Light/4
  // static const shadow4a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 2),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow4b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 6),
  //   blurRadius: 10,
  //   spreadRadius: 4,
  // );

  // // Elevation Light/5
  // static const shadow5a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 4),
  //   blurRadius: 4,
  //   spreadRadius: 0,
  // );

  // static const shadow5b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 8),
  //   blurRadius: 12,
  //   spreadRadius: 6,
  // );

  // Elevation Light/1
  // static const shadow1a = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.15),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow1b = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 2,
  //   spreadRadius: 0,
  // );

  // Elevation Light/2
  static const shadow2a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 1,
  );

  static const shadow2b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  // // Elevation Light/3
  // static const shadow3a = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 0,
  // );

  // static const shadow3b = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.15),
  //   offset: Offset(0, 4),
  //   blurRadius: 8,
  //   spreadRadius: 3,
  // );

  // // Elevation Light/4
  // static const shadow4a = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.3),
  //   offset: Offset(0, 2),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow4b = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.15),
  //   offset: Offset(0, 6),
  //   blurRadius: 10,
  //   spreadRadius: 4,
  // );

  // // Elevation Light/5
  // static const shadow5a = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.3),
  //   offset: Offset(0, 4),
  //   blurRadius: 4,
  //   spreadRadius: 0,
  // );

  // static const shadow5b = BoxShadow(
  //   color: Color.fromRGBO(128, 128, 128, 0.15),
  //   offset: Offset(0, 8),
  //   blurRadius: 12,
  //   spreadRadius: 6,
  // );

  // static List<BoxShadow> colorBoxShadow(Color color) => [
  //   BoxShadow(
  //     color: color,
  //     offset: const Offset(0, -1),
  //     blurRadius: 10,
  //     spreadRadius: 2,
  //   ),
  //   BoxShadow(
  //     color: color,
  //     offset: const Offset(0, 4),
  //     blurRadius: 20,
  //     spreadRadius: 4,
  //   ),
  // ];
}
