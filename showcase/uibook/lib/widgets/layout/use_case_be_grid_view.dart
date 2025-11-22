import 'package:beui/layout.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeGridView', path: 'widget/layout', type: BeGridView)
Widget useCaseBeGridView(final BuildContext context) {
  final rowCount = context.knobs.int.slider(label: 'Row Count', initialValue: 3, min: 2, max: 6);

  final columnCount = context.knobs.int.slider(label: 'Column Count', initialValue: 3, min: 2, max: 6);

  final gridType = context.knobs.object.dropdown(
    label: 'Grid Type',
    options: ['Equal Weights', 'Mixed Sizes', 'Fixed Sizes', 'Custom Builder'],
    initialOption: 'Equal Weights',
  );

  final placementPolicyType = context.knobs.object.dropdown(
    label: 'Placement Policy',
    options: ['Default', 'Horizontal StartEnd', 'Horizontal EndStart', 'Vertical TopBottom', 'Vertical BottomTop'],
    initialOption: 'Default',
  );

  BeGridPlacementPolicy getPlacementPolicy() {
    switch (placementPolicyType) {
      case 'Horizontal StartEnd':
        return BeGridPlacementPolicy(mainAxis: Axis.horizontal, horizontalPolicy: BeGridHorizontalPolicy.startEnd);
      case 'Horizontal EndStart':
        return BeGridPlacementPolicy(mainAxis: Axis.horizontal, horizontalPolicy: BeGridHorizontalPolicy.endStart);
      case 'Vertical TopBottom':
        return BeGridPlacementPolicy(mainAxis: Axis.vertical, verticalPolicy: BeGridVerticalPolicy.topBottom);
      case 'Vertical BottomTop':
        return BeGridPlacementPolicy(mainAxis: Axis.vertical, verticalPolicy: BeGridVerticalPolicy.bottomTop);
      default:
        return BeGridPlacementPolicy.defaultPolicy;
    }
  }

  BeGridCells getGridCells() {
    switch (gridType) {
      case 'Equal Weights':
        return BeGridCells.gridSize(rowCount: rowCount, columnCount: columnCount);

      case 'Mixed Sizes':
        return BeGridCells.sizes(
          rowSizes: [
            const Weight(2), // Larger first row
            const Weight(1), // Normal second row
            if (rowCount > 2) const Fixed(80), // Fixed third row
            if (rowCount > 3) const Weight(1.5), // Medium fourth row
            if (rowCount > 4) const Weight(1), // Normal fifth row
            if (rowCount > 5) const Fixed(60), // Small fixed sixth row
          ].take(rowCount),
          columnSizes: [
            const Fixed(100), // Fixed first column
            const Weight(2), // Large second column
            const Weight(1), // Normal third column
            if (columnCount > 3) const Fixed(80), // Fixed fourth column
            if (columnCount > 4) const Weight(1.5), // Medium fifth column
            if (columnCount > 5) const Weight(1), // Normal sixth column
          ].take(columnCount),
        );

      case 'Fixed Sizes':
        return BeGridCells.sizes(
          rowSizes: FixedExtension.fixedSame(rowCount, 120),
          columnSizes: FixedExtension.fixedSame(columnCount, 150),
        );

      case 'Custom Builder':
        return BeGridCellsBuilder(rowCount: rowCount, columnCount: columnCount)
            .rowSize(0, const Weight(2)) // First row larger
            .columnSize(0, const Fixed(120)) // First column fixed
            .columnSize(1, const Weight(3)) // Second column large
            .build();

      default:
        return BeGridCells.gridSize(rowCount: rowCount, columnCount: columnCount);
    }
  }

  return Scaffold(
    appBar: AppBar(
      title: const Text('BeGridView Examples'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeGridView Layout System:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Grid Type: $gridType | ${rowCount}x$columnCount', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),

          // Grid Information Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Grid Configuration:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Rows: $rowCount | Columns: $columnCount'),
                Text('Type: $gridType'),
                Text('Placement: $placementPolicyType'),
                const SizedBox(height: 8),
                const Text('BeGridCells Features:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('• Fixed sizes (absolute pixels)'),
                const Text('• Weight sizes (proportional)'),
                const Text('• Builder pattern for custom configurations'),
                const Text('• Mixed sizing support'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Main Grid Example
          Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BeGridView(
              gridPadCells: getGridCells(),
              placementPolicy: getPlacementPolicy(),
              children: _buildGridChildren(rowCount, columnCount),
            ),
          ),

          const SizedBox(height: 32),
          const Text('BeCell Widget Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Explicit placement and spanning', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          // Explicit Cell Placement Example
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BeGridView(
              gridPadCells: BeGridCells.gridSize(rowCount: 4, columnCount: 4),
              children: [
                // Header spanning full width
                Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    border: Border.all(color: Colors.purple.shade300),
                  ),
                  child: const Center(child: Text('Header\n(Spans 4 columns)', textAlign: TextAlign.center)),
                ).cell(row: 0, column: 0, columnSpan: 4),

                // Sidebar spanning 2 rows
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    border: Border.all(color: Colors.orange.shade300),
                  ),
                  child: const Center(child: Text('Sidebar\n(Spans 2 rows)', textAlign: TextAlign.center)),
                ).cell(row: 1, column: 0, rowSpan: 2),

                // Content area spanning 2x2
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    border: Border.all(color: Colors.green.shade300),
                  ),
                  child: const Center(child: Text('Content\n(2x2 span)', textAlign: TextAlign.center)),
                ).cell(row: 1, column: 1, rowSpan: 2, columnSpan: 2),

                // Right sidebar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    border: Border.all(color: Colors.blue.shade300),
                  ),
                  child: const Center(child: Text('Right\nSidebar', textAlign: TextAlign.center)),
                ).cell(row: 1, column: 3, rowSpan: 2),

                // Footer spanning full width
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    border: Border.all(color: Colors.red.shade300),
                  ),
                  child: const Center(child: Text('Footer (Spans 4 columns)', textAlign: TextAlign.center)),
                ).cell(row: 3, column: 0, columnSpan: 4),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Text('Size Types Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Fixed vs Weight sizing', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          // Size Types Grid
          Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BeGridView(
              gridPadCells: BeGridCells.sizes(
                rowSizes: [
                  const Fixed(60), // Fixed 60px
                  const Weight(1), // Take remaining space equally
                  const Weight(2), // Take 2x more space
                  const Fixed(40), // Fixed 40px
                ],
                columnSizes: [
                  const Fixed(100), // Fixed 100px
                  const Weight(1), // Equal weight
                  const Weight(2), // 2x weight
                  const Weight(1), // Equal weight
                ],
              ),
              children: [
                // Row headers showing row types
                _buildSizeCell('Fixed\n60px', Colors.red.shade100, Colors.red.shade300),
                _buildSizeCell('Weight\n1x', Colors.green.shade100, Colors.green.shade300),
                _buildSizeCell('Weight\n2x', Colors.blue.shade100, Colors.blue.shade300),
                _buildSizeCell('Fixed\n40px', Colors.orange.shade100, Colors.orange.shade300),

                // Column type indicators and content
                for (int row = 0; row < 4; row++)
                  for (int col = 1; col < 4; col++)
                    _buildSizeCell(
                      '${row == 0
                          ? 'Fixed\n100px'
                          : row == 1
                          ? 'Wt 1x'
                          : row == 2
                          ? 'Wt 2x'
                          : 'Wt 1x'}\n'
                      'R${row + 1}C${col + 1}',
                      Colors.grey.shade100,
                      Colors.grey.shade300,
                    ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Text('Builder Pattern Example:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Using BeGridCellsBuilder for custom configurations', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          // Builder Pattern Example
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BeGridView(
              gridPadCells: BeGridCellsBuilder(rowCount: 3, columnCount: 4)
                  .rowSize(0, const Fixed(50)) // Header row fixed
                  .rowSize(1, const Weight(2)) // Content row larger
                  .rowSize(2, const Weight(1)) // Footer row smaller
                  .columnSize(0, const Fixed(80)) // Sidebar fixed
                  .columnSize(1, const Weight(2)) // Main content larger
                  .columnSize(2, const Weight(1)) // Right panel smaller
                  .columnSize(3, const Fixed(60)) // Actions column fixed
                  .build(),
              children: [
                // Header
                for (int i = 0; i < 4; i++)
                  _buildBuilderCell('H${i + 1}', Colors.purple.shade100, Colors.purple.shade300),

                // Content row
                _buildBuilderCell('Side', Colors.orange.shade100, Colors.orange.shade300),
                _buildBuilderCell('Main Content Area', Colors.green.shade100, Colors.green.shade300),
                _buildBuilderCell('Panel', Colors.blue.shade100, Colors.blue.shade300),
                _buildBuilderCell('Actions', Colors.red.shade100, Colors.red.shade300),

                // Footer
                for (int i = 0; i < 4; i++) _buildBuilderCell('F${i + 1}', Colors.grey.shade200, Colors.grey.shade400),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Text('Extension Methods Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Using .fx() and .wt() extension methods', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          // Extension Methods Example
          Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BeGridView(
              gridPadCells: BeGridCells.sizes(
                rowSizes: [100.fx(), 1.wt(), 80.fx()], // Using extension methods
                columnSizes: [120.fx(), 2.wt(), 1.wt(), 100.fx()],
              ),
              children: [
                // First row - fixed 100px height
                for (var i = 0; i < 4; i++)
                  _buildExtensionCell('100.fx()', 'Fixed\n100px', Colors.red.shade100, Colors.red.shade300),

                // Second row - weight 1
                _buildExtensionCell('120.fx()', 'Fixed\n120px', Colors.blue.shade100, Colors.blue.shade300),
                _buildExtensionCell('2.wt()', 'Weight\n2x', Colors.green.shade100, Colors.green.shade300),
                _buildExtensionCell('1.wt()', 'Weight\n1x', Colors.orange.shade100, Colors.orange.shade300),
                _buildExtensionCell('100.fx()', 'Fixed\n100px', Colors.purple.shade100, Colors.purple.shade300),

                // Third row - fixed 80px height
                for (var i = 0; i < 4; i++)
                  _buildExtensionCell('80.fx()', 'Fixed\n80px', Colors.grey.shade200, Colors.grey.shade400),
              ],
            ),
          ),

          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: Colors.amber.shade700),
                    const SizedBox(width: 8),
                    const Text('BeGridCells Features', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                const Text('Size Types:'),
                const Text('• Fixed(size) - Absolute pixel size'),
                const Text('• Weight(size) - Proportional sizing'),
                const SizedBox(height: 8),
                const Text('Creation Methods:'),
                const Text('• BeGridCells.gridSize() - Equal weight grid'),
                const Text('• BeGridCells.sizes() - Custom row/column sizes'),
                const Text('• BeGridCellsBuilder() - Builder pattern'),
                const SizedBox(height: 8),
                const Text('Extension Methods:'),
                const Text('• number.fx() - Creates Fixed size'),
                const Text('• number.wt() - Creates Weight size'),
                const SizedBox(height: 8),
                const Text('Cell Placement:'),
                const Text('• widget.cell() - Explicit placement'),
                const Text('• widget.implicitCell() - Auto placement'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> _buildGridChildren(final int rows, final int columns) {
  final colors = [
    Colors.red.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.teal.shade100,
  ];

  final borderColors = [
    Colors.red.shade300,
    Colors.blue.shade300,
    Colors.green.shade300,
    Colors.orange.shade300,
    Colors.purple.shade300,
    Colors.teal.shade300,
  ];

  return List.generate(rows * columns, (final index) {
    final row = index ~/ columns;
    final col = index % columns;
    final colorIndex = index % colors.length;

    return Container(
      decoration: BoxDecoration(
        color: colors[colorIndex],
        border: Border.all(color: borderColors[colorIndex]),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cell $index', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('R$row C$col', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  });
}

Widget _buildSizeCell(final String text, final Color bgColor, final Color borderColor) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget _buildBuilderCell(final String text, final Color bgColor, final Color borderColor) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget _buildExtensionCell(
  final String method,
  final String description,
  final Color bgColor,
  final Color borderColor,
) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            method,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(description, style: const TextStyle(fontSize: 9), textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
