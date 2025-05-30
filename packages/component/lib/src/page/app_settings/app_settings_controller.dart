import 'package:becomponent/app.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/state/app_state.dart';
import 'package:becore/getx.dart';
import 'package:becore/modal.dart';
import 'package:flutter/material.dart' show ThemeMode;

class AppSettingsController extends BePageController<AppState> {
  // Reactive AppState observable

  final Rx<AppState> _state = AppState.initial().obs;
  final themeMode = Rx<ThemeMode>(ThemeMode.light);
  // Shortcut getter for current immutable state
  Rx<AppState> get appState => _state;

  @override
  AppState get state => _state.value;

  void toggleTheme() {
    final themeController = Get.find<AppThemeController>()..toggleTheme();
    themeMode.value = themeController.themeMode.value;
    _state.value = _state.value.copyWith(theme: themeMode.value.name);
  }

  @override
  void onInit() {
    super.onInit();
    // TODO : Load initial state from storage
    // For example, you might load from shared preferences or a database
    // final restoredState = state.copyWith(appTheme: themeMode.value.name);
    // if (_state.value.appTheme != themeMode.value.name) {
    //   toggleTheme();
    // }
    themeMode.value = _state.value.theme == ThemeMode.dark.name ? ThemeMode.dark : ThemeMode.light;

    change(SuccessStatus(_state.value));

    // Listen to state changes
    ever<AppState>(_state, (final newState) {
      // if (newState.appTheme != themeMode.value.name) {
      //   toggleTheme();
      // }
      // TODO: Handle state change logic here
      // Save when state changes, for example
      // saveStateToStorage(newState);
      print('AppState changed: ${newState.toJson()}');
    });
  }

  // Update any field using copyWith on state
  // void updateAppName(final String newName) {
  //   _state.value = _state.value.copyWith(appName: newName);
  // }

  // void updatePackage(final String newPackage) {
  //   _state.value = _state.value.copyWith(package: newPackage);
  // }

  // void updateVersion(final String newVersion) {
  //   state.value = state.value.copyWith(version: newVersion);
  // }

  void updateDeviceId(final String? deviceId) {
    _state.value = _state.value.copyWith(deviceId: deviceId);
  }

  void updateAppLocale(final KeyValueSS? locale) {
    print(locale?.toJson());
    _state.value = _state.value.copyWith(locale: locale);
  }

  void updateAppTheme(final String? theme) {
    _state.value = _state.value.copyWith(theme: theme);
  }

  // Load from JSON, replacing entire state
  void loadFromJson(final Map<String, dynamic> json) {
    _state.value = AppState.fromJson(json);
  }
}
