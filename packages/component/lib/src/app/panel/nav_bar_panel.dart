import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';

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
    return Container(
      width: const NavbarPanelWidth().getWidth(breakpoint),
      height: heightInfinity,
      decoration: BoxDecoration(
        color: BeColors.gray100,
        border: Border(right: BorderSide(color: BeTheme.of(context).colors.disabled, width: 0.5)),
      ),
      child: Navigator(
        key: controller.navigatorDrawerKey,
        onGenerateRoute: (final RouteSettings settings) {
          return MaterialPageRoute<void>(
            builder: (final BuildContext context) {
              return const Text('NavBarStateWidget');
            },
          );
        },
      ),
    );
  }
}
