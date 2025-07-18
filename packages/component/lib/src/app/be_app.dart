import 'package:becomponent/src/app/app_responsive_wrapper.dart';
import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/locale_controller.dart';
import 'package:becomponent/src/app/panel/app_bar_panel.dart';
import 'package:becomponent/src/app/panel/drawer_bar_panel.dart';
import 'package:becomponent/src/app/panel/main_content_panel.dart';
import 'package:becomponent/src/app/panel/side_panel.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/app/theme_controller.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BeApp extends StatelessWidget {
  const BeApp({
    super.key,
    this.responsivePoints = const BeResponsivePoints(),
    this.translations,
    this.routeDelegate,
  });

  final Translations? translations;
  final BeAppRouteDelegate? routeDelegate;

  final BeResponsivePoints responsivePoints;
  @override
  Widget build(final BuildContext context) {
    const drawerPanel = BeDrawerPanel();
    const mainPanel = BeMainContentPanel();
    const sidePanel = BeSidePanel();
    const appBarPanel = BeAppBarPanel();

    final themeController = Get.find<AppThemeController>();
    final localizationController = Get.find<AppLocaleController>();
    final appDelegate = Get.find<BeAppRouteDelegate>();
    final routerDelegate = appDelegate.createDelegate(
      drawerPanel,
      mainPanel,
      sidePanel,
      appBarPanel,
    );
    final routeInformationProvider = PlatformRouteInformationProvider(
      initialRouteInformation: appDelegate.initialRouteInfo,
    );

    return Obx(() {
      return AppResponsiveWrapper(
        responsivePoints: responsivePoints,
        child: GetMaterialApp.router(
          routerDelegate: routerDelegate,
          debugShowCheckedModeBanner: false,
          routeInformationProvider: routeInformationProvider,
          theme: themeController.theme.value,
          themeMode: themeController.themeMode.value,
          locale: localizationController.locale.value,
          supportedLocales: localizationController.locales,
          fallbackLocale: localizationController.locales.first,
          translations: translations,
          builder:
              (final context, final child) =>
                  BeNotificationsProvider(child: Material(child: child)),
          onInit: () {
            final delegate = Get.rootController.rootDelegate;
            delegate.navigatorObservers?.add(GetObserver(null, Get.routing));
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          /// All pages are registered in the BeAppRouteDelegate createDelegate method.
          /// This is just to prevent the app from crashing if no routes are defined.
          getPages: [appDelegate.unknownRoute],
        ),
      );
    });
  }
}

class BeAppPage extends GetView<BeAppController> {
  const BeAppPage({
    super.key,
    required this.drawerPanel,
    required this.mainPanel,
    required this.sidePanel,
    required this.appBarPanel,
  });

  final Widget drawerPanel;
  final Widget mainPanel;
  final Widget sidePanel;
  final Widget appBarPanel;

  @override
  Widget build(final BuildContext context) {
    final betheme = BeTheme.of(context);
    final breakpoint = betheme.breakpoint;

    return Obx(() {
      final children = <Widget>[];

      for (final panel in controller.panelOrder) {
        switch (panel) {
          case BePanelType.drawer:
            if (!breakpoint.isMobile) children.add(drawerPanel);
            break;
          case BePanelType.main:
            children.add(Expanded(child: mainPanel));
            break;
          case BePanelType.side:
            if (betheme.breakpoint.isDesktop) children.add(sidePanel);
            break;
        }
      }

      return Scaffold(
        appBar: PreferredSize(preferredSize: controller.appBarSize.value, child: appBarPanel),
        drawer: breakpoint.isMobile ? drawerPanel : null,
        body: Row(children: children),
      );
    });
  }
}
