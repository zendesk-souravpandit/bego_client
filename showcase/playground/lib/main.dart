import 'package:becomponent/app.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:playground/use_case_network_service.dart';

void main() {
  runApp(const AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  const BegoApp({super.key});

  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    // final betheme = context.betheme;
    final appState = AppStateProvider.of(context).state;
    // final appEvent = AppStateProvider.of(context).appEventBus;
    // final updateEvent = AppStateProvider.of(context).updateEvent;
    // appEvent.on<UpdateLocaleEvent>().listen((event) {
    //   updateEvent(UpdateLocaleEvent(const Locale('fr', 'FR')));
    // });
    // const BeTextVariant variant = BeTextVariant.primary;
    // final (color, background) = variant.variantColor(betheme.colors);

    return MaterialApp(
      themeMode: appState.themeMode,
      theme: BeTheme.buildThemeof(context),
      home: BeNetworkServiceDemo(),
    );
  }
}
