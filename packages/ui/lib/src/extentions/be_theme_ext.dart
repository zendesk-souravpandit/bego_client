import 'package:beui/src/theme/be_theme_data.dart';
import 'package:flutter/material.dart';

// Use getx for build context extension
extension ContextExt on BuildContext {
  BeThemeData get betheme => Theme.of(this).extension<BeThemeData>()!;
}
