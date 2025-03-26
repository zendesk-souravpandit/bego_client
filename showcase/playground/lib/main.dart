import 'package:becomponent/app.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:playground/be_box_decoration.dart';
import 'package:playground/be_box_shadow.dart';

void main() {
  runApp(const AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  const BegoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final betheme = context.betheme;
    final appState = AppStateProvider.of(context).state;
    // final appEvent = AppStateProvider.of(context).appEventBus;
    final updateEvent = AppStateProvider.of(context).updateEvent;
    // appEvent.on<UpdateLocaleEvent>().listen((event) {
    //   updateEvent(UpdateLocaleEvent(const Locale('fr', 'FR')));
    // });
    const BeTextVariant variant = BeTextVariant.primary;
    final (color, background) = variant.variantColor(betheme.colors);

    return MaterialApp(
      themeMode: appState.themeMode,
      theme: ThemeData(
        brightness:
            appState.themeMode == ThemeMode.light
                ? Brightness.light
                : Brightness.dark,
        extensions: [betheme],
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('BegoApp')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                updateEvent(
                  UpdateThemeModeEvent(
                    appState.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  ),
                );
              },
              child: const Text('Change Theme'),
            ),
            // Card(color: background, child: const BeText.headlineLarge('Hello', padding: EdgeInsets.all(10))),
            Center(
              child: Container(
                // color: background,
                decoration: BeBoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.blue],
                  ),
                  // shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    const BeBoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: BeText.headlineLarge(
                  'Hello',
                  variant: variant,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
