import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

// Add this extension for convenient context access
extension BeThemeContextExtension on BuildContext {
  // BeThemeData get betheme => Theme.of(this).extension<BeThemeData>()!;
  BeThemeData get betheme => BeTheme.of(this);

  TextStyle beTextStyle(BeTextType type) {
    final beTheme = BeTheme.of(this);
    return type.getStyle(beTheme.style);
  }
}
