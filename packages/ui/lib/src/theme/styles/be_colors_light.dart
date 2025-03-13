import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColor {
  const BeColorsLight();

  @override
  Color get primary => const Color(0xFF007AFF);
  @override
  Color get accent => const Color(0xFF34C759);

  @override
  Color get background => BeColors.blue;
}
