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
    return GetRouterOutlet(
      key: controller.navigatorMainKey,
      anchorRoute: '/app', // matches your root /home GetPage
      initialRoute: '/app/home', // initial nested route to show
      // filterPages: (afterAnchor) {
      //   // print('afterAnchor.toString()');
      //   // print(afterAnchor.toString());
      //   afterAnchor =
      //       afterAnchor.where((final e) => e.participatesInRootNavigator != true).toList();

      //   return afterAnchor;
      // },
      // delegate: GetDelegate(pages: BeAppDelegate().routes),
      // filterPages: (final pages) {
      //   Get.log('Home filter pages: ${pages.map((final e) => e.name)}');
      //   var ret = pages.toList();

      //   // If no pages matched and this modal is current route, fallback to dashboard
      //   if (ret.isEmpty && ModalRoute.of(context)!.isCurrent) {
      //     ret.add(context.delegate.matchRoute('/app/home').route!);
      //   }

      //   // Access the nested navigator associated with "/home"
      //   final nav = Get.nestedKey('/app')?.navigatorKey.currentState?.widget;

      //   Get.log('Home filter pages: ${pages.map((final e) => e.name)}');

      //   if (nav != null) {
      //     if (ret.isEmpty) {
      //       Get.log('Home use olds: ${nav.pages.map((final e) => e.name)}');
      //       return nav.pages as List<GetPage>;
      //     }

      //     final depth = ret[0].name.split('/').length;

      //     for (final p in nav.pages as List<GetPage>) {
      //       if (p.maintainState && p.name.split('/').length == depth && !ret.contains(p)) {
      //         ret.insert(0, p);
      //       }
      //     }
      //   }

      //   ret = ret.where((final e) => e.participatesInRootNavigator != true).toList();

      //   Get.log('Home real pages: ${ret.map((final e) => e.name)}');

      //   return ret;
      // },
    );
  }
}
