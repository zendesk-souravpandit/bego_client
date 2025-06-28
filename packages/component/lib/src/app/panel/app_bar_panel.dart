import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeAppBarPanel extends GetView<BeAppController> {
  const BeAppBarPanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    final BeAppRouteDelegate appDelegate = Get.find<BeAppRouteDelegate>();
    return AppBarStateWidget<void>(
      controller: controller,
      appBarRouteFactory: appDelegate.appBarRouteFactory,
    );
  }
}

class AppBarStateWidget<T> extends StateWidget<T> {
  const AppBarStateWidget({super.key, required this.controller, required this.appBarRouteFactory});
  final BeAppController controller;
  final RouteFactory? appBarRouteFactory;

  @override
  Widget build(final BuildContext context) {
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    final canPop = controller.appBarNavigatorKey.currentState?.canPop() ?? false;

    final navigator = Navigator(
      key: controller.appBarNavigatorKey,
      initialRoute: controller.appBarRouteName.value,
      onGenerateRoute: appBarRouteFactory,
    );

    return Row(
      children: [
        if (canPop)
          IconButton(
            icon: const Icon(BeIcons.icon_chevron_left),
            onPressed: () => Navigator.maybePop(context),
          ),
        if (breakpoint.isMobile)
          IconButton(
            icon: const Icon(BeIcons.icon_menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        Expanded(
          child: navigator,
          // ),
        ),
      ],
    );
  }
}
