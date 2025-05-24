// import 'package:bego_app/bego_app.dart';
// import 'package:bego_app/src/page/i_be_build.dart';
// import 'package:bego_core/bego_getx.dart' show GetView, StateExt;
// import 'package:bego_ui/bego_widgets.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/page/be_page_state.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BePage<S extends BePageState, C extends BePageController<S>> extends GetView<C> {
  // const BePage({super.key});

  const BePage({super.key});

  @override
  Widget build(BuildContext context) => controller.obx(
    (S state) => switch (state.status) {
      BePageStatusEmpty() => const Text('Empty'),
      BePageStatusLoading() => const Text('Loading'),
      BePageStatusError() => const Text('Error'),
      // BePageStatusSuccess() => const Text('Success'),
      _ => const Text('Success and other'),
    },
  );
}
