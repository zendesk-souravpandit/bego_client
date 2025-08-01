import 'package:becore/collections.dart';
import 'package:beui/src/layouts/grid/be_grid_cells.dart';
import 'package:beui/src/layouts/grid/be_grid_placement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A widget for specifying the additional configuration
/// for placement in the grid.
///
/// With this widget can be specified:
/// - location in a grid ([row] and [column] properties)
/// - span size ([rowSpan] and [columnSpan] properties)
class BeCell extends ProxyWidget {
  const BeCell({
    super.key,
    required this.row,
    required this.column,
    this.rowSpan = 1,
    this.columnSpan = 1,
    required super.child,
  }) : _implicitly = false,
       assert(rowSpan > 0),
       assert(columnSpan > 0);

  const BeCell.implicit({super.key, this.rowSpan = 1, this.columnSpan = 1, required super.child})
    : _implicitly = true,
      row = 0,
      column = 0,
      assert(rowSpan > 0),
      assert(columnSpan > 0);
  final int row;
  final int column;
  final int rowSpan;
  final int columnSpan;
  final bool _implicitly;

  @override
  Element createElement() {
    return _CellElement(this);
  }
}

extension CellExtension on Widget {
  /// Wrap the Widget in a Cell
  BeCell cell({
    final Key? key,
    required final int row,
    required final int column,
    final int rowSpan = 1,
    final int columnSpan = 1,
  }) {
    return BeCell(key: key, row: row, column: column, rowSpan: rowSpan, columnSpan: columnSpan, child: this);
  }

  /// Wrap the Widget in a implicit Cell
  BeCell implicitCell({final Key? key, final int rowSpan = 1, final int columnSpan = 1}) {
    return BeCell.implicit(key: key, rowSpan: rowSpan, columnSpan: columnSpan, child: this);
  }
}

class _CellElement extends ProxyElement {
  _CellElement(super.widget);

  @override
  void notifyClients(covariant final ProxyWidget oldWidget) {}
}

class _GridPadDelegate extends MultiChildLayoutDelegate {
  _GridPadDelegate(this.cells, this.content, this.direction);
  final BeGridCells cells;
  final List<GridPadContent> content;
  final TextDirection direction;

  @override
  void performLayout(final Size size) {
    final cellPlaces = calculateCellPlaces(cells, size.width, size.height);
    content.forEachIndexed((final index, final item) {
      double maxWidth = 0;
      for (var column = item.left; column <= item.right; column++) {
        maxWidth += cellPlaces[item.top][column].width;
      }
      double maxHeight = 0;
      for (var row = item.top; row <= item.bottom; row++) {
        maxHeight += cellPlaces[row][item.left].height;
      }
      // Ensure constraints are not negative
      final constrainedMaxWidth = maxWidth.clamp(0.0, double.infinity);
      final constrainedMaxHeight = maxHeight.clamp(0.0, double.infinity);
      layoutChild(index, BoxConstraints(maxHeight: constrainedMaxHeight, maxWidth: constrainedMaxWidth));
      final cellPlace = cellPlaces[item.top][item.left];
      if (direction == TextDirection.ltr) {
        positionChild(index, Offset(cellPlace.x, cellPlace.y));
      } else {
        positionChild(index, Offset(size.width - cellPlace.x - cellPlace.width, cellPlace.y));
      }
    });
  }

  @override
  bool shouldRelayout(covariant final _GridPadDelegate oldDelegate) {
    // First - do fast check (only count), after - full comparing
    return direction != oldDelegate.direction ||
        cells.rowCount != oldDelegate.cells.rowCount ||
        cells.columnCount != oldDelegate.cells.columnCount ||
        cells != oldDelegate.cells;
  }

  List<List<_CellPlaceInfo>> calculateCellPlaces(final BeGridCells cells, final double width, final double height) {
    final cellWidths = calculateSizesForDimension(width, cells.columnSizes, cells.columnsTotalSize);
    final cellHeights = calculateSizesForDimension(height, cells.rowSizes, cells.rowsTotalSize);
    double y = 0;
    return cellHeights.map((final cellHeight) {
      double x = 0;
      final double cellY = y;
      y += cellHeight;
      return cellWidths.map((final cellWidth) {
        final double cellX = x;
        x += cellWidth;
        return _CellPlaceInfo(x: cellX, y: cellY, width: cellWidth, height: cellHeight);
      }).toList();
    }).toList();
  }

  List<double> calculateSizesForDimension(
    final double availableSize,
    final List<BeGridCellSize> cellSizes,
    final TotalSize totalSize,
  ) {
    final availableWeight = (availableSize - totalSize.fixed).clamp(0.0, double.infinity);
    return cellSizes.map((final cellSize) {
      switch (cellSize) {
        case Fixed():
          return cellSize.size.clamp(0.0, double.infinity);
        case Weight():
          return totalSize.weight > 0
              ? (availableWeight * cellSize.size / totalSize.weight).clamp(0.0, double.infinity)
              : 0.0;
      }
    }).toList();
  }
}

/// Layout for placing elements in the grid.
///
/// Layout allows place elements in a grid defined through [gridPadCells]
/// parameter. By default, all [children] placed sequentially,
/// according [placementPolicy].
///
/// To specify an exact location or span size other than 1, the child
/// should be wrapped with the [BeCell] widget.
///
/// **Widget have to be limited on both sides (width and height) otherwise an
/// exception will be thrown.**
class BeGridView extends StatelessWidget {
  BeGridView({
    super.key,
    required this.gridPadCells,
    required final List<Widget> children,
    this.placementPolicy = BeGridPlacementPolicy.defaultPolicy,
  }) : _placementStrategy = GridPlacementStrategy(gridPadCells, placementPolicy) {
    for (final contentCell in children) {
      final BeCell cell;
      if (contentCell is BeCell) {
        cell = contentCell;
      } else {
        cell = BeCell.implicit(child: contentCell);
      }
      if (cell._implicitly) {
        _placementStrategy.placeImplicitly(rowSpan: cell.rowSpan, columnSpan: cell.columnSpan, content: cell.child);
      } else {
        _placementStrategy.placeExplicitly(
          row: cell.row,
          column: cell.column,
          rowSpan: cell.rowSpan,
          columnSpan: cell.columnSpan,
          content: cell.child,
        );
      }
    }
    _content.addAll(_placementStrategy.content);
  }
  final BeGridCells gridPadCells;
  final List<GridPadContent> _content = [];
  final BeGridPlacementPolicy placementPolicy;
  final PlacementStrategy _placementStrategy;

  @override
  Widget build(final BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _GridPadDelegate(gridPadCells, _content, Directionality.maybeOf(context) ?? TextDirection.ltr),
      children: <Widget>[for (var i = 0; i < _content.length; i++) LayoutId(id: i, child: _content[i].content)],
    );
  }
}

/// Stores information about the position and size of the cell
/// in the parent bounds.
class _CellPlaceInfo {
  const _CellPlaceInfo({required this.x, required this.y, required this.width, required this.height});

  /// x position.
  final double x;

  /// y position.
  final double y;

  /// Cell width.
  final double width;

  /// Cell height.
  final double height;
}
