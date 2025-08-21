import 'package:beui/layout.dart';
import 'package:beui/src/widgets/mulitchild/be_column.dart';
import 'package:beui/src/widgets/mulitchild/be_row.dart';
import 'package:flutter/material.dart';

/// A container widget that provides proper spacing and alignment for the grid system.
/// Similar to Bootstrap's container class.
class BeContainer extends StatelessWidget {
  const BeContainer({super.key, required this.child, this.fluid = false, this.padding, this.maxWidth});

  /// The child widget to contain.
  final Widget child;

  /// Whether the container should be fluid (full width) or have max-width constraints.
  final bool fluid;

  /// Custom padding. If null, uses default responsive padding.
  final EdgeInsets? padding;

  /// Custom max width. If null, uses Bootstrap-like responsive max widths.
  final double? maxWidth;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final screenWidth = constraints.maxWidth;

        // Default responsive padding
        final EdgeInsets effectivePadding = padding ?? _getResponsivePadding(screenWidth);

        // Default responsive max width
        double? effectiveMaxWidth;
        if (!fluid) {
          effectiveMaxWidth = maxWidth ?? _getResponsiveMaxWidth(screenWidth);
        }

        Widget container = Container(
          width: double.infinity,
          constraints: effectiveMaxWidth != null ? BoxConstraints(maxWidth: effectiveMaxWidth) : null,
          padding: effectivePadding,
          child: child,
        );

        if (!fluid && effectiveMaxWidth != null) {
          container = Center(child: container);
        }

        return container;
      },
    );
  }

  EdgeInsets _getResponsivePadding(final double screenWidth) {
    final breakpoint = BeGridBreakpoints.getBreakpoint(screenWidth);

    switch (breakpoint) {
      case BeBreakpoint.xl2:
      case BeBreakpoint.xl:
      case BeBreakpoint.lg:
        return const EdgeInsets.symmetric(horizontal: 24.0);
      case BeBreakpoint.md:
        return const EdgeInsets.symmetric(horizontal: 20.0);
      case BeBreakpoint.sm:
      case BeBreakpoint.xs:
        return const EdgeInsets.symmetric(horizontal: 16.0);
    }
  }

  double _getResponsiveMaxWidth(final double screenWidth) {
    final breakpoint = BeGridBreakpoints.getBreakpoint(screenWidth);

    switch (breakpoint) {
      case BeBreakpoint.xl2:
        return 1320;
      case BeBreakpoint.xl:
        return 1140;
      case BeBreakpoint.lg:
        return 960;
      case BeBreakpoint.md:
        return 720;
      case BeBreakpoint.sm:
        return 540;
      case BeBreakpoint.xs:
        return double.infinity;
    }
  }
}

/// Spacer widget specifically designed for the grid system
class BeColumnSpacer extends StatelessWidget {
  const BeColumnSpacer({super.key, this.columns = 1});

  /// Number of columns this spacer should occupy (1-12).
  final int columns;

  @override
  Widget build(final BuildContext context) {
    return BeColumn(xs: columns, child: const SizedBox.shrink());
  }
}

/// Utility functions for the grid system
class BeGridUtils {
  /// Create a list of columns with equal width
  static List<Widget> createEqualColumns(final List<Widget> children, {final int columns = 12}) {
    final colSize = columns ~/ children.length;
    return children.map((final child) => BeColumn(xs: colSize, child: child)).toList();
  }

  /// Create responsive columns that adapt to screen size
  static List<Widget> createResponsiveColumns(
    final List<Widget> children, {
    final int xs = 12,
    final int? sm,
    final int? md,
    final int? lg,
    final int? xl,
    final int? xl2,
  }) {
    return children
        .map((final child) => BeColumn(xs: xs, sm: sm, md: md, lg: lg, xl: xl, xl2: xl2, child: child))
        .toList();
  }

  /// Create a grid layout with specified number of columns per row
  static List<Widget> createGridLayout(
    final List<Widget> children, {
    final int xs = 1,
    final int sm = 2,
    final int md = 3,
    final int lg = 4,
    final int xl = 6,
  }) {
    final rows = <Widget>[];

    for (int i = 0; i < children.length; i += xl) {
      final rowChildren = <Widget>[];
      final end = (i + xl < children.length) ? i + xl : children.length;

      for (int j = i; j < end; j++) {
        rowChildren.add(
          BeColumn(xs: 12 ~/ xs, sm: 12 ~/ sm, md: 12 ~/ md, lg: 12 ~/ lg, xl: 12 ~/ xl, child: children[j]),
        );
      }

      rows.add(BeRow(children: rowChildren));
    }

    return rows;
  }
}
