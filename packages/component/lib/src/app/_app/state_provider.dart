// import 'package:becomponent/src/app/_app/app_state.dart';
// import 'package:becomponent/src/app/_app/events.dart';
// import 'package:becore/event.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// typedef EventActionHandler = void Function(AppEventAction action);

// class AppStateProvider extends InheritedWidget {
//   const AppStateProvider({
//     required this.state,
//     required this.appEventBus,
//     required this.updateEvent,
//     required super.child,
//     super.key,
//   });
//   final BeEventBus appEventBus;
//   final AppState state;
//   final EventActionHandler updateEvent;

//   static AppStateProvider of(final BuildContext context) {
//     final provider = context.dependOnInheritedWidgetOfExactType<AppStateProvider>();
//     assert(provider != null, 'No AppStateProvider found in context');
//     return provider!;
//   }

//   @override
//   bool updateShouldNotify(final AppStateProvider oldWidget) => oldWidget.state != state;

//   @override
//   void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty<AppState>('state', state))
//       ..add(DiagnosticsProperty<BeEventBus>('appEvent', appEventBus))
//       ..add(ObjectFlagProperty<EventActionHandler>.has('updateState', updateEvent));
//   }
// }
