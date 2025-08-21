import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A Bootstrap-inspired grid row widget that arranges children in a 12-column layout system.
///
/// This widget provides responsive layout capabilities similar to Bootstrap's row system.
/// Children are automatically arranged based on their column specifications.
///
/// Example usage:
/// ```dart
/// BeRow(
///   children: [
///     BeColumn(xs: 12, md: 6, child: Text('Column 1')),
///     BeColumn(xs: 12, md: 6, child: Text('Column 2')),
///   ],
/// )
/// ```
class BeRow extends MultiChildRenderObjectWidget {
  /// Creates a grid row with the given children.
  const BeRow({
    super.key,
    required super.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.padding = EdgeInsets.zero,
  });

  /// How the children should be placed along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How the children should be aligned along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// How much space should be occupied in the main axis.
  final MainAxisSize mainAxisSize;

  /// The horizontal spacing between columns.
  final double spacing;

  /// The vertical spacing between rows when wrapping occurs.
  final double runSpacing;

  /// Padding around the entire row.
  final EdgeInsets padding;

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return _RenderBeRow(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
      runSpacing: runSpacing,
      padding: padding,
    );
  }

  @override
  void updateRenderObject(final BuildContext context, final _RenderBeRow renderObject) {
    renderObject
      ..mainAxisAlignment = mainAxisAlignment
      ..crossAxisAlignment = crossAxisAlignment
      ..mainAxisSize = mainAxisSize
      ..spacing = spacing
      ..runSpacing = runSpacing
      ..padding = padding;
  }
}

class _RenderBeRow extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
  _RenderBeRow({
    required final MainAxisAlignment mainAxisAlignment,
    required final CrossAxisAlignment crossAxisAlignment,
    required final MainAxisSize mainAxisSize,
    required final double spacing,
    required final double runSpacing,
    required final EdgeInsets padding,
  }) : _mainAxisAlignment = mainAxisAlignment,
       _crossAxisAlignment = crossAxisAlignment,
       _mainAxisSize = mainAxisSize,
       _spacing = spacing,
       _runSpacing = runSpacing,
       _padding = padding;

  MainAxisAlignment _mainAxisAlignment;
  CrossAxisAlignment _crossAxisAlignment;
  MainAxisSize _mainAxisSize;
  double _spacing;
  double _runSpacing;
  EdgeInsets _padding;

  // Getters and setters
  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment;
  set mainAxisAlignment(final MainAxisAlignment value) {
    if (_mainAxisAlignment != value) {
      _mainAxisAlignment = value;
      markNeedsLayout();
    }
  }

  CrossAxisAlignment get crossAxisAlignment => _crossAxisAlignment;
  set crossAxisAlignment(final CrossAxisAlignment value) {
    if (_crossAxisAlignment != value) {
      _crossAxisAlignment = value;
      markNeedsLayout();
    }
  }

  MainAxisSize get mainAxisSize => _mainAxisSize;
  set mainAxisSize(final MainAxisSize value) {
    if (_mainAxisSize != value) {
      _mainAxisSize = value;
      markNeedsLayout();
    }
  }

  double get spacing => _spacing;
  set spacing(final double value) {
    if (_spacing != value) {
      _spacing = value;
      markNeedsLayout();
    }
  }

  double get runSpacing => _runSpacing;
  set runSpacing(final double value) {
    if (_runSpacing != value) {
      _runSpacing = value;
      markNeedsLayout();
    }
  }

  EdgeInsets get padding => _padding;
  set padding(final EdgeInsets value) {
    if (_padding != value) {
      _padding = value;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(final RenderBox child) {
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }

  @override
  void performLayout() {
    final availableWidth = constraints.maxWidth - padding.horizontal;
    final availableHeight = constraints.maxHeight - padding.vertical;

    if (childCount == 0) {
      size = constraints.constrain(
        Size(_mainAxisSize == MainAxisSize.max ? constraints.maxWidth : padding.horizontal, padding.vertical),
      );
      return;
    }

    final children = <RenderBox>[];
    final columnSpecs = <_ColumnSpec>[];
    final visibleChildren = <RenderBox>[];
    final visibleColumnSpecs = <_ColumnSpec>[];

    // Gather all children and their column specifications
    RenderBox? child = firstChild;
    while (child != null) {
      children.add(child);
      final spec = _getColumnSpec(child);
      columnSpecs.add(spec);
      
      // Only include children that are not hidden (have columns > 0)
      if (spec.columns > 0) {
        visibleChildren.add(child);
        visibleColumnSpecs.add(spec);
      }
      
      final childParentData = child.parentData! as MultiChildLayoutParentData;
      child = childParentData.nextSibling;
    }

    // Handle hidden children by laying them out with zero size
    for (int i = 0; i < children.length; i++) {
      final child = children[i];
      final spec = columnSpecs[i];
      
      if (spec.columns == 0) {
        // Layout hidden children with zero constraints
        child.layout(const BoxConstraints.tightFor(width: 0, height: 0), parentUsesSize: true);
        final childParentData = child.parentData! as MultiChildLayoutParentData;
        childParentData.offset = Offset.zero;
      }
    }

    // If no visible children, just return with padding size
    if (visibleChildren.isEmpty) {
      size = constraints.constrain(
        Size(_mainAxisSize == MainAxisSize.max ? constraints.maxWidth : padding.horizontal, padding.vertical),
      );
      return;
    }

    // Calculate layout based on 12-column grid using only visible children
    final columnWidth = (availableWidth - (_spacing * 11)) / 12;
    final List<List<int>> rows = _calculateRowLayout(visibleColumnSpecs);

    double currentY = padding.top;
    double maxWidth = 0.0;

    for (final rowIndices in rows) {
      double currentX = padding.left;
      double maxRowHeight = 0.0;

      for (final index in rowIndices) {
        final child = visibleChildren[index];
        final spec = visibleColumnSpecs[index];
        final childWidth = (columnWidth * spec.columns) + (_spacing * (spec.columns - 1));

        // Layout the child
        child.layout(
          BoxConstraints(
            minWidth: 0,
            maxWidth: childWidth,
            minHeight: 0,
            maxHeight: availableHeight - currentY + padding.top,
          ),
          parentUsesSize: true,
        );

        // Position the child
        final childParentData = child.parentData! as MultiChildLayoutParentData;
        childParentData.offset = Offset(currentX, currentY);

        currentX += childWidth + _spacing;
        maxRowHeight = max(maxRowHeight, child.size.height);
      }

      maxWidth = max(maxWidth, currentX - _spacing + padding.right);
      currentY += maxRowHeight + _runSpacing;
    }

    // Remove the last runSpacing
    if (rows.isNotEmpty) {
      currentY -= _runSpacing;
    }

    size = constraints.constrain(
      Size(_mainAxisSize == MainAxisSize.max ? constraints.maxWidth : maxWidth, currentY + padding.bottom),
    );
  }

  _ColumnSpec _getColumnSpec(final RenderBox child) {
    // Try to get column specification from the child
    // This would typically come from a BeColumn widget
    if (child is RenderBeColumn) {
      return _ColumnSpec(columns: child.getColumnCount(constraints.maxWidth));
    }

    // Default to full width if no specification found
    return const _ColumnSpec(columns: 12);
  }

  List<List<int>> _calculateRowLayout(final List<_ColumnSpec> specs) {
    final rows = <List<int>>[];
    List<int> currentRow = [];
    int currentRowWidth = 0;

    for (int i = 0; i < specs.length; i++) {
      final spec = specs[i];

      if (currentRowWidth + spec.columns <= 12) {
        // Fits in current row
        currentRow.add(i);
        currentRowWidth += spec.columns;
      } else {
        // Start new row
        if (currentRow.isNotEmpty) {
          rows.add(currentRow);
        }
        currentRow = [i];
        currentRowWidth = spec.columns;
      }
    }

    // Add the last row if not empty
    if (currentRow.isNotEmpty) {
      rows.add(currentRow);
    }

    return rows;
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    RenderBox? child = firstChild;
    while (child != null) {
      final spec = _getColumnSpec(child);
      // Only paint children that are not hidden
      if (spec.columns > 0) {
        final childParentData = child.parentData! as MultiChildLayoutParentData;
        context.paintChild(child, childParentData.offset + offset);
      }
      final childParentData = child.parentData! as MultiChildLayoutParentData;
      child = childParentData.nextSibling;
    }
  }

  @override
  bool hitTestChildren(final BoxHitTestResult result, {required final Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  double computeMinIntrinsicWidth(final double height) {
    return padding.horizontal;
  }

  @override
  double computeMaxIntrinsicWidth(final double height) {
    return double.infinity;
  }

  @override
  double computeMinIntrinsicHeight(final double width) {
    return padding.vertical;
  }

  @override
  double computeMaxIntrinsicHeight(final double width) {
    return double.infinity;
  }
}

class _ColumnSpec {
  const _ColumnSpec({required this.columns});
  final int columns;
}

// Mixin for RenderBeColumn to provide column count information
mixin RenderBeColumn on RenderBox {
  int getColumnCount(final double screenWidth);
  bool isHidden(final double screenWidth) => getColumnCount(screenWidth) == 0;
}
