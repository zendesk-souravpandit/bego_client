import 'package:beui/layout.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeResponsiveWidget', path: 'widget/layout', type: BeResponsiveWidget)
Widget useCaseBeResponsiveWidget(final BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeResponsiveWidget Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          const Text(
            'Current breakpoint responsive widget:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          BeResponsiveWidget(
            resolver: (final breakpoint) {
              switch (breakpoint) {
                case BeBreakpoint.xs:
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.phone_android, size: 32, color: Colors.red),
                        const SizedBox(height: 8),
                        Text(
                          'Extra Small (XS)',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700),
                        ),
                        const Text('Mobile Portrait', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                case BeBreakpoint.sm:
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.phone_android, size: 32, color: Colors.orange),
                        const SizedBox(height: 8),
                        Text(
                          'Small (SM)',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade700),
                        ),
                        const Text('Mobile Landscape', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                case BeBreakpoint.md:
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.tablet_android, size: 32, color: Colors.blue),
                        const SizedBox(height: 8),
                        Text('Medium (MD)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                        const Text('Tablet', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                case BeBreakpoint.lg:
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.laptop, size: 32, color: Colors.green),
                        const SizedBox(height: 8),
                        Text('Large (LG)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700)),
                        const Text('Laptop', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                case BeBreakpoint.xl:
                case BeBreakpoint.xl2:
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.purple),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.desktop_windows, size: 32, color: Colors.purple),
                        const SizedBox(height: 8),
                        Text(
                          'Extra Large (XL)',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade700),
                        ),
                        const Text('Desktop', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
              }
            },
          ),

          const SizedBox(height: 24),
          const Text('Responsive Navigation Example:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeResponsiveWidget(
            resolver: (final breakpoint) {
              if (breakpoint == BeBreakpoint.xs || breakpoint == BeBreakpoint.sm) {
                // Mobile navigation
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(Icons.home, 'Home'),
                      _buildNavItem(Icons.search, 'Search'),
                      _buildNavItem(Icons.favorite, 'Favorites'),
                      _buildNavItem(Icons.person, 'Profile'),
                    ],
                  ),
                );
              } else {
                // Desktop navigation
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Text(
                        'MyApp',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      _buildNavLink('Home'),
                      const SizedBox(width: 24),
                      _buildNavLink('About'),
                      const SizedBox(width: 24),
                      _buildNavLink('Services'),
                      const SizedBox(width: 24),
                      _buildNavLink('Contact'),
                      const SizedBox(width: 24),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: Text('Sign In', style: TextStyle(color: Colors.blue.shade600)),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          const SizedBox(height: 24),
          const Text('Responsive Content Layout:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeResponsiveWidget(
            resolver: (final breakpoint) {
              if (breakpoint == BeBreakpoint.xs || breakpoint == BeBreakpoint.sm) {
                // Mobile: Single column
                return Column(
                  children: [
                    _buildContentCard('Main Content', Colors.blue, Icons.article),
                    const SizedBox(height: 12),
                    _buildContentCard('Sidebar 1', Colors.green, Icons.menu),
                    const SizedBox(height: 12),
                    _buildContentCard('Sidebar 2', Colors.orange, Icons.widgets),
                  ],
                );
              } else if (breakpoint == BeBreakpoint.md) {
                // Tablet: Two columns
                return Column(
                  children: [
                    _buildContentCard('Main Content', Colors.blue, Icons.article),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildContentCard('Sidebar 1', Colors.green, Icons.menu)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildContentCard('Sidebar 2', Colors.orange, Icons.widgets)),
                      ],
                    ),
                  ],
                );
              } else {
                // Desktop: Three columns
                return Row(
                  children: [
                    Expanded(flex: 2, child: _buildContentCard('Main Content', Colors.blue, Icons.article)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildContentCard('Sidebar 1', Colors.green, Icons.menu)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildContentCard('Sidebar 2', Colors.orange, Icons.widgets)),
                  ],
                );
              }
            },
          ),

          const SizedBox(height: 24),
          const Text(
            'Resize your window to see the responsive behavior',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget _buildNavItem(final IconData icon, final String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: Colors.white, size: 24),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    ],
  );
}

Widget _buildNavLink(final String title) {
  return Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500));
}

Widget _buildContentCard(final String title, final Color color, final IconData icon) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1 * 255),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color.withValues(alpha: 0.3 * 255)),
    ),
    child: Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color.withValues(alpha: 0.8 * 255))),
        const SizedBox(height: 4),
        Text(
          'This is responsive content that adapts to different screen sizes.',
          style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.6 * 255)),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
