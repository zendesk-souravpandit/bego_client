// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:becomponent/src/app/app_state.dart';
import 'package:becomponent/src/app/events.dart';
import 'package:becomponent/src/app/state_provider.dart';
import 'package:becore/event.dart' show BeEventBus, EventAction;
import 'package:beui/layout.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppStateWrapper extends StatefulWidget {
  const AppStateWrapper({required this.child, super.key});
  final Widget child;

  @override
  _AppStateWrapperState createState() => _AppStateWrapperState();
}

class _AppStateWrapperState extends State<AppStateWrapper> {
  AppState _state = AppState.initial();
  late final BeEventBus appEventBus = BeEventBus();
  late StreamSubscription<EventAction> _eventSubscription;

  void _handleEvent(final AppEventAction event) {
    setState(() {
      switch (event) {
        case UpdateThemeModeEvent(themeMode: final themeMode):
          _updateThemeMode(themeMode);
        case UpdateLocaleEvent(locale: final locale):
          _updateLocale(locale);
        default:
          assert(false, 'Unknown event: $event');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _eventSubscription = appEventBus.on<AppEventAction>().listen(_handleEvent);
  }

  void _updateThemeMode(final ThemeMode themeMode) {
    final newThemeData = _createThemeData(themeMode: themeMode, breakpoint: _state.breakpoint);
    _updateState(_state.copyWith(themeMode: themeMode, bethemeData: newThemeData));
  }

  void _updateLocale(final Locale locale) => _updateState(_state.copyWith(locale: locale));

  void _updateScreenWidth() {
    final screenWidth = MediaQuery.of(context).size.width;
    final newBreakpoint = calculateBreakpoint(screenWidth, _state.responsivePoints);

    final newThemeData = _createThemeData(themeMode: _state.themeMode, breakpoint: newBreakpoint);

    _updateState(_state.copyWith(screenWidth: screenWidth, breakpoint: newBreakpoint, bethemeData: newThemeData));
  }

  BeThemeData _createThemeData({required final ThemeMode themeMode, required final BeBreakpoint breakpoint}) {
    final insets = getStyleValue(breakpoint);
    final colors = themeMode == ThemeMode.light ? const BeColorsLight() : const BeColorsDark();
    final style =
        themeMode == ThemeMode.light
            ? BeStyleLight(color: colors, inset: insets)
            : BeStyleDark(color: colors, inset: insets);

    return BeThemeData(breakpoint: breakpoint, styleValue: insets, colors: colors, style: style, themeMode: themeMode);
  }

  void _updateState(final AppState newState) => setState(() => _state = newState);

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
    builder: (final context, final constraints) {
      // Update screen width whenever the layout changes
      if (_state.screenWidth != constraints.maxWidth) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _updateScreenWidth());
      }

      // final brightness = MediaQuery.platformBrightnessOf(context);
      return BeTheme(
        betheme: _state.bethemeData,
        child: AppStateProvider(
          appEventBus: appEventBus,
          state: _state,
          updateEvent: _handleEvent,
          child: widget.child,
        ),
      );
    },
  );

  @override
  void dispose() {
    _eventSubscription.cancel(); // Cancel the subscription when the widget is disposed
    super.dispose();
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BeEventBus>('appEventBus', appEventBus));
  }
}
