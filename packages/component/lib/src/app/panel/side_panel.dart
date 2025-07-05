import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

class BeSidePanel extends GetView<BeAppController> {
  const BeSidePanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    final BeAppRouteDelegate appDelegate = Get.find<BeAppRouteDelegate>();
    return SidePanelContent<void>(
      controller: controller,
      sidePanelRouteFactory: appDelegate.sidePanelRouteFactory,
    );
  }
}

class SidePanelContent<T> extends StateWidget<T> {
  const SidePanelContent({
    super.key,
    required this.controller,
    required this.sidePanelRouteFactory,
  });
  final BeAppController controller;

  final RouteFactory? sidePanelRouteFactory;
  @override
  Widget build(final BuildContext context) {
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    return Obx(
      () => Container(
        width: controller.sidePanelWidth.value.getWidth(breakpoint),
        decoration: const BoxDecoration(color: BeColors.gray100),
        child: Navigator(
          key: controller.sidePanelNavigatorKey,
          initialRoute: controller.sidePanelRouteName.value,
          onGenerateRoute: sidePanelRouteFactory,
        ),
      ),
    );
  }
}
