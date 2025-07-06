import 'package:becomponent/services.dart';
import 'package:becomponent/src/app/be_app_controller.dart';
import 'package:becomponent/src/app/locale_controller.dart';
import 'package:becomponent/src/app/routes/be_app_route_delegates.dart';
import 'package:becomponent/src/app/theme_controller.dart';
import 'package:becomponent/src/page/app_settings/app_settings_controller.dart';
import 'package:becore/event.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

bool _isBeAppSetupCalled = false;

Future<bool> initBeApp({
  required final String package,
  required final BeAppRouteDelegate routerDelegate,
}) async {
  if (_isBeAppSetupCalled) {
    return Future.value(true);
  }
  _isBeAppSetupCalled = true;

  WidgetsFlutterBinding.ensureInitialized();
  final storageService = await BeStorageService(package).init();
  Get
    ..put<BeAppRouteDelegate>(routerDelegate, permanent: true)
    ..lazyPut<BeStorageService>(() => storageService, permanent: true)
    ..lazyPut<AppThemeController>(AppThemeController.new, permanent: true)
    ..lazyPut<AppLocaleController>(AppLocaleController.new, permanent: true)
    ..lazyPut<AppSettingsController>(AppSettingsController.new, permanent: true)
    ..lazyPut<BeAppController>(() => BeAppController(appDelegate: routerDelegate), permanent: true)
    ..lazyPut<BeEventBus>(() => BeEventBus.instance, permanent: true);

  return GetStorage(package).initStorage;
}
