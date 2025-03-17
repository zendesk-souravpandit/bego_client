import 'package:flutter/material.dart';

double responsiveSize(double baseSize, BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return baseSize * (width / 1440); // 1440 = design reference width
}
