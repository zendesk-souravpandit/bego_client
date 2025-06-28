import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeMainContentPanel extends GetView<BeAppController> {
  const BeMainContentPanel({super.key});
  @override
  StateWidget<void> build(final BuildContext context) {
    return MainContentStateWidget<void>(controller: controller);
  }
}

class MainContentStateWidget<T> extends StateWidget<T> {
  const MainContentStateWidget({super.key, required this.controller});
  final BeAppController controller;

  @override
  Widget build(final BuildContext context) {
    final routerDelegate = Get.find<BeAppRouteDelegate>();
    final initialRoute = '${routerDelegate.mainRoutePath}${routerDelegate.mainInitRoutePath}';
    return GetRouterOutlet(
      key: controller.mainNavigatorKey,
      anchorRoute: routerDelegate.mainRoutePath, // matches your root /home GetPage
      initialRoute: initialRoute, // initial nested route to show
    );
  }
}
