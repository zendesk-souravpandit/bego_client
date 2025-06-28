import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeAppController extends BePageController<void> {
  BeAppController({required this.appDelegate}) : super();

  final BeAppRouteDelegate appDelegate;

  // Navigator keys
  final GlobalKey<NavigatorState> _appBarNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.appBarPanel,
  );
  final GlobalKey<NavigatorState> _drawerNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.drawerPanel,
  );
  final GlobalKey<NavigatorState> _mainNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.mainPanel,
  );
  final GlobalKey<NavigatorState> _rightPanelNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.rightPanel,
  );

  // Getters for navigator keys and states
  GlobalKey<NavigatorState> get appBarNavigatorKey => _appBarNavigatorKey;
  NavigatorState? get appBarNavigator => _appBarNavigatorKey.currentState;

  GlobalKey<NavigatorState> get drawerNavigatorKey => _drawerNavigatorKey;
  NavigatorState? get drawerNavigator => _drawerNavigatorKey.currentState;

  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;
  NavigatorState? get mainNavigator => _mainNavigatorKey.currentState;

  GlobalKey<NavigatorState> get rightPanelNavigatorKey => _rightPanelNavigatorKey;
  NavigatorState? get rightPanelNavigator => _rightPanelNavigatorKey.currentState;

  // Observable sizes
  final appBarSize = const Size.fromHeight(kToolbarHeight).obs;
  final navbarPanelWidth = const NavbarPanelWidth().obs;
  final rightPanelWidth = const RightSidePanelWidth().obs;

  late final RxString appBarRouteName = appDelegate.appBarRoutePath.obs;
  late final RxString drawerRouteName = appDelegate.drawerRoutePath.obs;
  late final RxString rightPanelRouteName = appDelegate.rightPanelRoutePath.obs;

  set updateAppBarSize(final Size newSize) {
    appBarSize.value = newSize.height <= 0 ? const Size(0, 0) : newSize;
  }

  set updateNavbarPanelWidth(final NavbarPanelWidth newWidth) {
    navbarPanelWidth.value = newWidth;
  }

  set updateRightPanelWidth(final RightSidePanelWidth newWidth) {
    rightPanelWidth.value = newWidth;
  }

  // Push named route methods

  Future<T?> pushAppBar<T>(final String routeName, {final Object? arguments}) {
    final navigator = _appBarNavigatorKey.currentState;
    if (navigator != null) {
      appBarRouteName.value = routeName;
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  Future<T?> pushDrawer<T>(final String routeName, {final Object? arguments}) {
    final navigator = _drawerNavigatorKey.currentState;
    if (navigator != null) {
      drawerRouteName.value = routeName;
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  Future<T?> pushMain<T>(final String routeName, {final Object? arguments}) {
    final navigator = _mainNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  Future<T?> pushRightPanel<T>(final String routeName, {final Object? arguments}) {
    final navigator = _rightPanelNavigatorKey.currentState;
    if (navigator != null) {
      rightPanelRouteName.value = routeName;
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  // Push widget methods

  Future<T?> pushAppBarWidget<T>(final Widget widget) {
    final navigator = _appBarNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
    }
    return Future.value(null);
  }

  Future<T?> pushDrawerWidget<T>(final Widget widget) {
    final navigator = _drawerNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
    }
    return Future.value(null);
  }

  Future<T?> pushMainWidget<T>(final Widget widget) {
    final navigator = _mainNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
    }
    return Future.value(null);
  }

  Future<T?> pushRightPanelWidget<T>(final Widget widget) {
    final navigator = _rightPanelNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
    }
    return Future.value(null);
  }

  // Pop route methods

  bool popAppBar<T>({final T? result}) {
    final navigator = _appBarNavigatorKey.currentState;
    if (navigator?.canPop() ?? false) {
      navigator!.pop(result);
      return true;
    }
    return false;
  }

  bool popDrawer<T>({final T? result}) {
    final navigator = _drawerNavigatorKey.currentState;
    if (navigator?.canPop() ?? false) {
      navigator!.pop(result);
      return true;
    }
    return false;
  }

  bool popMain<T>({final T? result}) {
    final navigator = _mainNavigatorKey.currentState;
    if (navigator?.canPop() ?? false) {
      navigator!.pop(result);
      return true;
    }
    return false;
  }

  bool popRightPanel<T>({final T? result}) {
    final navigator = _rightPanelNavigatorKey.currentState;
    if (navigator?.canPop() ?? false) {
      navigator!.pop(result);
      return true;
    }
    return false;
  }

  // Pop to first route for all navigators

  void popAllNavigatorsToRoot() {
    _appBarNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
    _drawerNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
    _mainNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
    _rightPanelNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
  }

  // Getters for canPop on each navigator

  bool get canPopAppBar => _appBarNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopDrawer => _drawerNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopMain => _mainNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopRightPanel => _rightPanelNavigatorKey.currentState?.canPop() ?? false;
}
