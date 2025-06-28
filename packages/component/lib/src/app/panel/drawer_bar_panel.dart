import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeDrawerPanel extends GetView<BeAppController> {
  const BeDrawerPanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    final BeAppRouteDelegate appDelegate = Get.find<BeAppRouteDelegate>();
    return DrawerNavigationWidget<void>(
      controller: controller,
      drawerRouteFactory: appDelegate.drawerRouteFactory,
    );
  }
}

class DrawerNavigationWidget<T> extends StateWidget<T> {
  const DrawerNavigationWidget({
    super.key,
    required this.controller,
    required this.drawerRouteFactory,
  });

  final RouteFactory? drawerRouteFactory;
  final BeAppController controller;
  @override
  Widget build(final BuildContext context) {
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    final navigation = Navigator(
      key: controller.drawerNavigatorKey,
      initialRoute: controller.drawerRouteName.value,
      onGenerateRoute: drawerRouteFactory,
    );

    return Obx(
      () => Container(
        width: controller.navbarPanelWidth.value.getWidth(breakpoint),
        height: heightInfinity,
        decoration: BoxDecoration(
          color: BeColors.gray100,
          border: Border(right: BorderSide(color: BeTheme.of(context).colors.disabled, width: 0.5)),
        ),
        child: navigation,
      ),
    );
  }
}
