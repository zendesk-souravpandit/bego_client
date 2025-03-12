import 'package:becomponent/src/app/state.dart';
import 'package:becore/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef EventActionHandler = void Function(EventAction action);

class AppStateInherited extends InheritedWidget {
  const AppStateInherited({
    required this.state,
    required this.appEventBus,
    required this.updateEvent,
    required super.child,
    super.key,
  });
  final BeEventBus appEventBus;
  final AppState state;
  final EventActionHandler updateEvent;

  static AppStateInherited of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppStateInherited>()!;

  @override
  bool updateShouldNotify(AppStateInherited oldWidget) => oldWidget.state != state;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppState>('state', state))
      ..add(DiagnosticsProperty<BeEventBus>('appEvent', appEventBus))
      ..add(ObjectFlagProperty<EventActionHandler>.has('updateState', updateEvent));
  }
}
