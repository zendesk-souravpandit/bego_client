import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class ThemeController extends GetxController {
  final themeMode = ThemeMode.light.obs;
  final theme = BeThemeData.light().obs;
  var breakpoint = BeBreakpoint.md.obs;

  void setBreakpoint(final BeBreakpoint newBreakpoint) {
    if (breakpoint.value != newBreakpoint) {
      breakpoint.value = newBreakpoint;
      _updateTheme();
    }
  }

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _updateTheme();
  }

  void _updateTheme() {
    final colors = themeMode.value == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
    final betheme = BeThemeData(breakpoint: breakpoint.value, colors: colors, themeMode: themeMode.value);
    theme.value = BeTheme.buildThemeData(betheme: betheme);
    Get.changeTheme(theme.value);
  }
}

class LocalizationController extends GetxController {
  final locales = [const Locale('en', 'US'), const Locale('es', 'ES')];
  final locale = const Locale('en', 'US').obs;

  void changeLocale(final Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);
  }
}

class AppBindings extends Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    return [
      Bind.lazyPut<ThemeController>(ThemeController.new),
      Bind.lazyPut<LocalizationController>(LocalizationController.new),
    ];
  }
}

class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return LayoutBuilder(
      builder: (final context, final constraints) {
        final width = constraints.maxWidth;
        final breakpoint = calculateBreakpoint(width);
        if (themeController.breakpoint.value != breakpoint) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            themeController.setBreakpoint(breakpoint);
          });
        }

        return child;
      },
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late final AppBindings appBindings = AppBindings();

  @override
  Widget build(final BuildContext context) {
    appBindings.dependencies();

    return Obx(() {
      final themeController = Get.find<ThemeController>();
      final localizationController = Get.find<LocalizationController>();

      return ResponsiveWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeController.theme.value,
          themeMode: themeController.themeMode.value,
          locale: localizationController.locale.value,
          supportedLocales: localizationController.locales,
          fallbackLocale: localizationController.locales.first,
          translations: MyTranslations(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: HomePage(),
        ),
      );
    });
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {'title': 'GetX App', 'change_theme': 'Change Theme', 'change_language': 'Change Language'},
    'es_ES': {'title': 'Aplicación GetX', 'change_theme': 'Cambiar Tema', 'change_language': 'Cambiar Idioma'},
  };
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final themeController = Get.find<ThemeController>();
  final localizationController = Get.find<LocalizationController>();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 100, width: 300, color: beinsets(context).deviceColor),
            const Center(child: BeText.displayLarge('ABC')),
            Text(
              '${'current_theme'.tr}: ${themeController.themeMode.value.toString().split('.').last}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return BeText(themeController.breakpoint.value.toString(), type: BeTextType.headlineLarge);
            }),
            ElevatedButton(onPressed: themeController.toggleTheme, child: Text('change_theme'.tr)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Cycle through locales
                final currentIndex = localizationController.locales.indexOf(localizationController.locale.value);
                final int nextIndex = (currentIndex + 1) % localizationController.locales.length;
                localizationController.changeLocale(localizationController.locales[nextIndex]);
              },
              child: Text('change_language'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
