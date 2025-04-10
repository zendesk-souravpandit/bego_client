import 'package:becomponent/app.dart';
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
    final betheme = context.betheme;
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
            // Center(
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     decoration: const ShapeDecoration(
            //       shape: BeIconShapeBorder(
            //         iconData: Icons.import_contacts_sharp,
            //         iconSize: 32,
            //         roundRadius: 8,
            //         borderColor: Colors.red,
            //         borderWidth: 2,
            //         iconAlignment: BeIconAlignment.bottomLeft,
            //         iconOffset: Offset(
            //           -100,
            //           10,
            //         ), // Adjust icon position slightly inward
            //       ),
            //     ),
            //     child: const Center(
            //       child: Text("Hello", style: TextStyle(color: Colors.green)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
// ---  be_icon_outline_border.dart ---
// import 'package:bego_ui/src/ui_const/bego_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:widgetbook/widgetbook.dart';
// import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(
//   name: 'Icon Outlined Border',
//   path: 'Outlined Border',
//   type: BeIconOutlinedBorder,
// )
// Widget useCaseBeIconOutlinedBorder(BuildContext context) {
  // final iconData = context.knobs.list(
  //   label: 'Icon',
  //   options: [
  //     const KnobOption(label: 'Home', value: Icons.home),
  //     const KnobOption(label: 'Settings', value: Icons.settings),
  //     const KnobOption(label: 'Favorite', value: Icons.favorite),
  //     const KnobOption(label: 'Search', value: Icons.search),
  //   ],
  //   labelBuilder: (value) => value.label,
  // );

  // final iconSize = context.knobs.doubleOrNull.slider(
  //   label: 'Icon Size',
  //   min: 16,
  //   max: 48,
  //   initialValue: 24,
  // ) ?? 24.0;

  // final roundRadius = context.knobs.doubleOrNull.slider(
  //   label: 'Border Radius',
  //   min: 0,
  //   max: 24,
  //   initialValue: 4,
  // ) ?? 4.0;

  // final borderColor = context.knobs.list(
  //   label: 'Border Color',
  //   options: [
  //     const KnobOption(label: 'Primary', value: BegoColors.primary),
  //     const KnobOption(label: 'Red', value: Colors.red),
  //     const KnobOption(label: 'Green', value: Colors.green),
  //     const KnobOption(label: 'Blue', value: Colors.blue),
  //   ],
  //   labelBuilder: (value) => value.label,
  // );

//   return Center(
//     child: Container(
//       width: 42,
//       height: 42,
//       decoration: const ShapeDecoration(
//         shape: BeIconOutlinedBorder(
//           iconData: Icons.import_contacts_sharp,
//           iconSize: 32,
//           roundRadius: 8,
//           borderColor: Colors.red,
//         ),
//       ),
//       child: Container(
//         color: Colors.blue,
//         child: const Center(child: BeText("Hello", color: Colors.green)),
//       ),

//       // child: const Center(child: Text('Content inside the border')),
//     ),
//   );
// }

// -- be_icon_outline_border.dart --