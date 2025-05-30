import 'package:becomponent/app.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/overlay.dart';
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
          // home: AppSettingsPage(),
          getPages: [
            GetPage(name: '/settings', page: AppSettingsPage.new),
            GetPage(name: '/abc', page: AppSettingsPage.new),
          ],
        ),
      );
    });
  }
}
