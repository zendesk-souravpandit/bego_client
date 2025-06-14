import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/page/be_page_section_resolver.dart';
// import 'package:becomponent/src/page/be_page_section_resolver.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeAppController extends BePageController<void> {
  @override
  void onInit() {
    super.onInit();
    change(const SuccessStatus(null));
  }

  // App bar navigation key
  final GlobalKey<NavigatorState> _appBar = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.appBarPanel,
  );
  GlobalKey<NavigatorState> get navigatorAppBarKey => _appBar;
  NavigatorState get appBarNavigator => _appBar.currentState!;

  // Left panel navigation key
  final GlobalKey<NavigatorState> _drawer = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.drawerPanel,
  );
  GlobalKey<NavigatorState> get navigatorDrawerKey => _drawer;
  NavigatorState get drawerNavigator => _drawer.currentState!;

  // Main navigation keys for different parts of the app center
  final GlobalKey<NavigatorState> _main = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.mainPanel,
  );
  GlobalKey<NavigatorState> get navigatorMainKey => _main;
  NavigatorState get mainNavigator => _main.currentState!;

  // Right panel navigation key
  final GlobalKey<NavigatorState> _rightPanel = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.rightPanel,
  );
  GlobalKey<NavigatorState> get navigatorRightPanelKey => _rightPanel;
  NavigatorState get rightPanelNavigator => _rightPanel.currentState!;

  final appBarSize = const Size.fromHeight(kToolbarHeight).obs;

  set changeAppBarHeight(double height) {
    if (height <= 0) height = 0;
    appBarSize.value = Size(appBarSize.value.width, height);
  }

  // set changeAppBarWidth(double width) {
  //   if (width <= 0) width = 0;
  //   appBarSize.value = Size(width, appBarSize.value.height);
  // }

  @override
  Future<dynamic> fetchViewSection(final BeSection section) async {
    // print('Fetching view section: $section');
    // Prevent fetching if the section is not attached
    return Future.delayed(const Duration(seconds: 1), () {
      return {};
    });
  }
}
