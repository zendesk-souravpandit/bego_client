import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeGridResponsive', path: 'widget/multichild', type: BeGridResponsive)
Widget useCaseBeGridResponsive(final BuildContext context) {
  // Content Configuration for different breakpoints
  final showXS = context.knobs.boolean(label: 'Show XS Content', initialValue: true);
  final showSM = context.knobs.boolean(label: 'Show SM Content', initialValue: true);
  final showMD = context.knobs.boolean(label: 'Show MD Content', initialValue: true);
  final showLG = context.knobs.boolean(label: 'Show LG Content', initialValue: true);
  final showXL = context.knobs.boolean(label: 'Show XL Content', initialValue: true);
  final showXL2 = context.knobs.boolean(label: 'Show XL2 Content', initialValue: true);

  // Widget Type for each breakpoint
  final xsWidget = context.knobs.list(
    label: 'XS Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  final smWidget = context.knobs.list(
    label: 'SM Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  final mdWidget = context.knobs.list(
    label: 'MD Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  final lgWidget = context.knobs.list(
    label: 'LG Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  final xlWidget = context.knobs.list(
    label: 'XL Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  final xl2Widget = context.knobs.list(
    label: 'XL2 Widget Type',
    options: ['Text Card', 'Icon Card', 'Image Card', 'Button Card', 'Stats Card'],
  );

  // Appearance
  final cardElevation = context.knobs.double.slider(label: 'Card Elevation', initialValue: 2, min: 0, max: 8);
  final showBreakpointInfo = context.knobs.boolean(label: 'Show Breakpoint Info', initialValue: true);

  // Demo Type
  final demoType = context.knobs.list(
    label: 'Demo Type',
    options: [
      'Interactive Responsive',
      'Navigation Menu',
      'Content Cards',
      'Dashboard Layout',
      'Media Gallery',
      'Feature Showcase',
      'Comparison Demo',
    ],
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _buildResponsiveHeader(demoType),
          const SizedBox(height: 24),

          // Breakpoint Info
          if (showBreakpointInfo) ...[_buildCurrentBreakpointInfo(), const SizedBox(height: 24)],

          // Main Demo
          _buildResponsiveDemo(
            demoType: demoType,
            showXS: showXS,
            showSM: showSM,
            showMD: showMD,
            showLG: showLG,
            showXL: showXL,
            showXL2: showXL2,
            xsWidget: xsWidget,
            smWidget: smWidget,
            mdWidget: mdWidget,
            lgWidget: lgWidget,
            xlWidget: xlWidget,
            xl2Widget: xl2Widget,
            cardElevation: cardElevation,
          ),

          const SizedBox(height: 32),

          // Configuration Display
          _buildConfigurationDisplay(
            showXS: showXS,
            showSM: showSM,
            showMD: showMD,
            showLG: showLG,
            showXL: showXL,
            showXL2: showXL2,
            xsWidget: xsWidget,
            smWidget: smWidget,
            mdWidget: mdWidget,
            lgWidget: lgWidget,
            xlWidget: xlWidget,
            xl2Widget: xl2Widget,
          ),

          const SizedBox(height: 32),

          // Property Examples
          _buildResponsivePropertyExamples(cardElevation),
        ],
      ),
    ),
  );
}

Widget _buildResponsiveHeader(final String demoType) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(_getResponsiveDemoIcon(demoType), size: 32, color: Colors.deepPurple),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('BeGridResponsive Widget Demo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Demo: $demoType', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                const SizedBox(height: 8),
                const Text(
                  'BeGridResponsive displays different widgets based on screen breakpoints, enabling truly responsive UI.',
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

Widget _buildCurrentBreakpointInfo() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current Breakpoint & Active Widget', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (final context, final constraints) {
              final width = constraints.maxWidth;
              final breakpoint = BeGridBreakpoints.getBreakpoint(width);
              final color = _getBreakpointColor(breakpoint.name);

              return Column(
                children: [
                  Container(
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
                                'Active: ${breakpoint.name.toUpperCase()} - ${width.toStringAsFixed(0)}px',
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
                  ),
                  const SizedBox(height: 12),
                  _buildBreakpointReference(),
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _buildBreakpointReference() {
  final breakpoints = [
    ('xs', '< 640px', Colors.red),
    ('sm', '≥ 640px', Colors.orange),
    ('md', '≥ 768px', Colors.blue),
    ('lg', '≥ 1024px', Colors.green),
    ('xl', '≥ 1280px', Colors.purple),
    ('xl2', '≥ 1536px', Colors.indigo),
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('All Breakpoints:', style: TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: breakpoints.map((final bp) => _buildBreakpointChip(bp.$1, bp.$2, bp.$3)).toList(),
      ),
    ],
  );
}

Widget _buildBreakpointChip(final String name, final String size, final Color color) {
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

Widget _buildResponsiveDemo({
  required final String demoType,
  required final bool showXS,
  required final bool showSM,
  required final bool showMD,
  required final bool showLG,
  required final bool showXL,
  required final bool showXL2,
  required final String xsWidget,
  required final String smWidget,
  required final String mdWidget,
  required final String lgWidget,
  required final String xlWidget,
  required final String xl2Widget,
  required final double cardElevation,
}) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BeGridResponsive - $demoType', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: _generateResponsiveContent(
              demoType,
              showXS,
              showSM,
              showMD,
              showLG,
              showXL,
              showXL2,
              xsWidget,
              smWidget,
              mdWidget,
              lgWidget,
              xlWidget,
              xl2Widget,
              cardElevation,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _generateResponsiveContent(
  final String demoType,
  final bool showXS,
  final bool showSM,
  final bool showMD,
  final bool showLG,
  final bool showXL,
  final bool showXL2,
  final String xsWidget,
  final String smWidget,
  final String mdWidget,
  final String lgWidget,
  final String xlWidget,
  final String xl2Widget,
  final double cardElevation,
) {
  switch (demoType) {
    case 'Interactive Responsive':
      return _buildInteractiveResponsiveContent(
        showXS,
        showSM,
        showMD,
        showLG,
        showXL,
        showXL2,
        xsWidget,
        smWidget,
        mdWidget,
        lgWidget,
        xlWidget,
        xl2Widget,
        cardElevation,
      );

    case 'Navigation Menu':
      return _buildNavigationMenuContent(cardElevation);

    case 'Content Cards':
      return _buildContentCardsContent(cardElevation);

    case 'Dashboard Layout':
      return _buildDashboardLayoutContent(cardElevation);

    case 'Media Gallery':
      return _buildMediaGalleryContent(cardElevation);

    case 'Feature Showcase':
      return _buildFeatureShowcaseContent(cardElevation);

    case 'Comparison Demo':
      return _buildComparisonDemoContent(cardElevation);

    default:
      return _buildInteractiveResponsiveContent(
        showXS,
        showSM,
        showMD,
        showLG,
        showXL,
        showXL2,
        xsWidget,
        smWidget,
        mdWidget,
        lgWidget,
        xlWidget,
        xl2Widget,
        cardElevation,
      );
  }
}

Widget _buildInteractiveResponsiveContent(
  final bool showXS,
  final bool showSM,
  final bool showMD,
  final bool showLG,
  final bool showXL,
  final bool showXL2,
  final String xsWidget,
  final String smWidget,
  final String mdWidget,
  final String lgWidget,
  final String xlWidget,
  final String xl2Widget,
  final double cardElevation,
) {
  return BeGridResponsive(
    xs: showXS ? _buildWidgetByType(xsWidget, 'xs', Colors.red, cardElevation) : null,
    sm: showSM ? _buildWidgetByType(smWidget, 'sm', Colors.orange, cardElevation) : null,
    md: showMD ? _buildWidgetByType(mdWidget, 'md', Colors.blue, cardElevation) : null,
    lg: showLG ? _buildWidgetByType(lgWidget, 'lg', Colors.green, cardElevation) : null,
    xl: showXL ? _buildWidgetByType(xlWidget, 'xl', Colors.purple, cardElevation) : null,
    xl2: showXL2 ? _buildWidgetByType(xl2Widget, 'xl2', Colors.indigo, cardElevation) : null,
    fallback: _buildFallbackWidget(cardElevation),
  );
}

Widget _buildNavigationMenuContent(final double cardElevation) {
  return BeGridResponsive(
    xs: _buildMobileNav(cardElevation),
    sm: _buildTabletNav(cardElevation),
    md: _buildTabletNav(cardElevation),
    lg: _buildDesktopNav(cardElevation),
    xl: _buildDesktopNav(cardElevation),
    xl2: _buildDesktopNav(cardElevation),
  );
}

Widget _buildContentCardsContent(final double cardElevation) {
  return BeGridResponsive(
    xs: _buildSingleColumnCards(cardElevation),
    sm: _buildTwoColumnCards(cardElevation),
    md: _buildThreeColumnCards(cardElevation),
    lg: _buildFourColumnCards(cardElevation),
    xl: _buildFiveColumnCards(cardElevation),
    xl2: _buildSixColumnCards(cardElevation),
  );
}

Widget _buildDashboardLayoutContent(final double cardElevation) {
  return BeGridResponsive(
    xs: _buildMobileDashboard(cardElevation),
    sm: _buildTabletDashboard(cardElevation),
    md: _buildTabletDashboard(cardElevation),
    lg: _buildDesktopDashboard(cardElevation),
    xl: _buildDesktopDashboard(cardElevation),
    xl2: _buildDesktopDashboard(cardElevation),
  );
}

Widget _buildMediaGalleryContent(final double cardElevation) {
  return BeGridResponsive(
    xs: _buildMobileGallery(cardElevation),
    sm: _buildTabletGallery(cardElevation),
    md: _buildTabletGallery(cardElevation),
    lg: _buildDesktopGallery(cardElevation),
    xl: _buildDesktopGallery(cardElevation),
    xl2: _buildDesktopGallery(cardElevation),
  );
}

Widget _buildFeatureShowcaseContent(final double cardElevation) {
  return BeGridResponsive(
    xs: _buildMobileFeatures(cardElevation),
    sm: _buildTabletFeatures(cardElevation),
    md: _buildTabletFeatures(cardElevation),
    lg: _buildDesktopFeatures(cardElevation),
    xl: _buildDesktopFeatures(cardElevation),
    xl2: _buildDesktopFeatures(cardElevation),
  );
}

Widget _buildComparisonDemoContent(final double cardElevation) {
  return Column(
    children: [
      const Text('Multiple BeGridResponsive Widgets Comparison', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      BeRow(
        spacing: 16,
        children: [
          BeColumn(
            xs: 12,
            md: 4,
            child: Column(
              children: [
                const Text('Text-based Responsive', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                BeGridResponsive(
                  xs: _buildTextWidget('Mobile Text', Colors.red, cardElevation),
                  md: _buildTextWidget('Desktop Text', Colors.blue, cardElevation),
                ),
              ],
            ),
          ),
          BeColumn(
            xs: 12,
            md: 4,
            child: Column(
              children: [
                const Text('Icon-based Responsive', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                BeGridResponsive(
                  xs: _buildIconWidget('Mobile', Icons.phone_android, Colors.orange, cardElevation),
                  md: _buildIconWidget('Desktop', Icons.desktop_windows, Colors.green, cardElevation),
                ),
              ],
            ),
          ),
          BeColumn(
            xs: 12,
            md: 4,
            child: Column(
              children: [
                const Text('Layout-based Responsive', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                BeGridResponsive(xs: _buildCompactLayout(cardElevation), md: _buildExpandedLayout(cardElevation)),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildConfigurationDisplay({
  required final bool showXS,
  required final bool showSM,
  required final bool showMD,
  required final bool showLG,
  required final bool showXL,
  required final bool showXL2,
  required final String xsWidget,
  required final String smWidget,
  required final String mdWidget,
  required final String lgWidget,
  required final String xlWidget,
  required final String xl2Widget,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current BeGridResponsive Configuration',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          _buildConfigSection('Widget Visibility', [
            _buildConfigChip('XS', showXS ? 'Enabled' : 'Disabled', showXS ? Colors.red : Colors.grey),
            _buildConfigChip('SM', showSM ? 'Enabled' : 'Disabled', showSM ? Colors.orange : Colors.grey),
            _buildConfigChip('MD', showMD ? 'Enabled' : 'Disabled', showMD ? Colors.blue : Colors.grey),
            _buildConfigChip('LG', showLG ? 'Enabled' : 'Disabled', showLG ? Colors.green : Colors.grey),
            _buildConfigChip('XL', showXL ? 'Enabled' : 'Disabled', showXL ? Colors.purple : Colors.grey),
            _buildConfigChip('XL2', showXL2 ? 'Enabled' : 'Disabled', showXL2 ? Colors.indigo : Colors.grey),
          ]),

          const SizedBox(height: 16),

          _buildConfigSection('Widget Types', [
            _buildConfigChip('XS', xsWidget, Colors.red),
            _buildConfigChip('SM', smWidget, Colors.orange),
            _buildConfigChip('MD', mdWidget, Colors.blue),
            _buildConfigChip('LG', lgWidget, Colors.green),
            _buildConfigChip('XL', xlWidget, Colors.purple),
            _buildConfigChip('XL2', xl2Widget, Colors.indigo),
          ]),
        ],
      ),
    ),
  );
}

Widget _buildConfigSection(final String title, final List<Widget> chips) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 4, children: chips),
    ],
  );
}

Widget _buildConfigChip(final String label, final String value, final Color color) {
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

Widget _buildResponsivePropertyExamples(final double cardElevation) {
  return Card(
    elevation: cardElevation,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeGridResponsive Property Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Basic Responsive Example
          _buildPropertyExample(
            'Basic Responsive Widget',
            'Different content for mobile vs desktop',
            BeGridResponsive(
              xs: _buildExampleCard('Mobile View', 'Optimized for touch', Colors.red.shade200, Icons.phone_android),
              lg: _buildExampleCard(
                'Desktop View',
                'Optimized for mouse & keyboard',
                Colors.green.shade200,
                Icons.desktop_windows,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Fallback Example
          _buildPropertyExample(
            'Fallback Widget',
            'Shows when no breakpoint matches',
            BeGridResponsive(
              fallback: _buildExampleCard(
                'Fallback Content',
                'Default when nothing matches',
                Colors.grey.shade300,
                Icons.help_outline,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Progressive Enhancement
          _buildPropertyExample(
            'Progressive Enhancement',
            'Each breakpoint builds on the previous',
            BeGridResponsive(
              xs: _buildExampleCard('Base', 'XS: Basic content', Colors.red.shade200, Icons.smartphone),
              sm: _buildExampleCard('Enhanced', 'SM: More features', Colors.orange.shade200, Icons.tablet),
              lg: _buildExampleCard('Full Featured', 'LG: All features', Colors.green.shade200, Icons.computer),
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

// Widget builders by type
Widget _buildWidgetByType(final String type, final String breakpoint, final Color color, final double elevation) {
  switch (type) {
    case 'Text Card':
      return _buildTextWidget('$breakpoint Widget', color, elevation);
    case 'Icon Card':
      return _buildIconWidget(breakpoint.toUpperCase(), _getIconForBreakpoint(breakpoint), color, elevation);
    case 'Image Card':
      return _buildImageWidget('$breakpoint Image', color, elevation);
    case 'Button Card':
      return _buildButtonWidget('$breakpoint Action', color, elevation);
    case 'Stats Card':
      return _buildStatsWidget('$breakpoint Stats', color, elevation);
    default:
      return _buildTextWidget('$breakpoint Widget', color, elevation);
  }
}

Widget _buildTextWidget(final String title, final Color color, final double elevation) {
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
          Icon(Icons.text_fields, color: color, size: 32),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Text-based content', style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildIconWidget(final String title, final IconData icon, final Color color, final double elevation) {
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
          Icon(icon, color: color, size: 48),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget _buildImageWidget(final String title, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.1),
        border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 255 * 0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Center(child: Icon(Icons.image, color: color, size: 32)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}

Widget _buildButtonWidget(final String title, final Color color, final double elevation) {
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
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: color),
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 8),
          Text('Interactive button', style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 12)),
        ],
      ),
    ),
  );
}

Widget _buildStatsWidget(final String title, final Color color, final double elevation) {
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
          Text('1,234', style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Statistics widget', style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 10)),
        ],
      ),
    ),
  );
}

Widget _buildFallbackWidget(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Column(
        children: [
          Icon(Icons.help_outline, color: Colors.grey, size: 32),
          SizedBox(height: 8),
          Text('Fallback Widget', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Shown when no breakpoint matches', style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
  );
}

// Specialized layout builders
Widget _buildMobileNav(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      color: Colors.blue.shade600,
      child: const Row(
        children: [
          Icon(Icons.menu, color: Colors.white),
          SizedBox(width: 12),
          Text('Mobile Menu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget _buildTabletNav(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      color: Colors.blue.shade600,
      child: const Row(
        children: [
          Text('Logo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Spacer(),
          Text('Home', style: TextStyle(color: Colors.white)),
          SizedBox(width: 16),
          Text('About', style: TextStyle(color: Colors.white)),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    ),
  );
}

Widget _buildDesktopNav(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      color: Colors.blue.shade600,
      child: const Row(
        children: [
          Text('Logo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Spacer(),
          Text('Home', style: TextStyle(color: Colors.white)),
          SizedBox(width: 20),
          Text('Products', style: TextStyle(color: Colors.white)),
          SizedBox(width: 20),
          Text('About', style: TextStyle(color: Colors.white)),
          SizedBox(width: 20),
          Text('Contact', style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}

Widget _buildSingleColumnCards(final double elevation) {
  return Column(
    children: List.generate(
      3,
      (final i) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: _buildContentCard('Card ${i + 1}', Colors.blue, elevation),
      ),
    ),
  );
}

Widget _buildTwoColumnCards(final double elevation) {
  return BeRow(
    spacing: 8,
    runSpacing: 8,
    children: List.generate(
      4,
      (final i) => BeColumn(xs: 6, child: _buildContentCard('Card ${i + 1}', Colors.green, elevation)),
    ),
  );
}

Widget _buildThreeColumnCards(final double elevation) {
  return BeRow(
    spacing: 8,
    runSpacing: 8,
    children: List.generate(
      6,
      (final i) => BeColumn(xs: 4, child: _buildContentCard('Card ${i + 1}', Colors.orange, elevation)),
    ),
  );
}

Widget _buildFourColumnCards(final double elevation) {
  return BeRow(
    spacing: 8,
    runSpacing: 8,
    children: List.generate(
      8,
      (final i) => BeColumn(xs: 3, child: _buildContentCard('Card ${i + 1}', Colors.purple, elevation)),
    ),
  );
}

Widget _buildFiveColumnCards(final double elevation) {
  return BeRow(
    spacing: 6,
    runSpacing: 6,
    children: List.generate(
      10,
      (final i) => BeColumn(xs: 2, child: _buildContentCard('${i + 1}', Colors.teal, elevation)),
    ),
  );
}

Widget _buildSixColumnCards(final double elevation) {
  return BeRow(
    spacing: 4,
    runSpacing: 4,
    children: List.generate(
      12,
      (final i) => BeColumn(xs: 2, child: _buildContentCard('${i + 1}', Colors.indigo, elevation)),
    ),
  );
}

Widget _buildMobileDashboard(final double elevation) {
  return Column(
    children: [
      _buildContentCard('Mobile Stats', Colors.red, elevation),
      const SizedBox(height: 8),
      _buildContentCard('Mobile Chart', Colors.red, elevation),
    ],
  );
}

Widget _buildTabletDashboard(final double elevation) {
  return BeRow(
    spacing: 12,
    children: [
      BeColumn(xs: 8, child: _buildContentCard('Tablet Chart', Colors.orange, elevation)),
      BeColumn(xs: 4, child: _buildContentCard('Tablet Stats', Colors.orange, elevation)),
    ],
  );
}

Widget _buildDesktopDashboard(final double elevation) {
  return BeRow(
    spacing: 16,
    children: [
      BeColumn(xs: 3, child: _buildContentCard('Sidebar', Colors.green, elevation)),
      BeColumn(xs: 6, child: _buildContentCard('Main Chart', Colors.green, elevation)),
      BeColumn(xs: 3, child: _buildContentCard('Stats Panel', Colors.green, elevation)),
    ],
  );
}

Widget _buildMobileGallery(final double elevation) {
  return BeRow(
    spacing: 4,
    runSpacing: 4,
    children: List.generate(
      4,
      (final i) => BeColumn(xs: 6, child: _buildImageWidget('Image ${i + 1}', Colors.blue, elevation)),
    ),
  );
}

Widget _buildTabletGallery(final double elevation) {
  return BeRow(
    spacing: 8,
    runSpacing: 8,
    children: List.generate(
      9,
      (final i) => BeColumn(xs: 4, child: _buildImageWidget('Image ${i + 1}', Colors.orange, elevation)),
    ),
  );
}

Widget _buildDesktopGallery(final double elevation) {
  return BeRow(
    spacing: 12,
    runSpacing: 12,
    children: List.generate(
      16,
      (final i) => BeColumn(xs: 3, child: _buildImageWidget('Image ${i + 1}', Colors.green, elevation)),
    ),
  );
}

Widget _buildMobileFeatures(final double elevation) {
  return Column(
    children: List.generate(
      3,
      (final i) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: _buildFeatureCard('Feature ${i + 1}', 'Mobile view', Icons.star, Colors.purple, elevation),
      ),
    ),
  );
}

Widget _buildTabletFeatures(final double elevation) {
  return BeRow(
    spacing: 12,
    children: List.generate(
      2,
      (final i) => BeColumn(
        xs: 6,
        child: _buildFeatureCard('Feature ${i + 1}', 'Tablet view', Icons.star, Colors.teal, elevation),
      ),
    ),
  );
}

Widget _buildDesktopFeatures(final double elevation) {
  return BeRow(
    spacing: 16,
    children: List.generate(
      3,
      (final i) => BeColumn(
        xs: 4,
        child: _buildFeatureCard('Feature ${i + 1}', 'Desktop view', Icons.star, Colors.indigo, elevation),
      ),
    ),
  );
}

Widget _buildContentCard(final String title, final Color color, final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.1),
        border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
      ),
      child: Center(child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12))),
    ),
  );
}

Widget _buildFeatureCard(
  final String title,
  final String subtitle,
  final IconData icon,
  final Color color,
  final double elevation,
) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 255 * 0.1),
        border: Border.all(color: color.withValues(alpha: 255 * 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: color.withValues(alpha: 255 * 0.7), fontSize: 10)),
        ],
      ),
    ),
  );
}

Widget _buildCompactLayout(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red.shade100,
        border: Border.all(color: Colors.red.shade300),
      ),
      child: const Column(
        children: [
          Icon(Icons.compress, color: Colors.red, size: 24),
          SizedBox(height: 8),
          Text('Compact Layout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget _buildExpandedLayout(final double elevation) {
  return Card(
    elevation: elevation,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green.shade100,
        border: Border.all(color: Colors.green.shade300),
      ),
      child: const Row(
        children: [
          Icon(Icons.expand, color: Colors.green, size: 32),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Expanded Layout', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('More space, more content', style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildExampleCard(final String title, final String subtitle, final Color color, final IconData icon) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
    child: Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
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

IconData _getIconForBreakpoint(final String breakpoint) {
  switch (breakpoint) {
    case 'xs':
      return Icons.phone_android;
    case 'sm':
      return Icons.tablet_android;
    case 'md':
      return Icons.tablet;
    case 'lg':
      return Icons.laptop;
    case 'xl':
      return Icons.desktop_windows;
    case 'xl2':
      return Icons.tv;
    default:
      return Icons.devices;
  }
}

IconData _getResponsiveDemoIcon(final String demoType) {
  switch (demoType) {
    case 'Interactive Responsive':
      return Icons.tune;
    case 'Navigation Menu':
      return Icons.menu;
    case 'Content Cards':
      return Icons.view_module;
    case 'Dashboard Layout':
      return Icons.dashboard;
    case 'Media Gallery':
      return Icons.photo_library;
    case 'Feature Showcase':
      return Icons.star;
    case 'Comparison Demo':
      return Icons.compare;
    default:
      return Icons.devices;
  }
}
