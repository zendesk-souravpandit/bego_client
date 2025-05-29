import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

// Add this extension for convenient context access
extension BeThemeContextExtension on BuildContext {
  // BeThemeData get betheme => Theme.of(this).extension<BeThemeData>()!;
  BeThemeData get betheme => Theme.of(this).extension<BeThemeData>()!;
  // Don't do like this, it's not recommended due to performance issue
  // TextStyle beTextStyle(BeTextType type) {
  //   final beTheme = BeTheme.of(this);
  //   return type.getStyle(beTheme.style);
  // }
}
