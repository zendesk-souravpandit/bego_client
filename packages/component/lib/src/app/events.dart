import 'package:becore/event.dart' show EventAction;
import 'package:flutter/material.dart';

base class AppEventAction extends EventAction {}

/// Base class for all events.

/// Event to update the theme mode.
final class UpdateThemeModeEvent extends AppEventAction {
  UpdateThemeModeEvent(this.themeMode);
  final ThemeMode themeMode;
}

/// Event to update the locale.
final class UpdateLocaleEvent extends AppEventAction {
  UpdateLocaleEvent(this.locale);
  final Locale locale;
}

// /// Event to update the screen width (e.g., on resize or rotation).
// final class UpdateScreenWidthEvent extends EventAction {
//   UpdateScreenWidthEvent(this.name);
//   final double name;
// }
