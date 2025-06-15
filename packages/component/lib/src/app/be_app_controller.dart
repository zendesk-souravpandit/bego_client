import 'package:becomponent/src/app/panel/panel_contants.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class BeAppController extends BePageController<void> {
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

  final appBarSize = const Size(widthInfinity, 56.0).obs;

  set changeAppBarHeight(final double height) {
    appBarSize.value = Size(widthInfinity, height);
  }

  set changeAppBarWidth(final double width) {
    appBarSize.value = Size(width, appBarSize.value.height);
  }
}
