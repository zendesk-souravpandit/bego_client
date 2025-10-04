import 'dart:async';

import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/panel/panel_constants.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

/// Enhanced version of BeAppController with performance optimizations
class EnhancedBeAppController extends BePageController<void> {
  EnhancedBeAppController({required this.appDelegate}) : super();

  final BeAppRouteDelegate appDelegate;

  // Navigator keys - made final and initialized immediately
  final GlobalKey<NavigatorState> _appBarNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.appBarPanel,
  );
  final GlobalKey<NavigatorState> _drawerNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.drawerPanel,
  );
  final GlobalKey<NavigatorState> _mainNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: BePanelConstants.mainPanel,
  );
  final GlobalKey<NavigatorState> _sidePanelNavigatorKey = GlobalKey<NavigatorState>(
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

  // Observable sizes with default values
  final appBarSize = const Size.fromHeight(kToolbarHeight).obs;
  final navbarPanelWidth = const NavbarPanelWidth().obs;
  final sidePanelWidth = const SidePanelWidth().obs;

  // Route names - using late final for better performance
  late final RxString appBarRouteName = appDelegate.appBarRoutePath.obs;
  late final RxString drawerRouteName = appDelegate.drawerRoutePath.obs;
  late final RxString sidePanelRouteName = appDelegate.sidePanelRoutePath.obs;

  // Panel order with getter/setter for immutability
  List<BePanelType> _panelOrder = [BePanelType.drawer, BePanelType.main, BePanelType.side];
  List<BePanelType> get panelOrder => List.unmodifiable(_panelOrder);

  /// Updates panel order and triggers reactive update
  void updatePanelOrder(final List<BePanelType> newOrder) {
    if (_panelOrder != newOrder) {
      _panelOrder = List.from(newOrder);
      update(['panel_order']); // Targeted update
    }
  }

  // Optimized setters with change detection
  set updateAppBarSize(final Size newSize) {
    if (appBarSize.value != newSize) {
      appBarSize.value = newSize;
    }
  }

  set updateNavbarPanelWidth(final NavbarPanelWidth newWidth) {
    if (navbarPanelWidth.value != newWidth) {
      navbarPanelWidth.value = newWidth;
    }
  }

  set updateSidePanelWidth(final SidePanelWidth newWidth) {
    if (sidePanelWidth.value != newWidth) {
      sidePanelWidth.value = newWidth;
    }
  }

  // Debounced resize methods to prevent excessive updates
  Timer? _resizeTimer;

  void debounceAppBarResize(final Size newSize) {
    _resizeTimer?.cancel();
    _resizeTimer = Timer(const Duration(milliseconds: 100), () {
      updateAppBarSize = newSize;
    });
  }

  // Helper methods for common operations
  bool get isDrawerVisible => _panelOrder.contains(BePanelType.drawer);
  bool get isSidePanelVisible => _panelOrder.contains(BePanelType.side);

  /// Navigation helpers with error handling
  Future<T?> navigateToAppBar<T>(final String route, {final Object? arguments}) async {
    try {
      return await appBarNavigator?.pushNamed<T>(route, arguments: arguments);
    } catch (e) {
      debugPrint('Navigation error in AppBar: $e');
      return null;
    }
  }

  Future<T?> navigateToDrawer<T>(final String route, {final Object? arguments}) async {
    try {
      return await drawerNavigator?.pushNamed<T>(route, arguments: arguments);
    } catch (e) {
      debugPrint('Navigation error in Drawer: $e');
      return null;
    }
  }

  Future<T?> navigateToMain<T>(final String route, {final Object? arguments}) async {
    try {
      return await mainNavigator?.pushNamed<T>(route, arguments: arguments);
    } catch (e) {
      debugPrint('Navigation error in Main: $e');
      return null;
    }
  }

  Future<T?> navigateToSidePanel<T>(final String route, {final Object? arguments}) async {
    try {
      return await sidePanelNavigator?.pushNamed<T>(route, arguments: arguments);
    } catch (e) {
      debugPrint('Navigation error in SidePanel: $e');
      return null;
    }
  }

  @override
  void onClose() {
    _resizeTimer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize any required subscriptions
    ever(appBarSize, (final Size size) {
      debugPrint('App bar size changed: $size');
    });
  }
}

/// Mixin for adding performance monitoring to app components
mixin AppPerformanceMixin on GetxController {
  int _buildCount = 0;
  int get buildCount => _buildCount;

  void incrementBuildCount() {
    _buildCount++;
    if (_buildCount % 10 == 0) {
      debugPrint('$runtimeType has rebuilt $_buildCount times');
    }
  }
}

/// Enhanced theme controller with better state management
class EnhancedAppThemeController extends GetxController with AppPerformanceMixin {
  final themeMode = ThemeMode.light.obs;
  final theme = Rx<ThemeData?>(null);
  final breakpoint = Rx<dynamic>(null); // Replace with actual BeBreakpoint type

  // Cached theme data to prevent recreation
  ThemeData? _lightThemeCache;
  ThemeData? _darkThemeCache;

  ThemeData get lightTheme {
    _lightThemeCache ??= _buildLightTheme();
    return _lightThemeCache!;
  }

  ThemeData get darkTheme {
    _darkThemeCache ??= _buildDarkTheme();
    return _darkThemeCache!;
  }

  void setBreakpoint(final dynamic newBreakpoint) {
    if (breakpoint.value != newBreakpoint) {
      breakpoint.value = newBreakpoint;
      _invalidateThemeCache();
      _updateTheme();
    }
  }

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _updateTheme();
  }

  void _updateTheme() {
    final newTheme = themeMode.value == ThemeMode.light ? lightTheme : darkTheme;
    theme.value = newTheme;
    Get.changeTheme(newTheme);
  }

  void _invalidateThemeCache() {
    _lightThemeCache = null;
    _darkThemeCache = null;
  }

  ThemeData _buildLightTheme() {
    // Implement your light theme building logic here
    return ThemeData.light();
  }

  ThemeData _buildDarkTheme() {
    // Implement your dark theme building logic here
    return ThemeData.dark();
  }

  @override
  void onInit() {
    super.onInit();
    _updateTheme();
  }
}
