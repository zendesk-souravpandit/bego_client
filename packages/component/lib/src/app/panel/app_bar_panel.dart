import 'package:beassets/assets.dart';
import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/page/be_view.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/layout.dart';
import 'package:beui/mulitchild.dart';
import 'package:beui/theme.dart';
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
    final BeBreakpoint breakpoint = BeTheme.of(context).breakpoint;
    final canPop = controller.navigatorAppBarKey.currentState?.canPop() ?? false;
    final drawerIcon =
        breakpoint.isMobile
            ? IconButton(
              icon: const Icon(BeIcons.icon_menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
            : null;

    return AppBar(
      automaticallyImplyLeading: canPop,
      leading: drawerIcon,
      leadingWidth: breakpoint.isMobile ? 16 : 0,
      actionsPadding: p0,
      elevation: 1,

      title: Navigator(
        key: controller.navigatorAppBarKey,
        onGenerateRoute: (final RouteSettings settings) {
          return MaterialPageRoute<void>(
            builder: (final BuildContext context) {
              return const Text('AppBarStateWidget');
            },
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BeBadge(
            rounded: true,
            badge: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: BeColors.green,
                shape: BoxShape.circle,
                border: Border.all(color: BeColors.white, width: 2),
              ),
            ),
            child: CircleAvatar(
              backgroundImage: BeAsset.images.demoImage.image().image,
              radius: 16,
            ),
          ),
        ),

        // Add more actions here if needed
      ],
    );
  }
}
