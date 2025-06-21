import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeNavBarPanel extends GetView<BeAppController> {
  const BeNavBarPanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    return NavBarStateWidget<void>(controller: controller);
  }
}

class NavBarStateWidget<T> extends StateWidget<T> {
  const NavBarStateWidget({super.key, required this.controller});
  final BeAppController controller;
  @override
  Widget build(final BuildContext context) {
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    return Obx(
      () => Container(
        width: controller.navbarPanelWidth.value.getWidth(breakpoint),
        height: heightInfinity,
        decoration: BoxDecoration(
          color: BeColors.gray100,
          border: Border(right: BorderSide(color: BeTheme.of(context).colors.disabled, width: 0.5)),
        ),
        child: RouteListPage(),
      ),
    );
  }
}

class RouteListPage extends StatelessWidget {
  RouteListPage({super.key});

  final List<_RouteItem> routeItems = [
    _RouteItem(label: 'Dashboard', route: '/app'),
    _RouteItem(label: 'Profile', route: '/app/profile'),
    _RouteItem(label: 'Products', route: '/app/products'),
    _RouteItem(label: 'Products1', route: '/app/products/123'),
    _RouteItem(label: 'Settings', route: '/settings'),
    _RouteItem(label: 'Login', route: '/login'),
  ];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route List')),
      body: ListView.builder(
        itemCount: routeItems.length,
        itemBuilder: (final context, final index) {
          final item = routeItems[index];
          return ListTile(
            title: Text(item.label),
            onTap: () {
              Get.toNamed<void>(item.route);
            },
          );
        },
      ),
    );
  }
}

class _RouteItem {
  _RouteItem({required this.label, required this.route});
  final String label;
  final String route;
}
