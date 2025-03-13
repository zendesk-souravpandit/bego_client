import 'package:beui/src/theme/be_color.dart';
import 'package:beui/src/theme/be_insets.dart';
import 'package:beui/src/theme/be_style.dart';
import 'package:beui/src/theme/styles/be_colors_light.dart';
import 'package:beui/src/theme/styles/be_style_light.dart';
import 'package:flutter/material.dart';

@immutable
class BeThemeData extends ThemeExtension<BeThemeData> {
  const BeThemeData({required this.inset, this.colors = const BeColorsLight(), this.style = const BeStyleLight()});
  final BeStyle style;
  final BeColor colors;
  final BeInset inset;

  @override
  BeThemeData copyWith({BeStyle? style, BeColor? colors, BeInset? inset}) =>
      BeThemeData(style: style ?? this.style, colors: colors ?? this.colors, inset: inset ?? this.inset);

  @override
  BeThemeData lerp(BeThemeData? other, double t) {
    if (other is! BeThemeData) {
      return this;
    }
    return BeThemeData(
      style: other.style, // You can implement lerping for style if needed
      colors: other.colors,
      inset: other.inset, // Implement color interpolation if needed
    );
  }
}
