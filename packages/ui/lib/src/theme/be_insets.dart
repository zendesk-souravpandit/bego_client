import 'package:flutter/material.dart';

/// BeInsets should build responsive padding and margin based on device type of screen size
/// Yet to be developed based on design system
///
abstract class BeInset {
  EdgeInsets get gutter;

  EdgeInsets get textInset;

  double get blurRadius;

  Color get cardColor;
}
