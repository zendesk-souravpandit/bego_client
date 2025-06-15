import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/helper_ext.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';

class BeRightSidePanel extends GetView<BeAppController> {
  const BeRightSidePanel({super.key});

  @override
  StateWidget<void> build(final BuildContext context) {
    return RightSidePanel<void>(controller: controller);
  }
}

class RightSidePanel<T> extends StateWidget<T> {
  const RightSidePanel({super.key, required this.controller});
  final BeAppController controller;
  @override
  Widget build(final BuildContext context) {
    return Container(
      color: const Color(0xFFEEEEEE),
      width: context.widthPct(0.3),
      child: Navigator(
        key: controller.navigatorRightPanelKey,
        onGenerateRoute: (final RouteSettings settings) {
          return MaterialPageRoute<void>(
            builder: (final BuildContext context) {
              return const Text('RightSidePanel');
            },
          );
        },
      ),
    );
  }
}
