import 'package:becomponent/src/app/be_app_controller.dart';
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
    return Navigator(
      key: controller.navigatorMainKey,
      onGenerateRoute: (final RouteSettings settings) {
        return MaterialPageRoute<void>(
          builder: (final BuildContext context) {
            return const Text('MainContentStateWidget');
          },
        );
      },
    );
  }
}
