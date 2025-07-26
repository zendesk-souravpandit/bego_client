import 'package:flutter/material.dart';

double responsiveSize(final double baseSize, final BuildContext context, {final double designWidth = 1440}) {
  final width = MediaQuery.of(context).size.width;
  return baseSize * (width / designWidth);
}
