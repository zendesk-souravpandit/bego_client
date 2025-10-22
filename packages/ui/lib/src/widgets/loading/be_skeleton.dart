import 'package:beui/src/theme/be_theme.dart';
import 'package:flutter/material.dart';

/// A widget that provides a shimmer effect for loading states.
///
/// [BeSkeleton] ensures shimmer effect is synchronized and applied to descendants.
class BeSkeleton extends StatefulWidget {
  const BeSkeleton({super.key, this.child});

  static BeSkeletonState? of(final BuildContext context) => context.findAncestorStateOfType<BeSkeletonState>();

  final Widget? child;

  @override
  BeSkeletonState createState() => BeSkeletonState();
}

class BeSkeletonState extends State<BeSkeleton> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  double get shimmerValue => _shimmerController.value;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 2.5, period: const Duration(milliseconds: 1600));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient gradient({
    required final BuildContext context,
    final double? slidePercent,
    final List<Color>? colors,
    final List<double>? stops,
    final AlignmentGeometry? begin,
    final AlignmentGeometry? end,
  }) {
    final theme = BeTheme.of(context);
    final themeColors = theme.colors;

    final defaultColors = [
      themeColors.surfaceContainer, // base skeleton color
      themeColors.surfaceBright, // highlight color
      themeColors.surfaceContainer, // back to base color
    ];
    final defaultStops = [0.1, 0.3, 0.4];
    const defaultBegin = Alignment.centerLeft;
    const defaultEnd = Alignment.centerRight;

    // Use the shimmerValue with random offset if slidePercent is not provided
    final effectiveSlidePercent = slidePercent ?? shimmerValue;

    return LinearGradient(
      colors: colors ?? defaultColors,
      stops: stops ?? defaultStops,
      begin: begin ?? defaultBegin,
      end: end ?? defaultEnd,
      transform: _SlidingGradientTransform(slidePercent: effectiveSlidePercent),
    );
  }

  /// Whether this widget has a layout-sized render box.
  bool get isSized {
    final renderObject = context.findRenderObject();
    return renderObject is RenderBox && renderObject.hasSize;
  }

  /// Size of this widget's render box.
  Size get size {
    final renderObject = context.findRenderObject();
    return renderObject is RenderBox ? renderObject.size : Size.zero;
  }

  /// Computes the offset of a descendant relative to this widget's render box.
  Offset getDescendantOffset({required final RenderBox descendant, final Offset offset = Offset.zero}) {
    final box = context.findRenderObject();
    if (box is RenderBox) {
      return descendant.localToGlobal(offset, ancestor: box);
    } else {
      return Offset.zero;
    }
  }

  /// Expose the shimmer animation controller for listeners.
  Listenable get shimmerController => _shimmerController;

  @override
  Widget build(final BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}

/// Helper class that slides the gradient horizontally by a percent.
class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4 transform(final Rect bounds, {final TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
