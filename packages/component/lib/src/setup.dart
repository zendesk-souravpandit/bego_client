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
    ..lazyPut<BeStorageService>(() => storageService)
    ..lazyPut<AppThemeController>(AppThemeController.new)
    ..lazyPut<AppLocaleController>(AppLocaleController.new)
    ..lazyPut<AppSettingsController>(AppSettingsController.new)
    ..lazyPut<BeEventBus>(() => BeEventBus.instance);

  return GetStorage(package).initStorage;
}
