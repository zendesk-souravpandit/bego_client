import 'package:becomponent/app.dart';
import 'package:becomponent/services.dart';
import 'package:becore/event.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

bool _isBeAppSetupCalled = false;

Future<bool> initBeApp({required final String package}) async {
  if (_isBeAppSetupCalled) {
    return Future.value(true);
  }
  _isBeAppSetupCalled = true;

  WidgetsFlutterBinding.ensureInitialized();
  final storageService = await BeStorageService(package).init();
  Get
    ..lazyPut<BeStorageService>(() => storageService, permanent: true)
    ..lazyPut<AppThemeController>(AppThemeController.new, permanent: true)
    ..lazyPut<AppLocaleController>(AppLocaleController.new, permanent: true)
    ..lazyPut<AppSettingsController>(AppSettingsController.new, permanent: true)
    ..lazyPut<BeAppController>(BeAppController.new, permanent: true)
    ..lazyPut<BeEventBus>(() => BeEventBus.instance, permanent: true);

  return GetStorage(package).initStorage;
}
