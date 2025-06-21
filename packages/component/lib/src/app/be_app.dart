import 'package:becomponent/app.dart';
import 'package:becomponent/src/app/panel/app_bar_panel.dart';
import 'package:becomponent/src/app/panel/main_content_panel.dart';
import 'package:becomponent/src/app/panel/nav_bar_panel.dart';
import 'package:becomponent/src/app/panel/right_side_panel.dart';
import 'package:becomponent/src/app/routes/be_app_delegates.dart';
import 'package:becomponent/src/app/routes/be_get_delegates.dart';
import 'package:becomponent/src/page/components/unknown_widget.dart';
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
  final BeRouteDelegate? routeDelegate;

  final BeResponsivePoints responsivePoints;
  @override
  Widget build(final BuildContext context) {
    final themeController = Get.find<AppThemeController>();
    final localizationController = Get.find<AppLocaleController>();
    final appDelegate = routeDelegate ?? BeAppDelegate();
    final routerDelegate = appDelegate.createDelegate();

    return Obx(() {
      return AppResponsiveWrapper(
        responsivePoints: responsivePoints,
        child: GetMaterialApp.router(
          routerDelegate: routerDelegate,
          debugShowCheckedModeBanner: false,
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
          getPages: appDelegate.routes,
          unknownRoute: GetPage(name: '/not-found', page: UnknownWidget.new),
        ),
      );
    });
  }
}

class BeAppPageBindings extends Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    return [Bind.lazyPut<BeAppController>(BeAppController.new)];
  }
}

class BeAppPage extends GetView<BeAppController> {
  const BeAppPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final betheme = BeTheme.of(context);
    final breakpoint = betheme.breakpoint;

    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: controller.appBarSize.value,
          child: const BeAppBarPanel(),
        ),
        drawer: breakpoint.isMobile ? const BeNavBarPanel() : null,
        body: Row(
          children: [
            if (!breakpoint.isMobile) const BeNavBarPanel(),
            const Expanded(child: BeMainContentPanel()),
            if (betheme.breakpoint.isDesktop) const BeRightSidePanel(),
          ],
        ),
      ),
    );
  }
}
