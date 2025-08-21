import 'package:beui/src/screen/be_breakpoint.dart';
import 'package:beui/src/widgets/mulitchild/be_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A Bootstrap-inspired column widget that works within a BeRow to create responsive layouts.
///
/// This widget supports responsive breakpoints compatible with BeBreakpoint:
/// - xs: Extra small devices (< 640px)
/// - sm: Small devices (≥ 640px)
/// - md: Medium devices (≥ 768px)
/// - lg: Large devices (≥ 1024px)
/// - xl: Extra large devices (≥ 1280px)
/// - xl2: Extra extra large devices (≥ 1536px)
///
/// Example usage:
/// ```dart
/// BeColumn(
///   xs: 12,  // Full width on mobile
///   md: 6,   // Half width on medium screens and up
///   lg: 4,   // One-third width on large screens and up
///   child: Container(
///     height: 100,
///     color: Colors.blue,
///     child: Center(child: Text('Column')),
///   ),
/// )
/// ```
class BeColumn extends SingleChildRenderObjectWidget {
  /// Creates a responsive column widget.
  const BeColumn({
    super.key,
    required final Widget child,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xl2,
    this.offset = 0,
    this.order,
  }) : super(child: child);

  /// Column span for extra small devices (< 576px). If null, inherits from larger breakpoint.
  final int? xs;

  /// Column span for small devices (≥ 576px). If null, inherits from larger breakpoint.
  final int? sm;

  /// Column span for medium devices (≥ 768px). If null, inherits from larger breakpoint.
  final int? md;

  /// Column span for large devices (≥ 992px). If null, inherits from larger breakpoint.
  final int? lg;

  /// Column span for extra large devices (≥ 1200px). If null, inherits from larger breakpoint.
  final int? xl;

  /// Column span for extra extra large devices (≥ 1536px). If null, inherits from larger breakpoint.
  final int? xl2;

  /// Number of columns to offset this column by (push to the right).
  final int offset;

  /// Order of this column (for flex ordering).
  final int? order;

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return _RenderBeColumn(xs: xs, sm: sm, md: md, lg: lg, xl: xl, xl2: xl2, offset: offset, order: order);
  }

  @override
  void updateRenderObject(final BuildContext context, final _RenderBeColumn renderObject) {
    renderObject
      ..xs = xs
      ..sm = sm
      ..md = md
      ..lg = lg
      ..xl = xl
      ..xl2 = xl2
      ..offset = offset
      ..order = order;
  }
}

class _RenderBeColumn extends RenderProxyBox with RenderBeColumn {
  _RenderBeColumn({
    final int? xs,
    final int? sm,
    final int? md,
    final int? lg,
    final int? xl,
    final int? xl2,
    final int offset = 0,
    final int? order,
  }) : _xs = xs,
       _sm = sm,
       _md = md,
       _lg = lg,
       _xl = xl,
       _xl2 = xl2,
       _offset = offset,
       _order = order;

  int? _xs;
  int? _sm;
  int? _md;
  int? _lg;
  int? _xl;
  int? _xl2;
  int _offset;
  int? _order;

  // Getters and setters
  int? get xs => _xs;
  set xs(final int? value) {
    if (_xs != value) {
      _xs = value;
      markNeedsLayout();
    }
  }

  int? get sm => _sm;
  set sm(final int? value) {
    if (_sm != value) {
      _sm = value;
      markNeedsLayout();
    }
  }

  int? get md => _md;
  set md(final int? value) {
    if (_md != value) {
      _md = value;
      markNeedsLayout();
    }
  }

  int? get lg => _lg;
  set lg(final int? value) {
    if (_lg != value) {
      _lg = value;
      markNeedsLayout();
    }
  }

  int? get xl => _xl;
  set xl(final int? value) {
    if (_xl != value) {
      _xl = value;
      markNeedsLayout();
    }
  }

  int? get xl2 => _xl2;
  set xl2(final int? value) {
    if (_xl2 != value) {
      _xl2 = value;
      markNeedsLayout();
    }
  }

  int get offset => _offset;
  set offset(final int value) {
    if (_offset != value) {
      _offset = value;
      markNeedsLayout();
    }
  }

  int? get order => _order;
  set order(final int? value) {
    if (_order != value) {
      _order = value;
      markNeedsLayout();
    }
  }

  @override
  int getColumnCount(final double screenWidth) {
    return _getColumnCountForScreenWidth(screenWidth);
  }

  /// Check if this column should be hidden at the current screen width
  @override
  bool isHidden(final double screenWidth) {
    return _getColumnCountForScreenWidth(screenWidth) == 0;
  }

  int _getColumnCountForScreenWidth(final double screenWidth) {
    // Use BeBreakpoint system
    const breakpoints = BeResponsivePoints();

    if (screenWidth >= breakpoints.xl2 && xl2 != null) return xl2!;
    if (screenWidth >= breakpoints.xl && xl != null) return xl!;
    if (screenWidth >= breakpoints.lg && lg != null) return lg!;
    if (screenWidth >= breakpoints.md && md != null) return md!;
    if (screenWidth >= breakpoints.sm && sm != null) return sm!;
    if (xs != null) return xs!;

    // Fallback: find the first non-null value starting from largest breakpoint
    return xl2 ?? xl ?? lg ?? md ?? sm ?? xs ?? 12;
  }

  /// Get the current breakpoint name for debugging
  String getCurrentBreakpoint(final double screenWidth) {
    final breakpoint = calculateBreakpoint(screenWidth);
    return breakpoint.name;
  }

  @override
  void performLayout() {
    // If this column should be hidden, make it take no space
    if (isHidden(constraints.maxWidth)) {
      size = Size.zero;
      if (child != null) {
        child!.layout(const BoxConstraints.tightFor(width: 0, height: 0));
      }
      return;
    }

    // Otherwise, perform normal layout
    super.performLayout();
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    // Don't paint if hidden
    if (isHidden(constraints.maxWidth)) {
      return;
    }
    super.paint(context, offset);
  }

  @override
  bool hitTestSelf(final Offset position) {
    // Don't respond to hit tests if hidden
    if (isHidden(constraints.maxWidth)) {
      return false;
    }
    return super.hitTestSelf(position);
  }
}

/// Responsive breakpoint utilities - wrapper around BeBreakpoint system
class BeGridBreakpoints {
  static const _breakpoints = BeResponsivePoints();

  /// Get the current breakpoint for a given width
  static BeBreakpoint getBreakpoint(final double width) {
    return calculateBreakpoint(width, _breakpoints);
  }

  /// Check if the current width matches a specific breakpoint or larger
  static bool isAtLeast(final double width, final BeBreakpoint breakpoint) {
    final currentBreakpoint = getBreakpoint(width);
    return currentBreakpoint.index >= breakpoint.index;
  }

  /// Get breakpoint value
  static double getBreakpointValue(final BeBreakpoint breakpoint) {
    return _breakpoints.valueForBreakpoint(breakpoint);
  }
}

/// A utility widget for responsive design based on screen size
class BeGridResponsive extends StatelessWidget {
  const BeGridResponsive({super.key, this.xs, this.sm, this.md, this.lg, this.xl, this.xl2, this.fallback});

  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xl2;
  final Widget? fallback;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final width = constraints.maxWidth;
        final breakpoint = BeGridBreakpoints.getBreakpoint(width);

        Widget? widget;
        switch (breakpoint) {
          case BeBreakpoint.xl2:
            widget = xl2 ?? xl ?? lg ?? md ?? sm ?? xs;
            break;
          case BeBreakpoint.xl:
            widget = xl ?? lg ?? md ?? sm ?? xs;
            break;
          case BeBreakpoint.lg:
            widget = lg ?? md ?? sm ?? xs;
            break;
          case BeBreakpoint.md:
            widget = md ?? sm ?? xs;
            break;
          case BeBreakpoint.sm:
            widget = sm ?? xs;
            break;
          case BeBreakpoint.xs:
            widget = xs;
            break;
        }

        return widget ?? fallback ?? const SizedBox.shrink();
      },
    );
  }
}
