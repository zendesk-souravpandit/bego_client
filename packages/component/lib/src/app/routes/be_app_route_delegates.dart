import 'package:becomponent/app.dart' show BePanelType;
import 'package:becomponent/src/app/be_app.dart';
import 'package:becomponent/src/app/panel/app_bar_panel.dart';
import 'package:becomponent/src/app/panel/drawer_bar_panel.dart';
import 'package:becomponent/src/app/panel/main_content_panel.dart';
import 'package:becomponent/src/app/panel/side_panel.dart';
import 'package:becomponent/src/app/routes/be_page_routes.dart';
import 'package:becomponent/src/page/components/unknown_widget.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

abstract class BeAppRouteDelegate {
  /// The initial route for the application.
  RouteInformation get initialRouteInfo => RouteInformation(uri: Uri.parse(mainRoutePath));

  List<BePanelType> panelOrder = [BePanelType.drawer, BePanelType.main, BePanelType.side];

  /// The name of the root route.
  String get mainRoutePath => '/app';

  String get mainInitRoutePath => '/home';

  /// Subclasses must provide the complete list of routes.
  List<BeMainPage<dynamic>> get mainRoutes;

  /// Optional middlewares to apply to the main route.
  ///
  /// Example of using a middleware to redirect users based on authentication status.
  /// ```dart
  /// class AuthMiddleware extends GetMiddleware {
  ///   AuthMiddleware();
  ///
  ///   bool isLoggedIn = false; // Replace with actual login check logic
  ///   @override
  ///   RouteDecoder redirectDelegate(final RouteDecoder? route) {
  ///     if (!isLoggedIn) {
  ///       return RouteDecoder.fromRoute('/login');
  ///     }
  ///     return RouteDecoder.fromRoute(route?.route?.name ?? '/not-found');
  ///   }
  /// }
  /// ```
  List<GetMiddleware> get mainMiddlewares => [];

  List<GetPage<dynamic>> get routes;

  /// Optional navigator observers.
  List<NavigatorObserver> get navigatorObservers => [];

  // /// Pick pages for the root navigator based on a single RouteDecoder.
  // /// Default implementation: returns all pages from the current branch that participate in root navigator.
  // Iterable<GetPage<dynamic>> pickPagesForRootNavigator(final RouteDecoder decoder);

  /// Builds the GetDelegate with configured routes, observers, and filtering.
  GetDelegate createDelegate(
    final BeDrawerPanel drawerPanel,
    final BeMainContentPanel mainPanel,
    final BeSidePanel sidePanel,
    final BeAppBarPanel? appBarPanel,
  ) {
    return GetDelegate(
      pages: [
        ...routes,
        GetPage(
          preventDuplicates: true,
          participatesInRootNavigator: true,
          name: mainRoutePath,
          page: () => BeAppPage(
            appBarPanel: appBarPanel,
            drawerPanel: drawerPanel,
            mainPanel: mainPanel,
            sidePanel: sidePanel,
          ),
          middlewares: mainMiddlewares,
          children: mainRoutes,
        ),
      ],

      notFoundRoute: unknownRoute,
      backButtonPopMode: PopMode.history,
      navigatorObservers: navigatorObservers,
    );
  }

  /// The name of the root route.
  String get appBarRoutePath => '/';

  String get drawerRoutePath => '/';

  String get sidePanelRoutePath => '/';

  RouteFactory? appBarRouteFactory;
  RouteFactory? drawerRouteFactory;
  RouteFactory? sidePanelRouteFactory;

  GetPage<BePageData> get unknownRoute =>
      GetPage<BePageData>(name: '/not-found', title: 'Not Found', page: UnknownWidget.new);
}
