import 'dart:ui';

import 'package:flutter/material.dart';

class BeUIConst {
  const BeUIConst._();
  static const String packageName = 'beui';
  static const String fontFamily = 'Roboto';
  static const List<Shadow> textShadow = [
    Shadow(color: Color(0x0A000000), blurRadius: 1, offset: Offset(0, 1)),
  ];
}

class BeStyleConst {
  const BeStyleConst._();

  // static const textScleFactor = 0.8;
  // static const buttonTextSize = 14.0;
  // static const strokWidth = 2.0;
  // static const indicatorSize = 8.0;
  // static const borderRadius = 8.0;
  // //rounded
  // static double rounded8 = 8;
  // static double rounded12 = 12;
  // static double rounded16 = 16;
  // static double rounded20 = 20;

  //gap padding
  // static const inputGapPadding = 16.0;

  // opacity
  // static const double enabled = 1;
  // static const double disabled = .6;
  // static const int gap = 10;
  // static const int gutter = 10;

  // static const BorderRadius cardRadiusMedium = borderRadius16;

  // static const borderRadius4 = BorderRadius.all(Radius.circular(4));
  // static const borderRadius8 = BorderRadius.all(Radius.circular(8));
  // static const borderRadius12 = BorderRadius.all(Radius.circular(12));
  // static const borderRadius16 = BorderRadius.all(Radius.circular(16));
  // static const borderRadius28 = BorderRadius.all(Radius.circular(28));

  // static const Color blurLevel1 = Color.fromRGBO(41, 93, 141, 0.15);
  // static final dialogBlur = ImageFilter.blur(sigmaX: 1, sigmaY: 1);
  // static final tinyBlur = ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8);
  // static final blurLevel1 = ImageFilter.blur(sigmaX: 6, sigmaY: 6);
  static final blurLevel2 = ImageFilter.blur(sigmaX: 12, sigmaY: 12);
  // static final blurLevel3 = ImageFilter.blur(sigmaX: 25, sigmaY: 25);
  // static final blurLevel4 = ImageFilter.blur(sigmaX: 50, sigmaY: 20);
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
