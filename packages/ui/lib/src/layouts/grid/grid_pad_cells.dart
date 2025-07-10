import 'package:flutter/foundation.dart';

/// Non-modifiable class that store information about grid: rows and columns
/// count, size information.
class GridPadCells {
  GridPadCells.sizes({
    required final Iterable<GridPadCellSize> rowSizes,
    required final Iterable<GridPadCellSize> columnSizes,
  }) : rowSizes = List<GridPadCellSize>.unmodifiable(rowSizes),
       columnSizes = List<GridPadCellSize>.unmodifiable(columnSizes),
       rowsTotalSize = rowSizes.calculateTotalSize(),
       columnsTotalSize = columnSizes.calculateTotalSize();

  /// Creating a grid with [Weight] sizes where [Weight.size] equal to 1.
  GridPadCells.gridSize({required final int rowCount, required final int columnCount})
    : this.sizes(
        rowSizes: WeightExtension.weightSame(rowCount, 1),
        columnSizes: WeightExtension.weightSame(columnCount, 1),
      );

  /// Contains information about size of each row.
  final List<GridPadCellSize> rowSizes;

  /// Contains information about size of each column.
  final List<GridPadCellSize> columnSizes;

  /// Calculated total size of all rows.
  final TotalSize rowsTotalSize;

  /// Calculated total size of all columns.
  final TotalSize columnsTotalSize;

  /// Calculated total size of all rows.
  int get rowCount => rowSizes.length;

  /// Calculated total size of all columns.
  int get columnCount => columnSizes.length;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is GridPadCells &&
          runtimeType == other.runtimeType &&
          listEquals(rowSizes, other.rowSizes) &&
          listEquals(columnSizes, other.columnSizes);

  @override
  int get hashCode => Object.hashAll(rowSizes) ^ Object.hashAll(columnSizes);
}

class GridPadCellsBuilder {
  GridPadCellsBuilder({required final int rowCount, required final int columnCount})
    : _rowSizes = WeightExtension.weightSame(rowCount, 1),
      _columnSizes = WeightExtension.weightSame(columnCount, 1);

  /// List of row sizes.
  final List<GridPadCellSize> _rowSizes;

  /// List of column sizes.
  final List<GridPadCellSize> _columnSizes;

  /// Set [size] for specific row [index].
  GridPadCellsBuilder rowSize(final int index, final GridPadCellSize size) {
    _rowSizes[index] = size;
    return this;
  }

  /// Set [size] for all rows.
  GridPadCellsBuilder rowsSize(final GridPadCellSize size) {
    _rowSizes.fillRange(0, _rowSizes.length, size);
    return this;
  }

  /// Set [size] for specific column [index].
  GridPadCellsBuilder columnSize(final int index, final GridPadCellSize size) {
    _columnSizes[index] = size;
    return this;
  }

  /// Set [size] for all columns.
  GridPadCellsBuilder columnsSize(final GridPadCellSize size) {
    _columnSizes.fillRange(0, _columnSizes.length, size);
    return this;
  }

  GridPadCells build() {
    return GridPadCells.sizes(rowSizes: _rowSizes, columnSizes: _columnSizes);
  }
}

/// Total size for rows or columns information.
class TotalSize {
  const TotalSize({required this.weight, required this.fixed});

  /// Total weight for all rows or columns.
  ///
  /// Can be 0 in cases where all rows or columns have [Fixed] size.
  final double weight;

  /// Total size for all rows or columns.
  ///
  /// Can be 0 in cases where all rows or columns have [Weight] size.
  final double fixed;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is TotalSize && runtimeType == other.runtimeType && weight == other.weight && fixed == other.fixed;

  @override
  int get hashCode => weight.hashCode ^ fixed.hashCode;
}

@protected
extension GridPadCellSizeExtension on Iterable<GridPadCellSize> {
  /// Calculate the total size for the defined cell sizes list.
  ///
  /// Throws an [ArgumentError] if any item in the collection
  /// is not [Weight] or [Fixed].
  TotalSize calculateTotalSize() {
    double totalWeightSize = 0;
    double totalFixedSize = 0;
    for (final cellSize in this) {
      switch (cellSize) {
        case Weight():
          totalWeightSize += cellSize.size;
          break;
        case Fixed():
          totalFixedSize += cellSize.size;
          break;
      }
    }
    return TotalSize(weight: totalWeightSize, fixed: totalFixedSize);
  }
}

/// Class describes grid cell size.
sealed class GridPadCellSize {}

/// Fixed grid cell size.
class Fixed implements GridPadCellSize {
  const Fixed(this.size) : assert(size > 0);

  /// Absolute size, should be greater than 0.
  final double size;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is Fixed && runtimeType == other.runtimeType && size == other.size;

  @override
  int get hashCode => size.hashCode;
}

/// Weight grid cell size.
class Weight implements GridPadCellSize {
  const Weight(this.size) : assert(size > 0);

  /// Size, should be greater than 0.
  final double size;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is Weight && runtimeType == other.runtimeType && size == other.size;

  @override
  int get hashCode => size.hashCode;
}

extension FixedExtension on Fixed {
  /// Create a list with length [count] of fixed cell sizes with size [size].
  static List<GridPadCellSize> fixedSame(final int count, final double size) {
    return List.generate(count, (final index) => size.fx());
  }

  /// Create a list of fixed cell sizes with passed fixed [sizes].
  static List<GridPadCellSize> fixedSizes(final List<double> sizes) {
    return sizes.map((final size) => size.fx()).toList();
  }
}

extension WeightExtension on Weight {
  /// Create a list with length [count] of weight cell sizes with
  /// weight size [size].
  static List<GridPadCellSize> weightSame(final int count, final double size) {
    return List.generate(count, (final index) => size.wt());
  }

  /// Create a list of weight cell sizes with passed weight [sizes].
  static List<GridPadCellSize> weightSizes(final List<double> sizes) {
    return sizes.map((final size) => size.wt()).toList();
  }
}

extension CellSizeExtension on num {
  /// Create [Fixed] cell size.
  Fixed fx() {
    return Fixed(toDouble());
  }

  /// Create [Weight] cell size.
  Weight wt() {
    return Weight(toDouble());
  }
}
