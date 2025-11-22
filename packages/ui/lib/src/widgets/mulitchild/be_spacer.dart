// ignore_for_file: library_private_types_in_public_api

import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A responsive spacer widget that adjusts its size based on breakpoints.
///
/// Similar to Flutter's [SizedBox] or [Spacer], but with breakpoint-aware sizing.
/// The spacer size changes responsively based on the current screen width.
///
/// The [direction] determines whether the spacer creates horizontal or vertical space:
/// - [Axis.horizontal]: Creates horizontal space (width)
/// - [Axis.vertical]: Creates vertical space (height)
///
/// Example:
/// ```dart
/// Column(
///   children: [
///     Text('First'),
///     BeSpacer(
///       xs: 8,
///       sm: 12,
///       md: 16,
///       lg: 24,
///       xl: 32,
///       direction: Axis.vertical,
///     ),
///     Text('Second'),
///   ],
/// )
/// ```
///
/// In a Row:
/// ```dart
/// Row(
///   children: [
///     Text('Left'),
///     BeSpacer(
///       xs: 8,
///       md: 16,
///       lg: 24,
///       direction: Axis.horizontal,
///     ),
///     Text('Right'),
///   ],
/// )
/// ```
class BeSpacer extends LeafRenderObjectWidget {
  const BeSpacer({super.key, this.xs, this.sm, this.md, this.lg, this.xl, this.xl2, this.direction = Axis.vertical})
    : assert(
        xs != null || sm != null || md != null || lg != null || xl != null || xl2 != null,
        'At least one breakpoint size must be provided',
      );

  /// Creates a horizontal spacer with responsive sizing
  const BeSpacer.horizontal({super.key, this.xs, this.sm, this.md, this.lg, this.xl, this.xl2})
    : direction = Axis.horizontal,
      assert(
        xs != null || sm != null || md != null || lg != null || xl != null || xl2 != null,
        'At least one breakpoint size must be provided',
      );

  /// Creates a vertical spacer with responsive sizing
  const BeSpacer.vertical({super.key, this.xs, this.sm, this.md, this.lg, this.xl, this.xl2})
    : direction = Axis.vertical,
      assert(
        xs != null || sm != null || md != null || lg != null || xl != null || xl2 != null,
        'At least one breakpoint size must be provided',
      );

  /// Creates a square spacer (same width and height) with responsive sizing
  const BeSpacer.square({super.key, this.xs, this.sm, this.md, this.lg, this.xl, this.xl2})
    : direction = Axis.horizontal, // Will be handled specially in render object
      assert(
        xs != null || sm != null || md != null || lg != null || xl != null || xl2 != null,
        'At least one breakpoint size must be provided',
      );

  /// Space size for extra small screens (< 576px)
  final double? xs;

  /// Space size for small screens (≥ 576px)
  final double? sm;

  /// Space size for medium screens (≥ 768px)
  final double? md;

  /// Space size for large screens (≥ 992px)
  final double? lg;

  /// Space size for extra large screens (≥ 1200px)
  final double? xl;

  /// Space size for extra extra large screens (≥ 1400px)
  final double? xl2;

  /// The direction of the spacer.
  /// - [Axis.vertical]: Creates vertical space (height)
  /// - [Axis.horizontal]: Creates horizontal space (width)
  final Axis direction;

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return _RenderBeSpacer(xs: xs, sm: sm, md: md, lg: lg, xl: xl, xl2: xl2, direction: direction);
  }

  @override
  void updateRenderObject(final BuildContext context, final _RenderBeSpacer renderObject) {
    renderObject
      ..xs = xs
      ..sm = sm
      ..md = md
      ..lg = lg
      ..xl = xl
      ..xl2 = xl2
      ..direction = direction;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('xs', xs, defaultValue: null))
      ..add(DoubleProperty('sm', sm, defaultValue: null))
      ..add(DoubleProperty('md', md, defaultValue: null))
      ..add(DoubleProperty('lg', lg, defaultValue: null))
      ..add(DoubleProperty('xl', xl, defaultValue: null))
      ..add(DoubleProperty('xl2', xl2, defaultValue: null))
      ..add(EnumProperty<Axis>('direction', direction));
  }
}

class _RenderBeSpacer extends RenderBox {
  _RenderBeSpacer({
    final double? xs,
    final double? sm,
    final double? md,
    final double? lg,
    final double? xl,
    final double? xl2,
    required final Axis direction,
  }) : _xs = xs,
       _sm = sm,
       _md = md,
       _lg = lg,
       _xl = xl,
       _xl2 = xl2,
       _direction = direction;

  double? _xs;
  double? _sm;
  double? _md;
  double? _lg;
  double? _xl;
  double? _xl2;
  Axis _direction;

  double? get xs => _xs;
  set xs(final double? value) {
    if (_xs != value) {
      _xs = value;
      markNeedsLayout();
    }
  }

  double? get sm => _sm;
  set sm(final double? value) {
    if (_sm != value) {
      _sm = value;
      markNeedsLayout();
    }
  }

  double? get md => _md;
  set md(final double? value) {
    if (_md != value) {
      _md = value;
      markNeedsLayout();
    }
  }

  double? get lg => _lg;
  set lg(final double? value) {
    if (_lg != value) {
      _lg = value;
      markNeedsLayout();
    }
  }

  double? get xl => _xl;
  set xl(final double? value) {
    if (_xl != value) {
      _xl = value;
      markNeedsLayout();
    }
  }

  double? get xl2 => _xl2;
  set xl2(final double? value) {
    if (_xl2 != value) {
      _xl2 = value;
      markNeedsLayout();
    }
  }

  Axis get direction => _direction;
  set direction(final Axis value) {
    if (_direction != value) {
      _direction = value;
      markNeedsLayout();
    }
  }

  /// Get the space size for the current screen width
  double _getSpaceForScreenWidth(final double screenWidth) {
    const breakpoints = BeResponsivePoints();
    final breakpoint = calculateBreakpoint(screenWidth, breakpoints);

    return switch (breakpoint) {
      BeBreakpoint.xs => xs ?? 0,
      BeBreakpoint.sm => sm ?? xs ?? 0,
      BeBreakpoint.md => md ?? sm ?? xs ?? 0,
      BeBreakpoint.lg => lg ?? md ?? sm ?? xs ?? 0,
      BeBreakpoint.xl => xl ?? lg ?? md ?? sm ?? xs ?? 0,
      BeBreakpoint.xl2 => xl2 ?? xl ?? lg ?? md ?? sm ?? xs ?? 0,
    };
  }

  @override
  void performLayout() {
    final screenWidth = constraints.maxWidth;
    final spaceSize = _getSpaceForScreenWidth(screenWidth);

    if (_direction == Axis.horizontal) {
      // Horizontal spacer: fixed width, flexible height
      size = constraints.constrain(Size(spaceSize, 0));
    } else {
      // Vertical spacer: flexible width, fixed height
      size = constraints.constrain(Size(0, spaceSize));
    }
  }

  @override
  double computeMinIntrinsicWidth(final double height) {
    if (_direction == Axis.horizontal) {
      return _getSpaceForScreenWidth(constraints.maxWidth);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicWidth(final double height) {
    if (_direction == Axis.horizontal) {
      return _getSpaceForScreenWidth(constraints.maxWidth);
    }
    return 0;
  }

  @override
  double computeMinIntrinsicHeight(final double width) {
    if (_direction == Axis.vertical) {
      return _getSpaceForScreenWidth(constraints.maxWidth);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicHeight(final double width) {
    if (_direction == Axis.vertical) {
      return _getSpaceForScreenWidth(constraints.maxWidth);
    }
    return 0;
  }

  @override
  bool get sizedByParent => true;

  @override
  bool hitTestSelf(final Offset position) => false;

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('xs', xs))
      ..add(DoubleProperty('sm', sm))
      ..add(DoubleProperty('md', md))
      ..add(DoubleProperty('lg', lg))
      ..add(DoubleProperty('xl', xl))
      ..add(DoubleProperty('xl2', xl2))
      ..add(EnumProperty<Axis>('direction', direction))
      ..add(DoubleProperty('currentSpace', _getSpaceForScreenWidth(constraints.maxWidth)));
  }
}

/// Convenience extensions for adding responsive spacing
extension BeSpacerExtension on double {
  /// Creates a vertical spacer using this value for all breakpoints
  BeSpacer get vSpace => BeSpacer.vertical(xs: this);

  /// Creates a horizontal spacer using this value for all breakpoints
  BeSpacer get hSpace => BeSpacer.horizontal(xs: this);
}

/// Predefined common spacing values
class BeSpacing {
  BeSpacing._();

  /// Extra small spacing (4, 6, 8, 12, 16, 20)
  static const BeSpacer xs = BeSpacer.vertical(xs: 4, sm: 6, md: 8, lg: 12, xl: 16, xl2: 20);

  /// Small spacing (8, 10, 12, 16, 20, 24)
  static const BeSpacer sm = BeSpacer.vertical(xs: 8, sm: 10, md: 12, lg: 16, xl: 20, xl2: 24);

  /// Medium spacing (12, 14, 16, 20, 24, 28)
  static const BeSpacer md = BeSpacer.vertical(xs: 12, sm: 14, md: 16, lg: 20, xl: 24, xl2: 28);

  /// Large spacing (16, 20, 24, 32, 40, 48)
  static const BeSpacer lg = BeSpacer.vertical(xs: 16, sm: 20, md: 24, lg: 32, xl: 40, xl2: 48);

  /// Extra large spacing (24, 28, 32, 40, 48, 56)
  static const BeSpacer xl = BeSpacer.vertical(xs: 24, sm: 28, md: 32, lg: 40, xl: 48, xl2: 56);

  /// Extra extra large spacing (32, 40, 48, 64, 80, 96)
  static const BeSpacer xl2 = BeSpacer.vertical(xs: 32, sm: 40, md: 48, lg: 64, xl: 80, xl2: 96);

  // Horizontal variants
  static const BeSpacer xsH = BeSpacer.horizontal(xs: 4, sm: 6, md: 8, lg: 12, xl: 16, xl2: 20);
  static const BeSpacer smH = BeSpacer.horizontal(xs: 8, sm: 10, md: 12, lg: 16, xl: 20, xl2: 24);
  static const BeSpacer mdH = BeSpacer.horizontal(xs: 12, sm: 14, md: 16, lg: 20, xl: 24, xl2: 28);
  static const BeSpacer lgH = BeSpacer.horizontal(xs: 16, sm: 20, md: 24, lg: 32, xl: 40, xl2: 48);
  static const BeSpacer xlH = BeSpacer.horizontal(xs: 24, sm: 28, md: 32, lg: 40, xl: 48, xl2: 56);
  static const BeSpacer xl2H = BeSpacer.horizontal(xs: 32, sm: 40, md: 48, lg: 64, xl: 80, xl2: 96);
}
