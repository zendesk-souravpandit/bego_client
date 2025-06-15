import 'package:becomponent/app.dart';
import 'package:becomponent/src/app/panel/app_bar_panel.dart';
import 'package:becomponent/src/app/panel/main_content_panel.dart';
import 'package:becomponent/src/app/panel/nav_bar_panel.dart';
import 'package:becomponent/src/app/panel/right_content_panel.dart';
import 'package:becomponent/src/page/components/unknown_widget.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BeApp extends StatelessWidget {
  const BeApp({super.key, this.responsivePoints = const BeResponsivePoints()});

  final BeResponsivePoints responsivePoints;
  @override
  Widget build(final BuildContext context) {
    final themeController = Get.find<AppThemeController>();
    final localizationController = Get.find<AppLocaleController>();

    return Obx(() {
      return AppResponsiveWrapper(
        responsivePoints: responsivePoints,

        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeController.theme.value,
          themeMode: themeController.themeMode.value,
          locale: localizationController.locale.value,
          supportedLocales: localizationController.locales,
          fallbackLocale: localizationController.locales.first,
          // translations: MyTranslations(),
          builder:
              (final context, final child) =>
                  BeNotificationsProvider(child: Material(child: child)),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/',
          // home: AppSettingsPage(),
          getPages: [
            GetPage(name: '/', page: BeAppHomePage.new),

            GetPage(
              name: '/:user_id/:tenant_id/dashboard',
              page: BeAppPage.new,
              bindings: [BeAppPageBindings()],
              // participatesInRootNavigator: true,
              middlewares: [AuthMiddleware()],
              unknownRoute: GetPage(name: '/unknown', page: UnknownWidget.new),
            ),
            // GetPage(name: '/profile', page: ProfilePage.new),

            // GetPage(name: '/settings', page: NoResultFoundWidget.new),
          ],
          unknownRoute: GetPage(name: '/not-found', page: UnknownWidget.new),
        ),
      );
    });
  }
}

class BeAppHomePage extends StatelessWidget {
  const BeAppHomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Welcome to BeApp Home Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            const String userId = '12345';
            const String tenantId = '67890';

            Get.toNamed<void>('/$userId/$tenantId/dashboard');
          },
          child: const Text('Go to Dashboard'),
        ),
      ],
    );
  }
}

class BeAppPageBindings extends Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    return [Bind.lazyPut<BeAppController>(BeAppController.new)];
  }
}

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware();

  // @override
  // RouteDecoder redirectDelegate(final RouteDecoder? route) {
  //   print(route?.route?.name);
  //   if (route?.route?.name != '/dashboard') {
  //     return RouteDecoder.fromRoute('/profile');
  //   }
  //   print(route);
  //   return RouteDecoder.fromRoute(route?.route?.name ?? '/not-found');
  // }

  @override
  Widget onPageBuilt(final Widget page) {
    final widget = super.onPageBuilt(page);
    final controller = Get.find<BeAppController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: widget),
        Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                // controller.appNavigation.currentState?.pop();
                // controller.appNavigation.currentState?.push(
                //   MaterialPageRoute<void>(builder: (final context) => const ProfilePage()),
                // );
              },
              child: const Text('Go to Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.navigatorMainKey.currentState?.pushNamed('/not-found');
              },
              child: const Text('Change Home to Unknown'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeAppBarHeight = controller.appBarSize.value.height + 10.0;
              },
              child: const Text('increase appBar height'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeAppBarHeight = controller.appBarSize.value.height - 10.0;
              },
              child: const Text('decrease appBar height'),
            ),
            ElevatedButton(
              onPressed: () {
                // controller.appNavigation.currentState?.pushNamed('/not-found');
              },
              child: const Text('Change AppBar'),
            ),
          ],
        ),
        const Text('This is a middleware example'),
      ],
    );
  }
}

class BeAppPage extends GetView<BeAppController> {
  const BeAppPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final betheme = BeTheme.of(context);
    final breakpoint = betheme.breakpoint;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: controller.appBarSize.value,
        child: const BeAppBarPanel(),
      ),
      body: Center(
        child: Row(
          children: [
            if (breakpoint.isDesktop || breakpoint.isTablet) const BeNavBarPanel(),
            const Expanded(child: BeMainContentPanel()),
            if (betheme.breakpoint.isDesktop) const BeRightSidePanel(),
          ],
        ),
      ),
    );
  }
}
