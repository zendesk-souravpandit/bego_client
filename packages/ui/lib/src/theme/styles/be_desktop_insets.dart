import 'package:beui/src/theme/be_insets.dart';
import 'package:flutter/material.dart';

class BeDesktopInset implements BeInset {
  const BeDesktopInset();
  @override
  EdgeInsets get gutter => const EdgeInsets.all(16);
  @override
  EdgeInsets get textInset => const EdgeInsets.all(120);

  @override
  double get blurRadius => 0;

  @override
  Color get cardColor => const Color.fromARGB(255, 147, 151, 85);
}
