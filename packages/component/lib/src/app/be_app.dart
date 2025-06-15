import 'package:becomponent/app.dart';
import 'package:becomponent/src/app/panel/app_bar_panel.dart';
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
          // binds: [Bind.lazyPut<HomePageController>(HomePageController.new)],
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
        const SizedBox(height: 20),
        const Divider(),
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
            ElevatedButton(onPressed: () {}, child: const Text('Change Home to home')),
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
        child: Container(
          color: betheme.colors.primary,
          child: Navigator(
            key: controller.navigatorAppBarKey,
            onGenerateRoute: (final settings) {
              if (settings.name == '/not-found') {
                return MaterialPageRoute<void>(builder: (final context) => const BeAppBarPanel());
              }

              return MaterialPageRoute<void>(
                builder: (final context) {
                  return AppBar(
                    title: const Text('BeApp Dashboard'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          controller.appBarNavigator.push(
                            MaterialPageRoute<void>(
                              builder:
                                  (final context) => AppBar(
                                    title: const Text('Hello'),
                                    automaticallyImplyLeading: false,
                                    actions: [
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          if (controller.mainNavigator.canPop()) {
                                            controller.mainNavigator.maybePop();
                                          } else {
                                            controller.appBarNavigator.pop();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            if (breakpoint.isDesktop || breakpoint.isTablet) ...[
              BeNavPanel(
                navigationKey: controller.navigatorDrawerKey,
                child: const Text('Navigation Panel'),
              ),
              const VerticalDivider(indent: 0, endIndent: 0),
            ],
            Expanded(
              child: Navigator(
                key: controller.navigatorMainKey,

                // initialRoute: controller.appNavigation.currentState,
                onGenerateRoute: (final settings) {
                  // print('onGenerateRoute: ${settings.name}');
                  return MaterialPageRoute<void>(
                    builder: (final context) {
                      // if (settings.name == '/profile') {
                      //   return const ProfilePage();
                      // }
                      if (settings.name == '/not-found') {
                        return const UnknownWidget();
                      }
                      return const Center(child: Text('Welcome to BeApp!'));
                    },
                  );
                },
              ),
            ),

            if (betheme.breakpoint.isDesktop) ...[
              const VerticalDivider(indent: 0, endIndent: 0),
              BeSidePanel(
                navigationKey: controller.navigatorRightPanelKey,
                child: const Text('Side Panel'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BeSidePanel extends StatelessWidget {
  const BeSidePanel({super.key, required this.child, required this.navigationKey});

  final Widget child;
  final GlobalKey<NavigatorState> navigationKey;

  @override
  Widget build(final BuildContext context) {
    return Navigator(
      key: navigationKey,
      onGenerateRoute:
          (final settings) => MaterialPageRoute<void>(builder: (final context) => child),
    );
  }
}

class BeNavPanel extends StatelessWidget {
  const BeNavPanel({super.key, required this.child, required this.navigationKey});

  final Widget child;
  final GlobalKey<NavigatorState> navigationKey;

  @override
  Widget build(final BuildContext context) {
    return Navigator(
      key: navigationKey,
      onGenerateRoute:
          (final settings) => MaterialPageRoute<void>(builder: (final context) => child),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            const Text('Welcome to your Profile', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('close Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class SpeakingPage extends StatelessWidget {
  const SpeakingPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Center(child: Text('Speaking Content', style: TextStyle(fontSize: 24)));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text('Here you can change your Settings', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
