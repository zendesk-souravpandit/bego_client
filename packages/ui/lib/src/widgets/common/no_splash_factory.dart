import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) => NoSplash(controller: controller, referenceBox: referenceBox, color: BeColors.transparent);
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({required super.controller, required super.referenceBox, required super.color});

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
