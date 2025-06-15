import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_contants.dart';
import 'package:becomponent/src/page/be_view.dart';
import 'package:becomponent/src/page/components/be_state_widgets.dart';
import 'package:flutter/widgets.dart';

class BeAppBarPanel extends BeView<void, BeAppController> {
  const BeAppBarPanel({super.key, super.viewId = BePanelConstants.appBarPanel});
  // const BeAppBarPanel({super.key});

  // @override
  // Widget build(final BuildContext context) {
  //   return const Placeholder();
  // }
  @override
  StateWidget<void> viewSuccess(final BuildContext context, final void state) {
    return const SuccessStateWidget(data: null);
  }
}
