import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required final MaterialInkController controller,
    required final RenderBox referenceBox,
    required final Offset position,
    required final Color color,
    required final TextDirection textDirection,
    final bool containedInkWell = false,
    final RectCallback? rectCallback,
    final BorderRadius? borderRadius,
    final ShapeBorder? customBorder,
    final double? radius,
    final VoidCallback? onRemoved,
  }) => NoSplash(controller: controller, referenceBox: referenceBox, color: BeColors.transparent);
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({required super.controller, required super.referenceBox, required super.color});

  @override
  void paintFeature(final Canvas canvas, final Matrix4 transform) {}
}
