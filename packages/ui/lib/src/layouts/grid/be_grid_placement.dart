import 'package:beui/src/layouts/grid/be_grid_cells.dart';
import 'package:beui/src/layouts/grid/be_grid_diagnostic.dart';
import 'package:flutter/material.dart';

/// Implicit placement policy for items.
///
/// There are two major types of settings here: the main axis of placement
/// presented by the [mainAxis] property and the direction of placement
/// presented by [horizontalPolicy] and [verticalPolicy] properties.
///
/// The [mainAxis] property describes which axis would be used to find
/// the next position. For example, [Axis.horizontal] means that firstly
/// next position will look in a current row and if there isn't a place
/// for the item algorithm will move to the next row.
///
/// The [horizontalPolicy] property describes the direction for choosing
/// the next item on the horizontal axis: left or right side,
/// depending on LTR or RTL settings.
///
/// The [verticalPolicy] property describes the direction for choosing
/// the next item on the vertical axis: above or below.
class BeGridPlacementPolicy {
  BeGridPlacementPolicy({
    this.mainAxis = Axis.horizontal,
    this.horizontalPolicy = BeGridHorizontalPolicy.startEnd,
    this.verticalPolicy = BeGridVerticalPolicy.topBottom,
  }) : anchor = BeGridSpanAnchor._ofDirection(horizontalPolicy, verticalPolicy);

  const BeGridPlacementPolicy._anchor({
    required this.mainAxis,
    required this.horizontalPolicy,
    required this.verticalPolicy,
    required this.anchor,
  });
  static const BeGridPlacementPolicy defaultPolicy = BeGridPlacementPolicy._anchor(
    mainAxis: Axis.horizontal,
    horizontalPolicy: BeGridHorizontalPolicy.startEnd,
    verticalPolicy: BeGridVerticalPolicy.topBottom,
    anchor: BeGridSpanAnchor(horizontal: HorizontalAnchor.start, vertical: VerticalAnchor.top),
  );

  /// the main axis for selecting the next location
  final Axis mainAxis;

  /// horizontal placement policy
  final BeGridHorizontalPolicy horizontalPolicy;

  /// vertical placement policy
  final BeGridVerticalPolicy verticalPolicy;

  /// Anchor for spanned cells.
  final BeGridSpanAnchor anchor;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is BeGridPlacementPolicy &&
          runtimeType == other.runtimeType &&
          mainAxis == other.mainAxis &&
          horizontalPolicy == other.horizontalPolicy &&
          verticalPolicy == other.verticalPolicy &&
          anchor == other.anchor;

  @override
  int get hashCode => mainAxis.hashCode ^ horizontalPolicy.hashCode ^ verticalPolicy.hashCode ^ anchor.hashCode;
}

/// Horizontal placement policy.
enum BeGridHorizontalPolicy { startEnd, endStart }

/// Vertical placement policy.
enum BeGridVerticalPolicy { topBottom, bottomTop }

/// Anchor for spanned cells.
class BeGridSpanAnchor {
  const BeGridSpanAnchor({required this.horizontal, required this.vertical});
  final HorizontalAnchor horizontal;
  final VerticalAnchor vertical;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is BeGridSpanAnchor &&
          runtimeType == other.runtimeType &&
          horizontal == other.horizontal &&
          vertical == other.vertical;

  @override
  int get hashCode => horizontal.hashCode ^ vertical.hashCode;

  static BeGridSpanAnchor _ofDirection(final BeGridHorizontalPolicy horizontal, final BeGridVerticalPolicy vertical) {
    final HorizontalAnchor horizontalAnchor;
    switch (horizontal) {
      case BeGridHorizontalPolicy.startEnd:
        horizontalAnchor = HorizontalAnchor.start;
        break;
      case BeGridHorizontalPolicy.endStart:
        horizontalAnchor = HorizontalAnchor.end;
        break;
    }
    final VerticalAnchor verticalAnchor;
    switch (vertical) {
      case BeGridVerticalPolicy.topBottom:
        verticalAnchor = VerticalAnchor.top;
        break;
      case BeGridVerticalPolicy.bottomTop:
        verticalAnchor = VerticalAnchor.bottom;
        break;
    }
    return BeGridSpanAnchor(horizontal: horizontalAnchor, vertical: verticalAnchor);
  }

  @override
  String toString() {
    return 'GridPadSpanAnchor{horizontal: $horizontal, vertical: $vertical}';
  }
}

/// Horizontal anchor position for cells.
enum HorizontalAnchor { start, end }

/// Vertical anchor position for cells.
enum VerticalAnchor { top, bottom }

abstract class PlacementStrategy {
  PlacementStrategy(this._cells, this._placementPolicy);
  final BeGridCells _cells;
  final BeGridPlacementPolicy _placementPolicy;
  final List<GridPadContent> _content = [];

  List<GridPadContent> get content => _content.toList();

  void placeImplicitly({required final int rowSpan, required final int columnSpan, required final Widget content});

  void placeExplicitly({
    required final int row,
    required final int column,
    required final int rowSpan,
    required final int columnSpan,
    required final Widget content,
  }) {
    final anchor = _placementPolicy.anchor;
    final rowOutside = _cells.isRowOutsideOfGrid(row, rowSpan, anchor);
    final columnOutside = _cells.isColumnOutsideOfGrid(column, columnSpan, anchor);
    if (rowOutside || columnOutside) {
      onSkipped(row: row, column: column, rowSpan: rowSpan, columnSpan: columnSpan);
    } else {
      onPlaced(
        left: anchor.leftBound(column, columnSpan),
        top: anchor.topBound(row, rowSpan),
        right: anchor.rightBound(column, columnSpan),
        bottom: anchor.bottomBound(row, rowSpan),
        content: content,
      );
    }
  }

  void onSkipped({
    required final int row,
    required final int column,
    required final int rowSpan,
    required final int columnSpan,
  }) {
    BeGridDiagnosticLogger().onItemSkipped(
      'Skipped position: [${row}x$column], span size: [${rowSpan}x$columnSpan]\nGrid size: [${_cells.rowCount}x${_cells.columnCount}]',
    );
  }

  void onPlaced({
    required final int left,
    required final int top,
    required final int right,
    required final int bottom,
    required final Widget content,
  }) {
    _content.add(GridPadContent(left: left, top: top, right: right, bottom: bottom, content: content));
  }

  int findCurrentRow(
    final BeGridCells cells,
    final BeGridPlacementPolicy placementPolicy,
    final GridPadContent? lastItem,
  ) {
    if (lastItem == null) {
      return cells.firstRow(placementPolicy);
    }
    switch (placementPolicy.verticalPolicy) {
      case BeGridVerticalPolicy.topBottom:
        return lastItem.top;
      case BeGridVerticalPolicy.bottomTop:
        return lastItem.bottom;
    }
  }

  int findCurrentColumn(
    final BeGridCells cells,
    final BeGridPlacementPolicy placementPolicy,
    final GridPadContent? lastItem,
  ) {
    if (lastItem == null) {
      return cells.firstColumn(placementPolicy);
    }
    switch (placementPolicy.horizontalPolicy) {
      case BeGridHorizontalPolicy.startEnd:
        return lastItem.left;
      case BeGridHorizontalPolicy.endStart:
        return lastItem.right;
    }
  }
}

class GridPlacementStrategy extends PlacementStrategy {
  GridPlacementStrategy(super.cells, super.placementPolicy);

  @override
  void placeImplicitly({required final int rowSpan, required final int columnSpan, required final Widget content}) {
    final anchor = _placementPolicy.anchor;
    final lastItem = _content.lastOrNull;
    int row;
    int column;
    switch (_placementPolicy.mainAxis) {
      case Axis.horizontal:
        row = findCurrentRow(_cells, _placementPolicy, lastItem);
        column = findNextColumn(_cells, _placementPolicy, lastItem);
        if (_cells.isColumnOutsideOfGrid(column, columnSpan, anchor)) {
          column = _cells.firstColumn(_placementPolicy);
          row = findNextRow(_cells, _placementPolicy, lastItem);
        }
        break;
      case Axis.vertical:
        column = findCurrentColumn(_cells, _placementPolicy, lastItem);
        row = findNextRow(_cells, _placementPolicy, lastItem);
        if (_cells.isRowOutsideOfGrid(row, rowSpan, anchor)) {
          row = _cells.firstRow(_placementPolicy);
          column = findNextColumn(_cells, _placementPolicy, lastItem);
        }
        break;
    }
    placeExplicitly(row: row, column: column, rowSpan: rowSpan, columnSpan: columnSpan, content: content);
  }

  int findNextRow(
    final BeGridCells cells,
    final BeGridPlacementPolicy placementPolicy,
    final GridPadContent? lastItem,
  ) {
    final lastRow = findCurrentRow(cells, placementPolicy, lastItem);
    final lastFowSpan = lastItem?.rowSpan ?? 0;
    switch (placementPolicy.verticalPolicy) {
      case BeGridVerticalPolicy.topBottom:
        return lastRow + lastFowSpan;
      case BeGridVerticalPolicy.bottomTop:
        return lastRow - lastFowSpan;
    }
  }

  int findNextColumn(
    final BeGridCells cells,
    final BeGridPlacementPolicy placementPolicy,
    final GridPadContent? lastItem,
  ) {
    final lastColumn = findCurrentColumn(cells, placementPolicy, lastItem);
    final lastColumnSpan = lastItem?.columnSpan ?? 0;
    switch (placementPolicy.horizontalPolicy) {
      case BeGridHorizontalPolicy.startEnd:
        return lastColumn + lastColumnSpan;
      case BeGridHorizontalPolicy.endStart:
        return lastColumn - lastColumnSpan;
    }
  }
}

class GridPadContent {
  const GridPadContent({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.content,
  }) : rowSpan = bottom - top + 1,
       columnSpan = right - left + 1;
  final int left;
  final int top;
  final int right;
  final int bottom;
  final int rowSpan;
  final int columnSpan;
  final Widget content;
}

extension GridPadCellsExt on BeGridCells {
  /// Returns the first row index for a specific grid,
  /// depends on the [placementPolicy].
  int firstRow(final BeGridPlacementPolicy placementPolicy) {
    switch (placementPolicy.verticalPolicy) {
      case BeGridVerticalPolicy.topBottom:
        return 0;
      case BeGridVerticalPolicy.bottomTop:
        return rowCount - 1;
    }
  }

  /// Returns the first column index for a specific grid,
  /// depends on the [placementPolicy].
  int firstColumn(final BeGridPlacementPolicy placementPolicy) {
    switch (placementPolicy.horizontalPolicy) {
      case BeGridHorizontalPolicy.startEnd:
        return 0;
      case BeGridHorizontalPolicy.endStart:
        return columnCount - 1;
    }
  }

  /// Checks if the [row] with the span = [rowSpan] and specific [anchor]
  /// is outside the defined grid.
  bool isRowOutsideOfGrid(final int row, final int rowSpan, final BeGridSpanAnchor anchor) {
    final top = anchor.topBound(row, rowSpan);
    final bottom = anchor.bottomBound(row, rowSpan);
    return top < 0 || bottom >= rowCount;
  }

  /// Checks if the [column] with the span = [columnSpan] and specific [anchor]
  /// is outside the defined grid.
  bool isColumnOutsideOfGrid(final int column, final int columnSpan, final BeGridSpanAnchor anchor) {
    final left = anchor.leftBound(column, columnSpan);
    final right = anchor.rightBound(column, columnSpan);
    return left < 0 || right >= columnCount;
  }
}

extension GridPadSpanAnchorExt on BeGridSpanAnchor {
  /// Left column index for a specific [column] and [span] base on
  /// the caller anchor.
  int leftBound(final int column, final int span) {
    switch (horizontal) {
      case HorizontalAnchor.start:
        return column;
      case HorizontalAnchor.end:
        return column - span + 1;
    }
  }

  /// Right column index for a specific [column] and [span] base on
  /// the caller anchor.
  int rightBound(final int column, final int span) {
    switch (horizontal) {
      case HorizontalAnchor.start:
        return column + span - 1;
      case HorizontalAnchor.end:
        return column;
    }
  }

  /// Top row index for a specific [row] and [span] base on the caller anchor.
  int topBound(final int row, final int span) {
    switch (vertical) {
      case VerticalAnchor.top:
        return row;
      case VerticalAnchor.bottom:
        return row - span + 1;
    }
  }

  /// Bottom row index for a specific [row] and [span] base on the caller anchor.
  int bottomBound(final int row, final int span) {
    switch (vertical) {
      case VerticalAnchor.top:
        return row + span - 1;
      case VerticalAnchor.bottom:
        return row;
    }
  }
}
