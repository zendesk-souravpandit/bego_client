import 'dart:ui';

import 'package:becore/getx.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/text.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart';

class MainDrawerNavigator extends StatefulWidget {
  const MainDrawerNavigator({super.key});

  @override
  State<MainDrawerNavigator> createState() => _MainDrawerNavigatorState();
}

class _MainDrawerNavigatorState extends State<MainDrawerNavigator> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main scrollable content
        HiddenScrollList(
          padding: const EdgeInsets.only(top: 80, bottom: 80),
          children: [
            // Project label
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: BeText.labelMedium(
                'Project #1',
                color: Colors.grey.shade600,
              ),
            ),

            // Menu items
            _MenuItemButton(
              icon: Icons.play_circle_outline,
              label: 'All tasks',
              onTap: () => Get.toNamed('/app/home'),
            ),
            _MenuItemButton(
              icon: Icons.bar_chart,
              label: 'Discover',
              onTap: () => Get.toNamed('/app/discover'),
            ),
            _MenuItemButton(
              icon: Icons.sticky_note_2_outlined,
              label: 'Notes',
              onTap: () => Get.toNamed('/app/cart'),
            ),
            _MenuItemButton(
              icon: Icons.bookmark_outline,
              label: 'Important',
              onTap: () => Get.toNamed('/app/profile'),
            ),
            _MenuItemButton(
              icon: Icons.archive_outlined,
              label: 'Dashboard',
              onTap: () => Get.toNamed('/app/dashboard/sourav-pandit'),
            ),
            _MenuItemButton(
              icon: Icons.notifications_outlined,
              label: 'Reminders',
              onTap: () => Get.toNamed('/app/reminders'),
            ),

            // Documentation section
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BeText.labelMedium(
                    'Documentation',
                    color: Colors.grey.shade800,
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.grey.shade600),
                    onPressed: () {},
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),

            // Documentation items
            _DocumentationItem(
              color: Colors.purple,
              title: 'User Research',
              subtitle: 'Research documentation',
              isExpanded: _expandedIndex == 0,
              onTap: () =>
                  setState(() => _expandedIndex = _expandedIndex == 0 ? -1 : 0),
            ),
            _DocumentationItem(
              color: Colors.blue,
              title: 'User Interview',
              subtitle: 'Interview documentation',
              isExpanded: _expandedIndex == 1,
              onTap: () =>
                  setState(() => _expandedIndex = _expandedIndex == 1 ? -1 : 1),
            ),
            _DocumentationItem(
              color: Colors.green,
              title: 'Product Features',
              subtitle: 'Solutions for products',
              isExpanded: _expandedIndex == 2,
              onTap: () =>
                  setState(() => _expandedIndex = _expandedIndex == 2 ? -1 : 2),
            ),
            _DocumentationItem(
              color: Colors.red,
              title: 'Information Architecture',
              subtitle: 'Notes on this task',
              isExpanded: _expandedIndex == 3,
              onTap: () =>
                  setState(() => _expandedIndex = _expandedIndex == 3 ? -1 : 3),
            ),
            _DocumentationItem(
              color: Colors.cyan,
              title: 'High Fidelity',
              subtitle: 'Note on challenges faced',
              isExpanded: _expandedIndex == 4,
              onTap: () =>
                  setState(() => _expandedIndex = _expandedIndex == 4 ? -1 : 4),
            ),
          ],
        ),

        // Sticky header at top
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: NavigationControlWidget(),
          ),
        ),

        // Sticky footer at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 48,
                    height: 48,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.person, color: Colors.grey.shade600),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BeText(
                        'Mike Cruggs',
                        color: Colors.black87,
                        style: TextStyle(fontSize: 16),
                      ),
                      BeText(
                        'mcruggerr@gmail.com',
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey.shade600,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.grey.shade400, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationControlWidget extends StatefulWidget {
  const NavigationControlWidget({super.key});

  @override
  State<NavigationControlWidget> createState() =>
      _NavigationControlWidgetState();
}

class _NavigationControlWidgetState extends State<NavigationControlWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // final appController = Get.find<BeAppController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isExpanded) BeText.titleSmall('User Experience'),
        InkWell(
          onTap: () {
            // setState(() {
            //   isExpanded = !isExpanded;
            // });
            // appController.updateNavbarPanelWidth = isExpanded
            //     ? const NavbarPanelWidth()
            //     : NavbarPanelWidth.all(80);
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              BeIcons.icon_chevron_left,
              size: 18,
              color: Colors.blue.shade600,
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItemButton extends StatelessWidget {
  const _MenuItemButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey.shade600),
              const SizedBox(width: 16),
              BeText.bodyMedium(label, color: Colors.grey.shade700),
            ],
          ),
        ),
      ),
    );
  }
}

class _DocumentationItem extends StatelessWidget {
  const _DocumentationItem({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
    required this.onTap,
  });

  final Color color;
  final String title;
  final String subtitle;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              // Colored dot
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              const SizedBox(width: 12),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BeText.bodyMedium(title, color: Colors.black87),
                    const SizedBox(height: 2),
                    BeText.bodySmall(subtitle, color: Colors.grey.shade500),
                  ],
                ),
              ),
              // Arrow icon
              Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// -------
class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // Return the child directly, effectively hiding the scrollbar
  }
}
