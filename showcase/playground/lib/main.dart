import 'package:becomponent/app.dart';
import 'package:beui/overlay.dart';
import 'package:beui/screen.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  BegoApp({super.key});

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
      home: BeNotificationsProvider(
        child: Builder(
          builder: (context) {
            return Scaffold(
              // backgroundColor: Colors.green.shade100,
              // appBar: AppBar(title: const Text('BegoApp')),
              body: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  // borderRadius: const BeResponsiveUtil(100).radius(context),
                ),
                child: const BeResponsiveUtil(
                  400,
                  desktopFactor: 2,
                ).gap(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
