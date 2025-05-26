// import 'package:becomponent/src/app/_app/app_state.dart';
// import 'package:becore/event.dart';
// import 'package:becore/getx.dart';
// import 'package:beui/layout.dart';
// import 'package:beui/theme.dart';
// import 'package:flutter/material.dart';

// class AppStateController extends GetxController {
//   AppStateController(this.state);
//   late final _eventBus = BeEventBus();

//   final AppState state;

//   AppState get appState => state;
//   ThemeMode get themeMode => state.themeMode;
//   Locale get locale => state.locale;
//   BeBreakpoint get breakpoint => state.breakpoint;
//   BeThemeData get betheme => state.bethemeData;
//   String get isMobile => state.package;
//   BeResponsivePoints get isDesktop => state.responsivePoints;
//   String? get deviceId => state.deviceId;
//   String? get deviceName => state.version;

//   Stream<T> on<T extends EventAction>() => _eventBus.on<T>();
//   void fire<T>(final T event) => _eventBus.fire(event);

//   @override
//   void onClose() {
//     _eventBus.destroy();
//     super.onClose();
//   }

//   // Add any state management methods here
// }

// class AppThemeController extends GetxController {
//   // final Rx<BeThemeData> _bethemeMode = const BeThemeData.light().obs;
//   // late Rx<ThemeData> _themeMode;

//   // ThemeMode get themeMode => _bethemeMode.value.themeMode;

//   // void toggleTheme() {
//   //   if (_bethemeMode.value.themeMode == ThemeMode.light) {
//   //     _bethemeMode.value = const BeThemeData.dark();
//   //   } else {
//   //     _bethemeMode.value = const BeThemeData.light();
//   //   }
//   //   _themeMode.value = ThemeData(
//   //     brightness:
//   //         _bethemeMode.value.themeMode == ThemeMode.light
//   //             ? Brightness.light
//   //             : Brightness.dark,
//   //   );
//   // }
// }

// class AppLocaleController extends GetxController {
//   final Rx<Locale> _locale = const Locale('en', 'US').obs;

//   Locale get locale => _locale.value;

//   void changeLanguage(final Locale newLocale) {
//     _locale.value = newLocale;
//     Get.updateLocale(newLocale);
//   }
// }

// // TODO: Make it network service
// // class EventBusService extends GetxService {
// //   final _eventBus = BeEventBus();

// //   Stream<T> on<T extends EventAction>() => _eventBus.on<T>();
// //   void fire<T>(T event) => _eventBus.fire(event);

// //   @override
// //   void onClose() {
// //     _eventBus.destroy();
// //     super.onClose();
// //   }
// // }
