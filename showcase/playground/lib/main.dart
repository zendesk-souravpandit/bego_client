import 'package:becomponent/app.dart';
import 'package:beui/decoration.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class KnobOption<T> {
  const KnobOption({required this.label, required this.value});
  final String label;
  final T value;
}

void main() {
  runApp(const AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  const BegoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final betheme = context.betheme;
    final appState = AppStateProvider.of(context).state;
    // final appEvent = AppStateProvider.of(context).appEventBus;
    final updateEvent = AppStateProvider.of(context).updateEvent;
    // appEvent.on<UpdateLocaleEvent>().listen((event) {
    //   updateEvent(UpdateLocaleEvent(const Locale('fr', 'FR')));
    // });
    // const BeTextVariant variant = BeTextVariant.primary;
    // final (color, background) = variant.variantColor(betheme.colors);

    return MaterialApp(
      themeMode: appState.themeMode,
      theme: BeTheme.buildThemeof(context),
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
                width: 500,
                height: 500,
                padding: pt12 + px12,
                decoration: const ShapeDecoration(
                  shape: BeveledRectangleBorder(
                    side: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: const Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: ExpansionTile(
                    //     title: Text("Notifications"),

                    //     children: [
                    //       ListTile(title: Text("Email Notifications")),
                    //       ListTile(title: Text("Push Notifications")),
                    //     ],
                    //   ),
                    // ),
                    TextField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ExpansionTile buildCustomExpansionTile({
//   required String title,
//   required List<Widget> children,
//   bool initiallyExpanded = false,
//   EdgeInsetsGeometry? childrenPadding,
// }) {
//   return ExpansionTile(
//     title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//     initiallyExpanded: initiallyExpanded,
//     childrenPadding: childrenPadding ?? const EdgeInsets.all(16),
//     children: children,
//   );
// }
