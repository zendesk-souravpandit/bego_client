import 'package:beui/layout.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeGrid', path: 'widget/multichild', type: BeRow)
Widget useCaseBeGrid(final BuildContext context) {
  return const BeGridDemo();
}

class BeGridDemo extends StatefulWidget {
  const BeGridDemo({super.key});

  @override
  State<BeGridDemo> createState() => _BeGridDemoState();
}

class _BeGridDemoState extends State<BeGridDemo> {
  final ScrollController _scrollController = ScrollController();

  // State variables to reduce rebuilds
  double _spacing = 16;
  double _runSpacing = 16;
  bool _containerFluid = false;
  final double _customPadding = 16;
  final MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  final CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  String _demoType = 'Interactive Demo';
  bool _showBreakpoints = true;
  final bool _showGridLines = false;
  double _cardElevation = 2;

  // Column sizes
  int _col1XS = 12, _col1SM = 6, _col1MD = 4, _col1LG = 3;
  int _col2XS = 12, _col2SM = 6, _col2MD = 4, _col2LG = 3;
  int _col3XS = 12, _col3SM = 12, _col3MD = 4, _col3LG = 3;

  @override
  Widget build(final BuildContext context) {
    // Only get knobs once to avoid excessive rebuilds
    _spacing = context.knobs.double.slider(label: 'Column Spacing', initialValue: _spacing, min: 0, max: 48);
    _runSpacing = context.knobs.double.slider(label: 'Row Spacing', initialValue: _runSpacing, min: 0, max: 48);
    _containerFluid = context.knobs.boolean(label: 'Fluid Container', initialValue: _containerFluid);
    _demoType = context.knobs.list(
      label: 'Demo Scenario',
      options: [
        'Interactive Demo',
        'E-commerce Cards',
        'Dashboard Layout',
        'Blog Layout',
        'Form Layout',
        'Gallery Grid',
      ],
      initialOption: _demoType,
    );
    _showBreakpoints = context.knobs.boolean(label: 'Show Breakpoint Info', initialValue: _showBreakpoints);
    _cardElevation = context.knobs.double.slider(label: 'Card Elevation', initialValue: _cardElevation, min: 0, max: 8);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        key: const PageStorageKey('grid_demo_scroll'),
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Memoized header
            _HeaderWidget(key: ValueKey('header_$_demoType'), demoType: _demoType),
            const SizedBox(height: 24),

            // Conditional breakpoint info
            if (_showBreakpoints) ...[
              const _BreakpointInfoWidget(key: ValueKey('breakpoint_info')),
              const SizedBox(height: 24),
            ],

            // Optimized interactive demo
            _InteractiveDemoWidget(
              key: ValueKey('interactive_${_spacing}_${_runSpacing}_$_cardElevation'),
              spacing: _spacing,
              runSpacing: _runSpacing,
              containerFluid: _containerFluid,
              customPadding: _customPadding,
              mainAxisAlignment: _mainAxisAlignment,
              crossAxisAlignment: _crossAxisAlignment,
              showGridLines: _showGridLines,
              cardElevation: _cardElevation,
              col1XS: _col1XS,
              col1SM: _col1SM,
              col1MD: _col1MD,
              col1LG: _col1LG,
              col2XS: _col2XS,
              col2SM: _col2SM,
              col2MD: _col2MD,
              col2LG: _col2LG,
              col3XS: _col3XS,
              col3SM: _col3SM,
              col3MD: _col3MD,
              col3LG: _col3LG,
            ),

            const SizedBox(height: 32),

            // Scenario demo widget
            _ScenarioDemoWidget(
              key: ValueKey('scenario_${_demoType}_${_spacing}_$_cardElevation'),
              demoType: _demoType,
              spacing: _spacing,
              runSpacing: _runSpacing,
              cardElevation: _cardElevation,
            ),

            const SizedBox(height: 32),

            // Property showcase widget
            _PropertyShowcaseWidget(
              key: ValueKey('property_${_spacing}_$_cardElevation'),
              spacing: _spacing,
              cardElevation: _cardElevation,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// Separate stateless widgets to prevent unnecessary rebuilds
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key, required this.demoType});

  final String demoType;

  @override
  Widget build(final BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(_getDemoIcon(demoType), size: 32, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('BeGrid System Demo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Current Scenario: $demoType', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  const Text(
                    'Adjust controls in the sidebar to see real-time changes in layout behavior',
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
}

class _BreakpointInfoWidget extends StatelessWidget {
  const _BreakpointInfoWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return _buildBreakpointInfo();
  }
}

class _InteractiveDemoWidget extends StatelessWidget {
  const _InteractiveDemoWidget({
    super.key,
    required this.spacing,
    required this.runSpacing,
    required this.containerFluid,
    required this.customPadding,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.showGridLines,
    required this.cardElevation,
    required this.col1XS,
    required this.col1SM,
    required this.col1MD,
    required this.col1LG,
    required this.col2XS,
    required this.col2SM,
    required this.col2MD,
    required this.col2LG,
    required this.col3XS,
    required this.col3SM,
    required this.col3MD,
    required this.col3LG,
  });

  final double spacing, runSpacing, customPadding, cardElevation;
  final bool containerFluid, showGridLines;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int col1XS, col1SM, col1MD, col1LG;
  final int col2XS, col2SM, col2MD, col2LG;
  final int col3XS, col3SM, col3MD, col3LG;

  @override
  Widget build(final BuildContext context) {
    return _buildInteractiveDemo(
      spacing: spacing,
      runSpacing: runSpacing,
      containerFluid: containerFluid,
      customPadding: customPadding,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      showGridLines: showGridLines,
      cardElevation: cardElevation,
      col1XS: col1XS,
      col1SM: col1SM,
      col1MD: col1MD,
      col1LG: col1LG,
      col2XS: col2XS,
      col2SM: col2SM,
      col2MD: col2MD,
      col2LG: col2LG,
      col3XS: col3XS,
      col3SM: col3SM,
      col3MD: col3MD,
      col3LG: col3LG,
    );
  }
}

class _ScenarioDemoWidget extends StatelessWidget {
  const _ScenarioDemoWidget({
    super.key,
    required this.demoType,
    required this.spacing,
    required this.runSpacing,
    required this.cardElevation,
  });

  final String demoType;
  final double spacing, runSpacing, cardElevation;

  @override
  Widget build(final BuildContext context) {
    return _buildScenarioDemo(demoType, spacing, runSpacing, cardElevation);
  }
}

class _PropertyShowcaseWidget extends StatelessWidget {
  const _PropertyShowcaseWidget({super.key, required this.spacing, required this.cardElevation});

  final double spacing, cardElevation;

  @override
  Widget build(final BuildContext context) {
    return _buildPropertyShowcase(spacing, cardElevation);
  }
}

Widget _buildInteractiveDemo({
  required final double spacing,
  required final double runSpacing,
  required final bool containerFluid,
  required final double customPadding,
  required final MainAxisAlignment mainAxisAlignment,
  required final CrossAxisAlignment crossAxisAlignment,
  required final bool showGridLines,
  required final double cardElevation,
  required final int col1XS,
  required final int col1SM,
  required final int col1MD,
  required final int col1LG,
  required final int col2XS,
  required final int col2SM,
  required final int col2MD,
  required final int col2LG,
  required final int col3XS,
  required final int col3SM,
  required final int col3MD,
  required final int col3LG,
}) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: EdgeInsets.all(customPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Interactive Grid Demo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          BeContainer(
            fluid: containerFluid,
            padding: EdgeInsets.all(customPadding / 2),
            child: Container(
              decoration:
                  showGridLines
                      ? BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      )
                      : null,
              child: BeRow(
                spacing: spacing,
                runSpacing: runSpacing,
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  BeColumn(
                    xs: col1XS,
                    sm: col1SM,
                    md: col1MD,
                    lg: col1LG,
                    child: _buildInteractiveCard(
                      'Column 1',
                      'xs:$col1XS sm:$col1SM md:$col1MD lg:$col1LG',
                      Colors.blue,
                      cardElevation,
                      showGridLines,
                    ),
                  ),
                  BeColumn(
                    xs: col2XS,
                    sm: col2SM,
                    md: col2MD,
                    lg: col2LG,
                    child: _buildInteractiveCard(
                      'Column 2',
                      'xs:$col2XS sm:$col2SM md:$col2MD lg:$col2LG',
                      Colors.green,
                      cardElevation,
                      showGridLines,
                    ),
                  ),
                  BeColumn(
                    xs: col3XS,
                    sm: col3SM,
                    md: col3MD,
                    lg: col3LG,
                    child: _buildInteractiveCard(
                      'Column 3',
                      'xs:$col3XS sm:$col3SM md:$col3MD lg:$col3LG',
                      Colors.orange,
                      cardElevation,
                      showGridLines,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          _buildControlsInfo(spacing, runSpacing, mainAxisAlignment, crossAxisAlignment),
        ],
      ),
    ),
  );
}

Widget _buildScenarioDemo(
  final String demoType,
  final double spacing,
  final double runSpacing,
  final double cardElevation,
) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Realistic Scenario: $demoType', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _getScenarioContent(demoType, spacing, runSpacing, cardElevation),
        ],
      ),
    ),
  );
}

Widget _buildPropertyShowcase(final double spacing, final double cardElevation) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Grid Properties Showcase', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Equal Columns
          _buildPropertyExample('Equal Columns', spacing, [
            BeColumn(xs: 4, child: _buildPropertyCard('1/3', Colors.red.shade200, cardElevation)),
            BeColumn(xs: 4, child: _buildPropertyCard('1/3', Colors.red.shade200, cardElevation)),
            BeColumn(xs: 4, child: _buildPropertyCard('1/3', Colors.red.shade200, cardElevation)),
          ]),

          const SizedBox(height: 16),

          // Responsive Columns
          _buildPropertyExample('Responsive Layout', spacing, [
            BeColumn(
              xs: 12,
              sm: 6,
              md: 4,
              child: _buildPropertyCard('xs:12 sm:6 md:4', Colors.blue.shade200, cardElevation),
            ),
            BeColumn(
              xs: 12,
              sm: 6,
              md: 4,
              child: _buildPropertyCard('xs:12 sm:6 md:4', Colors.blue.shade200, cardElevation),
            ),
            BeColumn(
              xs: 12,
              sm: 12,
              md: 4,
              child: _buildPropertyCard('xs:12 sm:12 md:4', Colors.blue.shade200, cardElevation),
            ),
          ]),

          const SizedBox(height: 16),

          // Mixed Sizes
          _buildPropertyExample('Mixed Column Sizes', spacing, [
            BeColumn(xs: 8, child: _buildPropertyCard('8/12', Colors.green.shade200, cardElevation)),
            BeColumn(xs: 4, child: _buildPropertyCard('4/12', Colors.yellow.shade200, cardElevation)),
          ]),

          const SizedBox(height: 16),

          // Complex Layout
          _buildPropertyExample('Complex Grid', spacing, [
            BeColumn(xs: 2, child: _buildPropertyCard('2', Colors.purple.shade200, cardElevation)),
            BeColumn(xs: 6, child: _buildPropertyCard('6', Colors.indigo.shade200, cardElevation)),
            BeColumn(xs: 2, child: _buildPropertyCard('2', Colors.purple.shade200, cardElevation)),
            BeColumn(xs: 2, child: _buildPropertyCard('2', Colors.purple.shade200, cardElevation)),
          ]),
        ],
      ),
    ),
  );
}

Widget _buildBreakpointInfo() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current Breakpoint:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (final context, final constraints) {
              final width = constraints.maxWidth;
              final breakpoint = calculateBreakpoint(width).name;
              final color = _getBreakpointColor(breakpoint);

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
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
                            '${breakpoint.toUpperCase()} - ${width.toStringAsFixed(0)}px',
                            style: TextStyle(fontWeight: FontWeight.bold, color: color),
                          ),
                          Text(
                            _getBreakpointDescription(breakpoint),
                            style: TextStyle(color: color.withValues(alpha: 0.8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatCard(final String title, final String value, final IconData icon, final Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withValues(alpha: 0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const Spacer(),
            Text(title, style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _buildProductCard(final String name, final String price, final Color color) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withValues(alpha: 0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
          child: Center(child: Icon(Icons.shopping_bag, color: color, size: 32)),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(price, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    ),
  );
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
    case 'xxl':
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

// Helper functions for the new interactive demo

IconData _getDemoIcon(final String demoType) {
  switch (demoType) {
    case 'Interactive Demo':
      return Icons.tune;
    case 'E-commerce Cards':
      return Icons.shopping_cart;
    case 'Dashboard Layout':
      return Icons.dashboard;
    case 'Blog Layout':
      return Icons.article;
    case 'Form Layout':
      return Icons.edit_note;
    case 'Gallery Grid':
      return Icons.photo_library;
    default:
      return Icons.widgets;
  }
}

Widget _buildInteractiveCard(
  final String title,
  final String breakpointInfo,
  final Color color,
  final double elevation,
  final bool showGridLines,
) {
  return Container(
    constraints: const BoxConstraints(minHeight: 120),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      border: Border.all(color: showGridLines ? color : color.withValues(alpha: 0.3), width: showGridLines ? 2 : 1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
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
              breakpointInfo,
              style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12, fontFamily: 'monospace'),
            ),
            if (showGridLines) ...[
              const SizedBox(height: 8),
              Container(
                height: 20,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('Grid Area', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

Widget _buildControlsInfo(
  final double spacing,
  final double runSpacing,
  final MainAxisAlignment mainAxisAlignment,
  final CrossAxisAlignment crossAxisAlignment,
) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Current Settings:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildInfoChip('Spacing', '${spacing.toStringAsFixed(0)}px'),
            _buildInfoChip('Run Spacing', '${runSpacing.toStringAsFixed(0)}px'),
            _buildInfoChip('Main Axis', mainAxisAlignment.toString().split('.').last),
            _buildInfoChip('Cross Axis', crossAxisAlignment.toString().split('.').last),
          ],
        ),
      ],
    ),
  );
}

Widget _buildInfoChip(final String label, final String value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.blue.shade200),
    ),
    child: Text(
      '$label: $value',
      style: TextStyle(fontSize: 12, color: Colors.blue.shade700, fontWeight: FontWeight.w500),
    ),
  );
}

Widget _getScenarioContent(
  final String demoType,
  final double spacing,
  final double runSpacing,
  final double cardElevation,
) {
  switch (demoType) {
    case 'E-commerce Cards':
      return _buildEcommerceScenario(spacing, runSpacing, cardElevation);
    case 'Dashboard Layout':
      return _buildDashboardScenario(spacing, runSpacing, cardElevation);
    case 'Blog Layout':
      return _buildBlogScenario(spacing, runSpacing, cardElevation);
    case 'Form Layout':
      return _buildFormScenario(spacing, runSpacing, cardElevation);
    case 'Gallery Grid':
      return _buildGalleryScenario(spacing, runSpacing, cardElevation);
    default:
      return _buildInteractiveDemoScenario(spacing, runSpacing, cardElevation);
  }
}

Widget _buildEcommerceScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return BeRow(
    spacing: spacing,
    runSpacing: runSpacing,
    children: [
      BeColumn(xs: 12, sm: 6, md: 4, lg: 3, child: _buildProductCard('Wireless Headphones', '\$129.99', Colors.purple)),
      BeColumn(xs: 12, sm: 6, md: 4, lg: 3, child: _buildProductCard('Smart Watch', '\$299.99', Colors.blue)),
      BeColumn(xs: 12, sm: 6, md: 4, lg: 3, child: _buildProductCard('Laptop Stand', '\$49.99', Colors.green)),
      BeColumn(xs: 12, sm: 6, md: 4, lg: 3, child: _buildProductCard('Phone Case', '\$19.99', Colors.orange)),
    ],
  );
}

Widget _buildDashboardScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return Column(
    children: [
      // Stats row
      BeRow(
        spacing: spacing,
        runSpacing: runSpacing,
        children: [
          BeColumn(xs: 12, sm: 6, lg: 3, child: _buildStatCard('Users', '12.5K', Icons.people, Colors.blue)),
          BeColumn(xs: 12, sm: 6, lg: 3, child: _buildStatCard('Revenue', '\$85.2K', Icons.attach_money, Colors.green)),
          BeColumn(xs: 12, sm: 6, lg: 3, child: _buildStatCard('Orders', '1,245', Icons.shopping_cart, Colors.orange)),
          BeColumn(xs: 12, sm: 6, lg: 3, child: _buildStatCard('Growth', '+12.5%', Icons.trending_up, Colors.purple)),
        ],
      ),
      SizedBox(height: runSpacing),
      // Main content
      BeRow(
        spacing: spacing,
        children: [
          BeColumn(xs: 12, lg: 8, child: _buildChartCard('Analytics Overview', cardElevation)),
          BeColumn(xs: 12, lg: 4, child: _buildActivityCard('Recent Activity', cardElevation)),
        ],
      ),
    ],
  );
}

Widget _buildBlogScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return BeRow(
    spacing: spacing,
    children: [
      BeColumn(
        xs: 12,
        lg: 8,
        child: Column(
          children: [
            _buildBlogPostCard('10 Tips for Better UI Design', 'Learn the essential principles...', cardElevation),
            SizedBox(height: runSpacing),
            _buildBlogPostCard('The Future of Web Development', 'Exploring upcoming trends...', cardElevation),
          ],
        ),
      ),
      BeColumn(
        xs: 12,
        lg: 4,
        child: Column(
          children: [
            _buildSidebarCard('About Author', Icons.person, cardElevation),
            SizedBox(height: runSpacing),
            _buildSidebarCard('Categories', Icons.category, cardElevation),
            SizedBox(height: runSpacing),
            _buildSidebarCard('Recent Posts', Icons.history, cardElevation),
          ],
        ),
      ),
    ],
  );
}

Widget _buildFormScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return BeRow(
    spacing: spacing,
    runSpacing: runSpacing,
    children: [
      BeColumn(xs: 12, md: 6, child: _buildFormCard('Personal Info', ['Full Name', 'Email', 'Phone'], cardElevation)),
      BeColumn(xs: 12, md: 6, child: _buildFormCard('Address', ['Street', 'City', 'ZIP Code'], cardElevation)),
      BeColumn(xs: 12, child: _buildFormCard('Additional Info', ['Comments', 'Preferences'], cardElevation)),
    ],
  );
}

Widget _buildGalleryScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return BeRow(
    spacing: spacing,
    runSpacing: runSpacing,
    children: List.generate(
      8,
      (final index) =>
          BeColumn(xs: 12, sm: 6, md: 4, lg: 3, child: _buildGalleryCard('Image ${index + 1}', cardElevation)),
    ),
  );
}

Widget _buildInteractiveDemoScenario(final double spacing, final double runSpacing, final double cardElevation) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Use the interactive controls above to experiment with different grid configurations!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      ),
    ),
  );
}

Widget _buildPropertyExample(final String title, final double spacing, final List<Widget> children) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      BeRow(spacing: spacing, children: children),
    ],
  );
}

Widget _buildPropertyCard(final String text, final Color color, final double elevation) {
  return Container(
    height: 60,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
    child: Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: BorderRadius.circular(6),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    ),
  );
}

// Scenario-specific card builders - using existing functions

Widget _buildChartCard(final String title, final double elevation) {
  return Card(
    elevation: elevation,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
            child: const Center(child: Icon(Icons.bar_chart, size: 48, color: Colors.blue)),
          ),
        ],
      ),
    ),
  );
}

Widget _buildActivityCard(final String title, final double elevation) {
  return Card(
    elevation: elevation,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          ...List.generate(
            3,
            (final index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade300),
                  const SizedBox(width: 12),
                  Expanded(child: Text('Activity item ${index + 1}')),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBlogPostCard(final String title, final String excerpt, final double elevation) {
  return Card(
    elevation: elevation,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(excerpt, style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 12),
          const Text('Read more...', style: TextStyle(color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget _buildSidebarCard(final String title, final IconData icon, final double elevation) {
  return Card(
    elevation: elevation,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.grey[600]),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget _buildFormCard(final String title, final List<String> fields, final double elevation) {
  return Card(
    elevation: elevation,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          ...fields.map(
            (final field) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(field, style: TextStyle(color: Colors.grey[500])),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildGalleryCard(final String title, final double elevation) {
  return Card(
    elevation: elevation,
    child: Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
          child: const Center(child: Icon(Icons.image, size: 32, color: Colors.grey)),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
