import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
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
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    return Container(
      decoration: BoxDecoration(
        color: BeColors.gray100,
        border: Border(left: BorderSide(color: BeTheme.of(context).colors.disabled, width: 0.5)),
      ),
      width: const RightSidePanelWidth().getWidth(breakpoint),
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
