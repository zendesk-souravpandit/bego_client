import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/be_edge_insets.dart';
import 'package:beui/src/theme/be_style.dart';
import 'package:beui/src/theme/styles/be_colors_dark.dart';
import 'package:beui/src/theme/styles/be_colors_light.dart';
import 'package:beui/src/theme/styles/be_style_dark.dart';
import 'package:beui/src/theme/styles/be_style_light.dart';
import 'package:flutter/material.dart';

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  const BeThemeData({required this.style, required this.colors, required this.insets});
  final BeStyle style;
  final BeColor colors;
  final BeEdgeInsets insets;

  static const BeThemeData light = BeThemeData(
    style: BeStyleLight(),
    colors: BeColorsLight(),
    insets: BeEdgeInsets.light,
  );

  static const BeThemeData dark = BeThemeData(style: BeStyleDark(), colors: BeColorsDark(), insets: BeEdgeInsets.dark);

  @override
  BeThemeData copyWith({BeStyle? style, BeColor? colors, BeEdgeInsets? insets}) =>
      BeThemeData(style: style ?? this.style, colors: colors ?? this.colors, insets: insets ?? this.insets);

  @override
  BeThemeData lerp(BeThemeData? other, double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      style: other.style, // You can implement lerping for style if needed
      colors: other.colors,
      insets: other.insets, // Implement color interpolation if needed
    );
  }
}
