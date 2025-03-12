// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:becomponent/app/events.dart';
import 'package:becomponent/app/state.dart';
import 'package:becomponent/app/state_inherited.dart';
import 'package:becore/event.dart' show BeEventBus, EventAction;
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

  void _handleEvent(EventAction event) {
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
  }

  void _updateThemeMode(ThemeMode themeMode) {
    setState(() {
      _state = _state.copyWith(themeMode: themeMode);
    });
  }

  void _updateLocale(Locale locale) {
    setState(() {
      _state = _state.copyWith(locale: locale);
    });
  }

  @override
  Widget build(BuildContext context) =>
      AppStateInherited(appEventBus: appEventBus, state: _state, updateEvent: _handleEvent, child: widget.child);

  @override
  void dispose() {
    _eventSubscription.cancel(); // Cancel the subscription when the widget is disposed
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BeEventBus>('appEventBus', appEventBus));
  }
}
