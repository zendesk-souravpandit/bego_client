import 'package:becomponent/app.dart' show AppEventAction;
import 'package:becomponent/src/app/state.dart';
import 'package:becore/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef EventActionHandler = void Function(AppEventAction action);

class AppStateProvider extends InheritedWidget {
  const AppStateProvider({
    required this.state,
    required this.appEventBus,
    required this.updateEvent,
    required super.child,
    super.key,
  });
  final BeEventBus appEventBus;
  final AppState state;
  final EventActionHandler updateEvent;

  // static AppStateProvider of(final BuildContext context) =>
  //     context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!;

  //  return listen
  //         ? context.dependOnInheritedWidgetOfExactType<BeStateContext<S, A>>()
  //         : context.getInheritedWidgetOfExactType<BeStateContext<S, A>>();
  static AppStateProvider of(final BuildContext context, {final bool listen = false}) =>
      context.getInheritedWidgetOfExactType<AppStateProvider>()!;

  @override
  bool updateShouldNotify(final AppStateProvider oldWidget) => oldWidget.state != state;

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AppState>('state', state))
      ..add(DiagnosticsProperty<BeEventBus>('appEvent', appEventBus))
      ..add(ObjectFlagProperty<EventActionHandler>.has('updateState', updateEvent));
  }
}
