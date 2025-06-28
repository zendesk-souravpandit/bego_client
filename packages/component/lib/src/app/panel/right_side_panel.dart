import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/widgets.dart';

class BeRightSidePanel extends GetView<BeAppController> {
  const BeRightSidePanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    final BeAppRouteDelegate appDelegate = Get.find<BeAppRouteDelegate>();
    return RightSidePanel<void>(
      controller: controller,
      rightPanelRouteFactory: appDelegate.rightPanelRouteFactory,
    );
  }
}

class RightSidePanel<T> extends StateWidget<T> {
  const RightSidePanel({super.key, required this.controller, required this.rightPanelRouteFactory});
  final BeAppController controller;

  final RouteFactory? rightPanelRouteFactory;
  @override
  Widget build(final BuildContext context) {
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    return Obx(
      () => Container(
        width: controller.rightPanelWidth.value.getWidth(breakpoint),
        decoration: BoxDecoration(
          color: BeColors.gray100,
          border: Border(left: BorderSide(color: BeTheme.of(context).colors.disabled, width: 0.5)),
        ),
        child: Navigator(
          key: controller.rightPanelNavigatorKey,
          initialRoute: controller.rightPanelRouteName.value,
          onGenerateRoute: rightPanelRouteFactory,
        ),
      ),
    );
  }
}
