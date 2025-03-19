import 'package:beui/theme.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart' show Color;

enum BeTextVariant { none, normal, primary, tertiary, secandory, error }

extension GetTextVariantColor on BeTextVariant {
  (Color, Color) variantColor(BeColor color) {
    Color textColor;
    Color backgroundColor;
    switch (this) {
      default:
        textColor = color.textPrimary;
        backgroundColor = ColorUtils.createColorSwatchLevel(color.textPrimary, isDarkMode: color.isDark);
        return (textColor, backgroundColor);
    }
  }
}
