import 'package:beui/src/theme/be_insets.dart';
import 'package:flutter/material.dart';

class BeTabletInset implements BeInset {
  const BeTabletInset();
  @override
  EdgeInsets get gutter => const EdgeInsets.all(16);
  @override
  EdgeInsets get textInset => const EdgeInsets.all(80);

  @override
  double get blurRadius => 20;

  @override
  Color get cardColor => const Color.fromARGB(255, 151, 85, 116);
}
