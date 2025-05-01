import 'package:becomponent/app.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/from.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  BegoApp({super.key});

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
      home: BeNotificationsProvider(
        child: Builder(
          builder: (context) {
            return Scaffold(
              // backgroundColor: Colors.green.shade100,
              // appBar: AppBar(title: const Text('BegoApp')),
              body: Container(
                padding: p20,
                alignment: Alignment.center,

                child: Container(
                  // child: BeFormField(
                  //   title:
                  //       'Form Field lorm ipsum dolor sit amet consectetur adipiscing elit.',
                  //   startEndAxisAlignment: CrossAxisAlignment.center,
                  //   helperStyle: const TextStyle(
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  //   helperText: 'Helper Text',

                  //   trailingTitleWidgets: [
                  //     const Icon(BeIcons.icon_abstract, size: 12),
                  //   ],
                  //   trailingHelperWidgets: [
                  //     const Icon(BeIcons.icon_abstract),

                  //     const Icon(BeIcons.icon_abstract),
                  //   ],
                  //   startWidgets: [
                  //     const Icon(BeIcons.icon_abstract),
                  //     const Icon(BeIcons.icon_abstract),
                  //   ],
                  //   endWidgets: [
                  //     const Icon(BeIcons.icon_abstract),
                  //     const Icon(BeIcons.icon_abstract),
                  //   ],
                  //   build: (form) {
                  //     return TextFormField(
                  //       enabled: false,
                  //       forceErrorText: "Hello",
                  //       initialValue: "Abc",
                  //       onChanged: form.didChange,
                  //       // decoration: const InputDecoration(
                  //       //   fillColor: BeColors.gray200,
                  //       // ),
                  //       // forceErrorText: "Hello",
                  //     );
                  //   },
                  // ),
                  //  ------------------------------------
                  child: Column(
                    spacing: 10,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BeNumberFormField(
                        initialValue: 0,
                        validationError: "Hello",
                      ),
                      ElevatedButton(
                        onPressed: onPressed,
                        child: const Text("Hello"),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(BeIcons.icon_check),
                              Text("Hello"),
                              Icon(BeIcons.icon_check),
                            ],
                          ),
                        ),
                      ),
                      // IconButton.filled(
                      //   onPressed: onPressed,
                      //   icon: const Icon(BeIcons.icon_play_button),
                      // ),
                    ],
                  ),
                  //  ------------------------------------
                  // child: const ColorSchemeDisplay(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
