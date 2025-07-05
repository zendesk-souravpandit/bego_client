import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

enum PanelType { drawer, main, side }

class BeAppController extends BePageController<void> {
  BeAppController({required this.appDelegate}) : super();

  final BeAppRouteDelegate appDelegate;

  // Navigator keys
  late final GlobalKey<NavigatorState> _appBarNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.appBarPanel,
  );
  late final GlobalKey<NavigatorState> _drawerNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.drawerPanel,
  );
  late final GlobalKey<NavigatorState> _mainNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.mainPanel,
  );
  late final GlobalKey<NavigatorState> _sidePanelNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.sidePanel,
  );

  // Getters for navigator keys and states
  GlobalKey<NavigatorState> get appBarNavigatorKey => _appBarNavigatorKey;
  NavigatorState? get appBarNavigator => _appBarNavigatorKey.currentState;

  GlobalKey<NavigatorState> get drawerNavigatorKey => _drawerNavigatorKey;
  NavigatorState? get drawerNavigator => _drawerNavigatorKey.currentState;

  GlobalKey<NavigatorState> get mainNavigatorKey => _mainNavigatorKey;
  NavigatorState? get mainNavigator => _mainNavigatorKey.currentState;

  GlobalKey<NavigatorState> get sidePanelNavigatorKey => _sidePanelNavigatorKey;
  NavigatorState? get sidePanelNavigator => _sidePanelNavigatorKey.currentState;

  // Observable sizes
  final appBarSize = const Size.fromHeight(kToolbarHeight).obs;
  final navbarPanelWidth = const NavbarPanelWidth().obs;
  final sidePanelWidth = const SidePanelWidth().obs;

  late final RxString appBarRouteName = appDelegate.appBarRoutePath.obs;
  late final RxString drawerRouteName = appDelegate.drawerRoutePath.obs;
  late final RxString sidePanelRouteName = appDelegate.sidePanelRoutePath.obs;

  set updateAppBarSize(final Size newSize) {
    appBarSize.value = newSize.height <= 0 ? const Size(0, 0) : newSize;
  }

  set updateNavbarPanelWidth(final NavbarPanelWidth newWidth) {
    navbarPanelWidth.value = newWidth;
  }

  set updateSidePanelWidth(final SidePanelWidth newWidth) {
    sidePanelWidth.value = newWidth;
  }

  // Push named route methods

  Future<T?> pushAppBar<T>(final String routeName, {final Object? arguments}) {
    appBarRouteName.value = routeName;
    final navigator = _appBarNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.pushNamed<T>(routeName, arguments: arguments);
    }
    return Future.value(null);
  }

  Future<T?> pushDrawer<T>(final String routeName, {final Object? arguments}) {
    final navigator = _drawerNavigatorKey.currentState;
    drawerRouteName.value = routeName;
    if (navigator != null) {
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

  Future<T?> pushSidePanel<T>(final String routeName, {final Object? arguments}) {
    sidePanelRouteName.value = routeName;
    final navigator = _sidePanelNavigatorKey.currentState;
    if (navigator != null) {
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

  Future<T?> pushSidePanelWidget<T>(final Widget widget) {
    final navigator = _sidePanelNavigatorKey.currentState;
    if (navigator != null) {
      return navigator.push<T>(MaterialPageRoute(builder: (_) => widget));
    }
    return Future.value(null);
  }

  bool popMain<T>({final T? result}) {
    final navigator = _mainNavigatorKey.currentState;
    if (navigator?.canPop() ?? false) {
      navigator!.pop(result);
      return true;
    }
    return false;
  }

  // Pop route method with generic type parameter for result type
  bool _popNavigator<T>({
    required final GlobalKey<NavigatorState> navigatorKey,
    final String? routeNameUntil,
    final T? result,
    required final RxString routeNameObservable,
    required final String initialRouteName,
  }) {
    final navigator = navigatorKey.currentState;

    if (navigator == null) return false;
    if (routeNameUntil != null) {
      navigator.popUntil((final route) {
        final name = route.settings.name;
        return name == routeNameUntil || route.isFirst;
      });
      routeNameObservable.value = routeNameUntil;
      // Update observable after popping
      return true;
    }

    if (navigator.canPop()) {
      navigator.pop(result);
      return true;
    }
    return false;
  }

  bool popAppBar<T>({final String? routeNameUntil, final T? result}) {
    return _popNavigator<T>(
      navigatorKey: _appBarNavigatorKey,
      routeNameObservable: appBarRouteName,
      initialRouteName: '/',
      routeNameUntil: routeNameUntil,
      result: result,
    );
  }

  bool popDrawer<T>({final String? routeNameUntil, final T? result}) {
    return _popNavigator<T>(
      navigatorKey: _drawerNavigatorKey,
      routeNameObservable: drawerRouteName,
      initialRouteName: '/',
      routeNameUntil: routeNameUntil,
      result: result,
    );
  }

  bool popSidePanel<T>({final String? routeNameUntil, final T? result}) {
    return _popNavigator<T>(
      navigatorKey: _sidePanelNavigatorKey,
      routeNameObservable: sidePanelRouteName,
      initialRouteName: '/',
      routeNameUntil: routeNameUntil,
      result: result,
    );
  }

  // Pop to first route for all navigators
  void popAppBarToRoot() {
    _appBarNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
  }

  void popDrawerToRoot() {
    _drawerNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
  }

  void popMainToRoot() {
    _mainNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
  }

  void popSidePanelToRoot() {
    _sidePanelNavigatorKey.currentState?.popUntil((final route) => route.isFirst);
  }

  void popAllNavigatorsToRoot() {
    popAppBarToRoot();
    popDrawerToRoot();
    popMainToRoot();
    popSidePanelToRoot();
  }

  // Getters for canPop on each navigator

  bool get canPopAppBar => _appBarNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopDrawer => _drawerNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopMain => _mainNavigatorKey.currentState?.canPop() ?? false;

  bool get canPopSidePanel => _sidePanelNavigatorKey.currentState?.canPop() ?? false;

  // ------------ reorder panels --------------
  final RxList<PanelType> panelOrder =
      <PanelType>[PanelType.drawer, PanelType.main, PanelType.side].obs;
  set panelOrder(final List<PanelType> order) {
    panelOrder.value = order;
  }

  /// Reorder panels by moving panel at [oldIndex] to [newIndex]
  void reorderPanel(final int oldIndex, final int newIndex) {
    if (oldIndex < 0 || oldIndex >= panelOrder.length) return;
    if (newIndex < 0 || newIndex >= panelOrder.length) return;
    final panel = panelOrder.removeAt(oldIndex);
    panelOrder.insert(newIndex, panel);
  }

  /// You can also reorder by moving a specific PanelType to a new index
  void movePanel(final PanelType panel, final int newIndex) {
    final oldIndex = panelOrder.indexOf(panel);
    if (oldIndex == -1 || newIndex < 0 || newIndex >= panelOrder.length) return;
    panelOrder
      ..removeAt(oldIndex)
      ..insert(newIndex, panel);
  }
}
