import 'package:becore/getx.dart';
import 'package:flutter/material.dart' show Locale;

class AppLocaleController extends GetxController {
  final locales = [const Locale('en', 'US'), const Locale('es', 'ES')];
  final locale = const Locale('en', 'US').obs;

  void changeLocale(final Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);
  }
}
