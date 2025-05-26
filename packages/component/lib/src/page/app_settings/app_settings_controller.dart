import 'package:becomponent/app.dart';
import 'package:becomponent/src/page/be_page_controller.dart';
import 'package:becomponent/src/state/app_state.dart';
import 'package:becore/getx.dart';

class AppSettingsController extends BePageController<AppState> {
  // Reactive AppState observable
  final Rx<AppState> _state = AppState.initial().obs;

  // Shortcut getter for current immutable state
  @override
  AppState get state => _state.value;

  void toggleTheme() {
    Get.find<AppThemeController>().toggleTheme();
    change(status is LoadingStatus ? SuccessStatus(state) : LoadingStatus());
  }

  @override
  void onInit() {
    super.onInit();
    change(SuccessStatus(state));

    // Listen to state changes
    ever<AppState>(_state, (final newState) {
      // TODO: Handle state change logic here
      // Save when state changes, for example
      // saveStateToStorage(newState);
      print('AppState changed: $newState');
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

  void updateAppLocale(final String? locale) {
    _state.value = _state.value.copyWith(appLocale: locale);
  }

  void updateAppTheme(final String? theme) {
    _state.value = _state.value.copyWith(appTheme: theme);
  }

  // Load from JSON, replacing entire state
  void loadFromJson(final Map<String, dynamic> json) {
    _state.value = AppState.fromJson(json);
  }
}
