import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeResponsiveVisibility', path: 'widget/utils', type: BeResponsiveVisibility)
Widget useCaseBeResponsiveVisibility(final BuildContext context) {
  // Knobs for controlling which breakpoints to show content for
  final showOnXs = context.knobs.boolean(label: 'Show on XS (≤576px)', initialValue: true);
  final showOnSm = context.knobs.boolean(label: 'Show on SM (≤768px)', initialValue: true);
  final showOnMd = context.knobs.boolean(label: 'Show on MD (≤992px)', initialValue: true);
  final showOnLg = context.knobs.boolean(label: 'Show on LG (≤1200px)', initialValue: true);
  final showOnXl = context.knobs.boolean(label: 'Show on XL (≤1400px)', initialValue: true);
  final showOnXl2 = context.knobs.boolean(label: 'Show on XL2 (>1400px)', initialValue: true);

  final visibilityMap = {
    BeBreakpoint.xs: showOnXs,
    BeBreakpoint.sm: showOnSm,
    BeBreakpoint.md: showOnMd,
    BeBreakpoint.lg: showOnLg,
    BeBreakpoint.xl: showOnXl,
    BeBreakpoint.xl2: showOnXl2,
  };

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeResponsiveVisibility Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            'Current Breakpoint: ${BeTheme.of(context).breakpoint.name.toUpperCase()}',
            style: TextStyle(fontSize: 16, color: Colors.blue.shade700, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 32),

          const Text('Basic Responsive Visibility:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Content shows/hides based on screen size', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          // Example 1: Basic responsive widget
          BeResponsiveVisibility(
            visibleFor: visibilityMap,
            child: Container(
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
                  Row(
                    children: [
                      Icon(Icons.visibility, color: Colors.blue.shade600),
                      const SizedBox(width: 8),
                      const Text('Responsive Content', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('This content respects the visibility settings in the knobs above.'),
                  const SizedBox(height: 8),
                  Text(
                    'Visible on: ${_getVisibleBreakpoints(visibilityMap)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ).resolve(context),

          const SizedBox(height: 32),
          const Text('Mobile-Only Content:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Only visible on mobile devices (XS, SM)', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          BeResponsiveVisibility(
            visibleFor: const {
              BeBreakpoint.xs: true,
              BeBreakpoint.sm: true,
              BeBreakpoint.md: false,
              BeBreakpoint.lg: false,
              BeBreakpoint.xl: false,
              BeBreakpoint.xl2: false,
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone_android, color: Colors.green.shade600),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('📱 Mobile-Only Feature', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          'This appears only on mobile screens (XS, SM breakpoints)',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).resolve(context),

          const SizedBox(height: 32),
          const Text('Desktop-Only Content:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Only visible on desktop/large screens (LG, XL, XL2)', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          BeResponsiveVisibility(
            visibleFor: const {
              BeBreakpoint.xs: false,
              BeBreakpoint.sm: false,
              BeBreakpoint.md: false,
              BeBreakpoint.lg: true,
              BeBreakpoint.xl: true,
              BeBreakpoint.xl2: true,
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.desktop_mac, color: Colors.purple.shade600),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('🖥️ Desktop-Only Feature', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          'Advanced features available on larger screens (LG, XL, XL2 breakpoints)',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).resolve(context),

          const SizedBox(height: 32),
          const Text('Tablet-Only Content:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Only visible on tablet screens (MD)', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          BeResponsiveVisibility(
            visibleFor: const {
              BeBreakpoint.xs: false,
              BeBreakpoint.sm: false,
              BeBreakpoint.md: true,
              BeBreakpoint.lg: false,
              BeBreakpoint.xl: false,
              BeBreakpoint.xl2: false,
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.tablet_mac, color: Colors.orange.shade600),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('📱 Tablet-Only Feature', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Optimized for tablet screens (MD breakpoint)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).resolve(context),

          const SizedBox(height: 32),
          const Text('Complex Responsive Layout:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Different content for different screen sizes', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          Row(
            children: [
              // Mobile navigation
              Expanded(
                child: BeResponsiveVisibility(
                  visibleFor: const {
                    BeBreakpoint.xs: true,
                    BeBreakpoint.sm: true,
                    BeBreakpoint.md: false,
                    BeBreakpoint.lg: false,
                    BeBreakpoint.xl: false,
                    BeBreakpoint.xl2: false,
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.menu, color: Colors.red.shade600, size: 32),
                        const SizedBox(height: 8),
                        const Text(
                          'Hamburger Menu',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Mobile Navigation', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ).resolve(context),
              ),

              // Tablet navigation
              Expanded(
                child: BeResponsiveVisibility(
                  visibleFor: const {
                    BeBreakpoint.xs: false,
                    BeBreakpoint.sm: false,
                    BeBreakpoint.md: true,
                    BeBreakpoint.lg: false,
                    BeBreakpoint.xl: false,
                    BeBreakpoint.xl2: false,
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.teal.shade200),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.tab, color: Colors.teal.shade600, size: 32),
                        const SizedBox(height: 8),
                        const Text(
                          'Tab Navigation',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Tablet Layout', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ).resolve(context),
              ),

              // Desktop navigation
              Expanded(
                child: BeResponsiveVisibility(
                  visibleFor: const {
                    BeBreakpoint.xs: false,
                    BeBreakpoint.sm: false,
                    BeBreakpoint.md: false,
                    BeBreakpoint.lg: true,
                    BeBreakpoint.xl: true,
                    BeBreakpoint.xl2: true,
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo.shade200),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.view_list, color: Colors.indigo.shade600, size: 32),
                        const SizedBox(height: 8),
                        const Text(
                          'Full Navigation',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Desktop Layout', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ).resolve(context),
              ),
            ],
          ),

          const SizedBox(height: 32),
          const Text('Always Visible Content:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Content that shows on all breakpoints', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          BeResponsiveVisibility(
            visibleFor: null, // null means visible for all breakpoints
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.all_inclusive, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Always Visible', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('This content is visible on all screen sizes and breakpoints.'),
                ],
              ),
            ),
          ).resolve(context),

          const SizedBox(height: 32),
          const Text(
            'Resize your browser or use device emulation to see how content shows/hides at different breakpoints',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

String _getVisibleBreakpoints(final Map<BeBreakpoint, bool> visibilityMap) {
  final visibleBreakpoints = visibilityMap.entries
      .where((final entry) => entry.value)
      .map((final entry) => entry.key.name.toUpperCase())
      .toList();

  if (visibleBreakpoints.isEmpty) {
    return 'None';
  }

  return visibleBreakpoints.join(', ');
}
