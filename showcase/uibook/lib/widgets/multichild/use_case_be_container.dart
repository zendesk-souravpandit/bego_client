import 'package:beui/layout.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeContainer', path: 'widget/multichild', type: BeContainer)
Widget useCaseBeContainer(final BuildContext context) {
  // Container Configuration
  final fluid = context.knobs.boolean(label: 'Fluid Container', initialValue: false);
  final customPadding = context.knobs.double.slider(label: 'Padding', initialValue: 16, min: 0, max: 48);
  final customMaxWidth = context.knobs.double.slider(
    label: 'Max Width (when not fluid)',
    initialValue: 1200,
    min: 400,
    max: 1600,
  );

  // Content Configuration
  final showGrid = context.knobs.boolean(label: 'Show Grid Content', initialValue: true);
  final columnCount = context.knobs.int.slider(label: 'Number of Columns', initialValue: 3, min: 1, max: 6);
  final spacing = context.knobs.double.slider(label: 'Column Spacing', initialValue: 16, min: 0, max: 32);

  // Appearance
  final showBorder = context.knobs.boolean(label: 'Show Container Border', initialValue: true);
  final cardElevation = context.knobs.double.slider(label: 'Card Elevation', initialValue: 2, min: 0, max: 8);
  final backgroundColor = context.knobs.list(
    label: 'Background Color',
    options: ['None', 'Light Gray', 'Light Blue', 'Light Green'],
  );

  // Demo Type
  final demoType = context.knobs.list(
    label: 'Demo Type',
    options: ['Basic Container', 'Responsive Showcase', 'Nested Containers', 'Real World Layout', 'Comparison View'],
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildContainerHeader(demoType),
          const SizedBox(height: 24),

          // Container Info
          _buildContainerInfo(fluid, customPadding, customMaxWidth),
          const SizedBox(height: 24),

          // Main Demo
          _buildContainerDemo(
            demoType: demoType,
            fluid: fluid,
            customPadding: customPadding,
            customMaxWidth: customMaxWidth,
            showGrid: showGrid,
            columnCount: columnCount,
            spacing: spacing,
            showBorder: showBorder,
            cardElevation: cardElevation,
            backgroundColor: backgroundColor,
          ),

          const SizedBox(height: 32),

          // Property Examples
          _buildContainerPropertyExamples(cardElevation),
        ],
      ),
    ),
  );
}

Widget _buildContainerHeader(final String demoType) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(_getContainerDemoIcon(demoType), size: 32, color: Colors.teal),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BeContainer Widget Demo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Demo: $demoType', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                const SizedBox(height: 8),
                const Text(
                  'BeContainer provides responsive containers with automatic max-width constraints and padding.',
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

Widget _buildContainerInfo(final bool fluid, final double customPadding, final double customMaxWidth) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Container Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),

          LayoutBuilder(
            builder: (final context, final constraints) {
              final width = constraints.maxWidth;
              final breakpoint = calculateBreakpoint(width);
              final color = _getBreakpointColor(breakpoint.name);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
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
                                style: TextStyle(color: color.withValues(alpha: 0.8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      _buildInfoChip('Mode', fluid ? 'Fluid' : 'Fixed', fluid ? Colors.blue : Colors.green),
                      _buildInfoChip('Padding', '${customPadding.toStringAsFixed(0)}px', Colors.orange),
                      if (!fluid) _buildInfoChip('Max Width', '${customMaxWidth.toStringAsFixed(0)}px', Colors.purple),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildContainerDemo({
  required final String demoType,
  required final bool fluid,
  required final double customPadding,
  required final double customMaxWidth,
  required final bool showGrid,
  required final int columnCount,
  required final double spacing,
  required final bool showBorder,
  required final double cardElevation,
  required final String backgroundColor,
}) {
  final bgColor = _getBackgroundColor(backgroundColor);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('BeContainer - $demoType', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      Container(
        decoration:
            showBorder
                ? BoxDecoration(border: Border.all(color: Colors.red, width: 2), borderRadius: BorderRadius.circular(8))
                : null,
        child: BeContainer(
          fluid: fluid,
          padding: EdgeInsets.all(customPadding),
          maxWidth: fluid ? null : customMaxWidth,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _generateContainerContent(demoType, showGrid, columnCount, spacing, cardElevation),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _generateContainerContent(
  final String demoType,
  final bool showGrid,
  final int columnCount,
  final double spacing,
  final double cardElevation,
) {
  switch (demoType) {
    case 'Basic Container':
      return showGrid ? _buildBasicGridContent(columnCount, spacing, cardElevation) : _buildBasicTextContent();

    case 'Responsive Showcase':
      return _buildResponsiveShowcaseContent(cardElevation);

    case 'Nested Containers':
      return _buildNestedContainersContent(cardElevation);

    case 'Real World Layout':
      return _buildRealWorldLayoutContent(cardElevation);

    case 'Comparison View':
      return _buildComparisonViewContent(cardElevation);

    default:
      return _buildBasicGridContent(columnCount, spacing, cardElevation);
  }
}

Widget _buildBasicGridContent(final int columnCount, final double spacing, final double cardElevation) {
  final colSize = 12 ~/ columnCount;

  return BeRow(
    spacing: spacing,
    children: List.generate(
      columnCount,
      (final index) => BeColumn(
        xs: colSize,
        child: _buildContentCard(
          'Column ${index + 1}',
          'Content in container',
          Colors.primaries[index % Colors.primaries.length],
          cardElevation,
        ),
      ),
    ),
  );
}

Widget _buildBasicTextContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Container Content', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),
      const Text(
        'This is content inside a BeContainer. The container automatically handles responsive padding and max-width constraints based on the current breakpoint.',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 16),
      ElevatedButton(onPressed: () {}, child: const Text('Action Button')),
    ],
  );
}

Widget _buildResponsiveShowcaseContent(final double cardElevation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Responsive Behavior', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      BeRow(
        spacing: 16,
        children: [
          BeColumn(
            xs: 12,
            md: 4,
            child: _buildShowcaseCard(
              'Mobile',
              'Full width on small screens',
              Icons.phone_android,
              Colors.red,
              cardElevation,
            ),
          ),
          BeColumn(
            xs: 12,
            md: 4,
            child: _buildShowcaseCard(
              'Tablet',
              'Constrained width on medium screens',
              Icons.tablet,
              Colors.blue,
              cardElevation,
            ),
          ),
          BeColumn(
            xs: 12,
            md: 4,
            child: _buildShowcaseCard(
              'Desktop',
              'Max width on large screens',
              Icons.desktop_windows,
              Colors.green,
              cardElevation,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildNestedContainersContent(final double cardElevation) {
  return Column(
    children: [
      const Text('Nested Containers Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      BeContainer(
        fluid: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border.all(color: Colors.blue.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Text('Inner Container', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              BeRow(
                spacing: 12,
                children: [
                  BeColumn(xs: 6, child: _buildContentCard('Nested 1', 'Content', Colors.blue, cardElevation)),
                  BeColumn(xs: 6, child: _buildContentCard('Nested 2', 'Content', Colors.blue, cardElevation)),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildRealWorldLayoutContent(final double cardElevation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header
      _buildSectionHeader('Website Layout Example'),
      const SizedBox(height: 16),

      // Navigation
      _buildNavbar(cardElevation),
      const SizedBox(height: 16),

      // Main Content Area
      BeRow(
        spacing: 20,
        children: [
          BeColumn(
            xs: 12,
            lg: 8,
            child: Column(
              children: [
                _buildContentCard('Main Article', 'Primary content area', Colors.indigo, cardElevation),
                const SizedBox(height: 16),
                _buildContentCard('Related Content', 'Additional articles', Colors.indigo, cardElevation),
              ],
            ),
          ),
          BeColumn(
            xs: 12,
            lg: 4,
            child: Column(
              children: [
                _buildContentCard('Sidebar', 'Navigation & ads', Colors.teal, cardElevation),
                const SizedBox(height: 16),
                _buildContentCard('Widgets', 'Social & tools', Colors.teal, cardElevation),
              ],
            ),
          ),
        ],
      ),

      const SizedBox(height: 16),

      // Footer
      _buildContentCard('Footer', 'Site-wide footer content', Colors.grey, cardElevation),
    ],
  );
}

Widget _buildComparisonViewContent(final double cardElevation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Container Type Comparison', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      BeRow(
        spacing: 16,
        children: [
          BeColumn(
            xs: 12,
            md: 6,
            child: Column(
              children: [
                _buildComparisonCard(
                  'Fluid Container',
                  'Takes full width of parent',
                  ['No max-width constraints', 'Responsive padding', 'Full viewport width'],
                  Colors.blue,
                  cardElevation,
                ),
              ],
            ),
          ),
          BeColumn(
            xs: 12,
            md: 6,
            child: Column(
              children: [
                _buildComparisonCard(
                  'Fixed Container',
                  'Has max-width constraints',
                  ['Breakpoint-based max-width', 'Centered content', 'Responsive padding'],
                  Colors.green,
                  cardElevation,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildContainerPropertyExamples(final double cardElevation) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeContainer Property Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Fluid vs Fixed Example
          _buildPropertyExample(
            'Fluid vs Fixed Container',
            'Compare behavior of fluid and fixed containers',
            Column(
              children: [
                _buildContainerExample('Fluid Container (fluid: true)', true, cardElevation),
                const SizedBox(height: 16),
                _buildContainerExample('Fixed Container (fluid: false)', false, cardElevation),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Padding Example
          _buildPropertyExample(
            'Custom Padding',
            'BeContainer with different padding values',
            BeContainer(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Custom padding: 24px'),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Max Width Example
          _buildPropertyExample(
            'Custom Max Width',
            'BeContainer with custom maxWidth property',
            BeContainer(
              maxWidth: 600,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Custom max-width: 600px'),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildContainerExample(final String title, final bool fluid, final double cardElevation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: fluid ? Colors.blue : Colors.green, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: BeContainer(
          fluid: fluid,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (fluid ? Colors.blue : Colors.green).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('${fluid ? 'Fluid' : 'Fixed'} container content'),
          ),
        ),
      ),
    ],
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
      example,
    ],
  );
}

// Helper widgets
Widget _buildContentCard(final String title, final String subtitle, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      constraints: const BoxConstraints(minHeight: 80),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildShowcaseCard(
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
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget _buildSectionHeader(final String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
  );
}

Widget _buildNavbar(final double cardElevation) {
  return Card(
    elevation: cardElevation,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(8)),
      child: const Row(
        children: [
          Text('Logo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          Spacer(),
          Text('Home', style: TextStyle(color: Colors.white)),
          SizedBox(width: 20),
          Text('About', style: TextStyle(color: Colors.white)),
          SizedBox(width: 20),
          Text('Contact', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}

Widget _buildComparisonCard(
  final String title,
  final String subtitle,
  final List<String> features,
  final Color color,
  final double elevation,
) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 12)),
          const SizedBox(height: 12),
          ...features.map(
            (final feature) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: color, size: 16),
                  const SizedBox(width: 8),
                  Expanded(child: Text(feature, style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.8)))),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildInfoChip(final String label, final String value, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: color.withValues(alpha: 0.3)),
    ),
    child: Text('$label: $value', style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
  );
}

// Helper functions
Color _getBackgroundColor(final String backgroundColor) {
  switch (backgroundColor) {
    case 'Light Gray':
      return Colors.grey.shade100;
    case 'Light Blue':
      return Colors.blue.shade50;
    case 'Light Green':
      return Colors.green.shade50;
    default:
      return Colors.transparent;
  }
}

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

IconData _getContainerDemoIcon(final String demoType) {
  switch (demoType) {
    case 'Basic Container':
      return Icons.crop_free;
    case 'Responsive Showcase':
      return Icons.devices;
    case 'Nested Containers':
      return Icons.layers;
    case 'Real World Layout':
      return Icons.web;
    case 'Comparison View':
      return Icons.compare;
    default:
      return Icons.crop_free;
  }
}
