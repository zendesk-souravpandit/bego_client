import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeColumn', path: 'widget/multichild', type: BeColumn)
Widget useCaseBeColumn(final BuildContext context) {
  // Column Configuration
  final colXS = context.knobs.int.slider(label: 'XS (< 640px)', initialValue: 12, min: 1, max: 12);
  final colSM = context.knobs.int.slider(label: 'SM (≥ 640px)', initialValue: 6, min: 1, max: 12);
  final colMD = context.knobs.int.slider(label: 'MD (≥ 768px)', initialValue: 4, min: 1, max: 12);
  final colLG = context.knobs.int.slider(label: 'LG (≥ 1024px)', initialValue: 3, min: 1, max: 12);
  final colXL = context.knobs.int.slider(label: 'XL (≥ 1280px)', initialValue: 2, min: 1, max: 12);
  final colXL2 = context.knobs.int.slider(label: 'XL2 (≥ 1536px)', initialValue: 2, min: 1, max: 12);

  final offset = context.knobs.int.slider(label: 'Column Offset', initialValue: 0, min: 0, max: 11);
  final order = context.knobs.int.slider(label: 'Display Order', initialValue: 1, min: 1, max: 5);

  // Appearance
  final cardElevation = context.knobs.double.slider(label: 'Card Elevation', initialValue: 2, min: 0, max: 8);
  final showBreakpoints = context.knobs.boolean(label: 'Show Breakpoint Info', initialValue: true);
  final showGridLines = context.knobs.boolean(label: 'Show Grid Lines', initialValue: true);

  // Demo Type
  final demoType = context.knobs.list(
    label: 'Demo Type',
    options: [
      'Single Column',
      'Multiple Columns',
      'Responsive Showcase',
      'Offset Examples',
      'Order Examples',
      'Real World Cards',
    ],
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildColumnHeader(demoType),
          const SizedBox(height: 24),

          // Breakpoint Info
          if (showBreakpoints) ...[_buildBreakpointInfoCard(), const SizedBox(height: 24)],

          // Main Demo
          _buildColumnDemo(
            demoType: demoType,
            colXS: colXS,
            colSM: colSM,
            colMD: colMD,
            colLG: colLG,
            colXL: colXL,
            colXL2: colXL2,
            offset: offset,
            order: order,
            cardElevation: cardElevation,
            showGridLines: showGridLines,
          ),

          const SizedBox(height: 32),

          // Configuration Display
          _buildConfigurationDisplay(
            colXS: colXS,
            colSM: colSM,
            colMD: colMD,
            colLG: colLG,
            colXL: colXL,
            colXL2: colXL2,
            offset: offset,
            order: order,
          ),

          const SizedBox(height: 32),

          // Property Examples
          _buildColumnPropertyExamples(cardElevation),
        ],
      ),
    ),
  );
}

Widget _buildColumnHeader(final String demoType) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(_getColumnDemoIcon(demoType), size: 32, color: Colors.purple),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BeColumn Widget Demo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Demo: $demoType', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                const SizedBox(height: 8),
                const Text(
                  'BeColumn provides responsive column layouts with breakpoint-specific sizing, offsets, and ordering.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBreakpointInfoCard() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Breakpoint Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (final context, final constraints) {
              final width = constraints.maxWidth;
              final breakpoint = BeGridBreakpoints.getBreakpoint(width);
              final color = _getBreakpointColor(breakpoint.name);

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 255 * 0.1),
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.devices, color: color),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${breakpoint.name.toUpperCase()} - ${width.toStringAsFixed(0)}px',
                            style: TextStyle(fontWeight: FontWeight.bold, color: color),
                          ),
                          Text(
                            _getBreakpointDescription(breakpoint.name),
                            style: TextStyle(color: color.withValues(alpha: 255 * 0.8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildBreakpointReference(),
        ],
      ),
    ),
  );
}

Widget _buildBreakpointReference() {
  final breakpoints = [
    ('xs', '< 640px', 'Mobile phones', Colors.red),
    ('sm', '≥ 640px', 'Large phones', Colors.orange),
    ('md', '≥ 768px', 'Tablets', Colors.blue),
    ('lg', '≥ 1024px', 'Small desktops', Colors.green),
    ('xl', '≥ 1280px', 'Large desktops', Colors.purple),
    ('xl2', '≥ 1536px', 'Extra large screens', Colors.indigo),
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Breakpoint Reference:', style: TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: breakpoints.map((final bp) => _buildBreakpointChip(bp.$1, bp.$2, bp.$3, bp.$4)).toList(),
      ),
    ],
  );
}

Widget _buildBreakpointChip(final String name, final String size, final String description, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 255 * 0.1),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
        Text(size, style: TextStyle(fontSize: 9, color: color.withValues(alpha: 255 * 0.8))),
      ],
    ),
  );
}

Widget _buildColumnDemo({
  required final String demoType,
  required final int colXS,
  required final int colSM,
  required final int colMD,
  required final int colLG,
  required final int colXL,
  required final int colXL2,
  required final int offset,
  required final int order,
  required final double cardElevation,
  required final bool showGridLines,
}) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BeColumn - $demoType', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Container(
            decoration:
                showGridLines
                    ? BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )
                    : null,
            child: BeRow(
              spacing: 12,
              runSpacing: 16,
              children: _generateColumnDemoContent(
                demoType,
                colXS,
                colSM,
                colMD,
                colLG,
                colXL,
                colXL2,
                offset,
                order,
                cardElevation,
                showGridLines,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

List<Widget> _generateColumnDemoContent(
  final String demoType,
  final int colXS,
  final int colSM,
  final int colMD,
  final int colLG,
  final int colXL,
  final int colXL2,
  final int offset,
  final int order,
  final double cardElevation,
  final bool showGridLines,
) {
  switch (demoType) {
    case 'Single Column':
      return [
        BeColumn(
          xs: colXS,
          sm: colSM,
          md: colMD,
          lg: colLG,
          xl: colXL,
          xl2: colXL2,
          offset: offset,
          order: order,
          child: _buildResponsiveColumnCard(
            'Interactive Column',
            'xs:$colXS sm:$colSM md:$colMD lg:$colLG xl:$colXL xl2:$colXL2',
            offset,
            order,
            Colors.purple,
            cardElevation,
            showGridLines,
          ),
        ),
      ];

    case 'Multiple Columns':
      return [
        BeColumn(
          xs: colXS,
          sm: colSM,
          md: colMD,
          lg: colLG,
          xl: colXL,
          xl2: colXL2,
          child: _buildColumnCard('Column 1', 'Primary content', Colors.blue, cardElevation),
        ),
        BeColumn(
          xs: 12,
          sm: 6,
          md: 4,
          child: _buildColumnCard('Column 2', 'Secondary content', Colors.green, cardElevation),
        ),
        BeColumn(
          xs: 12,
          sm: 12,
          md: 4,
          child: _buildColumnCard('Column 3', 'Additional content', Colors.orange, cardElevation),
        ),
      ];

    case 'Responsive Showcase':
      return [
        BeColumn(
          xs: 12,
          sm: 6,
          md: 4,
          lg: 3,
          child: _buildShowcaseCard('Mobile First', 'xs:12 → sm:6 → md:4 → lg:3', Colors.red, cardElevation),
        ),
        BeColumn(
          xs: 12,
          sm: 6,
          md: 8,
          lg: 6,
          child: _buildShowcaseCard('Adaptive Width', 'xs:12 → sm:6 → md:8 → lg:6', Colors.blue, cardElevation),
        ),
        BeColumn(
          xs: 6,
          sm: 12,
          md: 12,
          lg: 3,
          child: _buildShowcaseCard('Complex Layout', 'xs:6 → sm:12 → md:12 → lg:3', Colors.green, cardElevation),
        ),
      ];

    case 'Offset Examples':
      return [
        BeColumn(xs: 6, offset: 0, child: _buildOffsetCard('No Offset', 'offset: 0', Colors.blue, cardElevation)),
        BeColumn(xs: 4, offset: 2, child: _buildOffsetCard('Offset 2', 'offset: 2', Colors.green, cardElevation)),
        BeColumn(xs: 3, offset: 3, child: _buildOffsetCard('Offset 3', 'offset: 3', Colors.orange, cardElevation)),
      ];

    case 'Order Examples':
      return [
        BeColumn(xs: 4, order: 3, child: _buildOrderCard('Third', 'order: 3', Colors.red, cardElevation)),
        BeColumn(xs: 4, order: 1, child: _buildOrderCard('First', 'order: 1', Colors.green, cardElevation)),
        BeColumn(xs: 4, order: 2, child: _buildOrderCard('Second', 'order: 2', Colors.blue, cardElevation)),
      ];

    case 'Real World Cards':
      return [
        BeColumn(
          xs: 12,
          md: 8,
          child: _buildRealWorldCard(
            'Main Content',
            'Article or main content area',
            Icons.article,
            Colors.indigo,
            cardElevation,
          ),
        ),
        BeColumn(
          xs: 12,
          md: 4,
          child: Column(
            children: [
              _buildRealWorldCard('Sidebar', 'Navigation or ads', Icons.menu, Colors.teal, cardElevation),
              const SizedBox(height: 12),
              _buildRealWorldCard('Widget', 'Additional info', Icons.widgets, Colors.amber, cardElevation),
            ],
          ),
        ),
      ];

    default:
      return [
        BeColumn(
          xs: colXS,
          child: _buildColumnCard('Demo Column', 'Adjust settings to see changes', Colors.purple, cardElevation),
        ),
      ];
  }
}

Widget _buildConfigurationDisplay({
  required final int colXS,
  required final int colSM,
  required final int colMD,
  required final int colLG,
  required final int colXL,
  required final int colXL2,
  required final int offset,
  required final int order,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current BeColumn Configuration', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Breakpoint Configuration
          _buildConfigSection('Breakpoint Sizes', [
            _buildConfigItem('XS (< 640px)', '$colXS/12', Colors.red),
            _buildConfigItem('SM (≥ 640px)', '$colSM/12', Colors.orange),
            _buildConfigItem('MD (≥ 768px)', '$colMD/12', Colors.blue),
            _buildConfigItem('LG (≥ 1024px)', '$colLG/12', Colors.green),
            _buildConfigItem('XL (≥ 1280px)', '$colXL/12', Colors.purple),
            _buildConfigItem('XL2 (≥ 1536px)', '$colXL2/12', Colors.indigo),
          ]),

          const SizedBox(height: 16),

          // Additional Properties
          _buildConfigSection('Additional Properties', [
            _buildConfigItem('Offset', '$offset columns', Colors.grey),
            _buildConfigItem('Order', '$order', Colors.blueGrey),
          ]),
        ],
      ),
    ),
  );
}

Widget _buildConfigSection(final String title, final List<Widget> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 4, children: items),
    ],
  );
}

Widget _buildConfigItem(final String label, final String value, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 255 * 0.1),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
    ),
    child: Text('$label: $value', style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
  );
}

Widget _buildColumnPropertyExamples(final double cardElevation) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeColumn Property Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Responsive Sizing Example
          _buildPropertyExample(
            'Responsive Column Sizing',
            'Columns that change width at different breakpoints',
            BeRow(
              spacing: 8,
              children: [
                BeColumn(xs: 12, sm: 6, md: 4, child: _buildExampleCard('xs:12 sm:6 md:4', Colors.blue.shade200)),
                BeColumn(xs: 12, sm: 6, md: 8, child: _buildExampleCard('xs:12 sm:6 md:8', Colors.green.shade200)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Offset Example
          _buildPropertyExample(
            'Column Offset',
            'Push columns to the right using offset',
            BeRow(
              spacing: 8,
              children: [BeColumn(xs: 4, offset: 4, child: _buildExampleCard('xs:4 offset:4', Colors.orange.shade200))],
            ),
          ),

          const SizedBox(height: 24),

          // Order Example
          _buildPropertyExample(
            'Column Order',
            'Change visual order using the order property',
            BeRow(
              spacing: 8,
              children: [
                BeColumn(xs: 4, order: 3, child: _buildExampleCard('Visual: Third\nOrder: 3', Colors.red.shade200)),
                BeColumn(xs: 4, order: 1, child: _buildExampleCard('Visual: First\nOrder: 1', Colors.green.shade200)),
                BeColumn(xs: 4, order: 2, child: _buildExampleCard('Visual: Second\nOrder: 2', Colors.blue.shade200)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPropertyExample(final String title, final String description, final Widget example) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      const SizedBox(height: 4),
      Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
      const SizedBox(height: 12),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: example,
      ),
    ],
  );
}

// Helper functions for building different types of cards
Widget _buildResponsiveColumnCard(
  final String title,
  final String breakpoints,
  final int offset,
  final int order,
  final Color color,
  final double elevation,
  final bool showGridLines,
) {
  return Container(
    constraints: const BoxConstraints(minHeight: 100),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 255 * 0.1),
      border:
          showGridLines ? Border.all(color: color, width: 2) : Border.all(color: color.withValues(alpha: 255 * 0.3)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.view_column, color: color, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16))),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              breakpoints,
              style: TextStyle(color: color.withValues(alpha: 255 * 0.8), fontSize: 11, fontFamily: 'monospace'),
            ),
            if (offset > 0) ...[
              const SizedBox(height: 4),
              Text('Offset: $offset', style: TextStyle(color: color.withValues(alpha: 255 * 0.8), fontSize: 11)),
            ],
            if (order > 1) ...[
              const SizedBox(height: 4),
              Text('Order: $order', style: TextStyle(color: color.withValues(alpha: 255 * 0.8), fontSize: 11)),
            ],
          ],
        ),
      ),
    ),
  );
}

Widget _buildColumnCard(final String title, final String subtitle, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.05),
        border: Border.all(color: color.withValues(alpha: 255 * 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildShowcaseCard(final String title, final String responsive, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 255 * 0.1), color.withValues(alpha: 255 * 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.devices, color: color, size: 20),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            responsive,
            style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 10, fontFamily: 'monospace'),
          ),
        ],
      ),
    ),
  );
}

Widget _buildOffsetCard(final String title, final String offsetInfo, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.1),
        border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.format_indent_increase, color: color, size: 24),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(offsetInfo, style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildOrderCard(final String title, final String orderInfo, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.1),
        border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.reorder, color: color, size: 24),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(orderInfo, style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildRealWorldCard(
  final String title,
  final String description,
  final IconData icon,
  final Color color,
  final double elevation,
) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.05),
        border: Border.all(color: color.withValues(alpha: 255 * 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildExampleCard(final String text, final Color color) {
  return Container(
    height: 60,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

// Helper functions
Color _getBreakpointColor(final String breakpoint) {
  switch (breakpoint) {
    case 'xs':
      return Colors.red;
    case 'sm':
      return Colors.orange;
    case 'md':
      return Colors.blue;
    case 'lg':
      return Colors.green;
    case 'xl':
      return Colors.purple;
    case 'xl2':
      return Colors.indigo;
    default:
      return Colors.grey;
  }
}

String _getBreakpointDescription(final String breakpoint) {
  switch (breakpoint) {
    case 'xs':
      return 'Mobile phones (< 640px)';
    case 'sm':
      return 'Large phones, small tablets (≥ 640px)';
    case 'md':
      return 'Tablets (≥ 768px)';
    case 'lg':
      return 'Small desktops (≥ 1024px)';
    case 'xl':
      return 'Large desktops (≥ 1280px)';
    case 'xl2':
      return 'Extra large screens (≥ 1536px)';
    default:
      return 'Unknown breakpoint';
  }
}

IconData _getColumnDemoIcon(final String demoType) {
  switch (demoType) {
    case 'Single Column':
      return Icons.view_stream;
    case 'Multiple Columns':
      return Icons.view_column;
    case 'Responsive Showcase':
      return Icons.devices;
    case 'Offset Examples':
      return Icons.format_indent_increase;
    case 'Order Examples':
      return Icons.reorder;
    case 'Real World Cards':
      return Icons.dashboard;
    default:
      return Icons.view_agenda;
  }
}
