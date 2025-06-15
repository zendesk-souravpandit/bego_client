import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/page/be_view.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeAppBarPanel extends BeView<void, BeAppController> {
  const BeAppBarPanel({super.key, super.viewId = BePanelConstants.appBarPanel});

  @override
  StateWidget<void> build(final BuildContext context) {
    return AppBarStateWidget<void>(controller: controller);
  }
}

class AppBarStateWidget<T> extends StateWidget<T> {
  const AppBarStateWidget({super.key, required this.controller});
  final BeAppController controller;

  @override
  Widget build(final BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: controller.appBarSize.value.height,
        child: Navigator(
          key: controller.navigatorAppBarKey,
          onGenerateRoute: (final RouteSettings settings) {
            return MaterialPageRoute<void>(
              builder: (final BuildContext context) {
                return const Text('AppBarStateWidget');
              },
            );
          },
        ),
      ),
    );
  }
}
