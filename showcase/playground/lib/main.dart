import 'package:becomponent/app.dart';
import 'package:beui/decoration.dart';
import 'package:beui/overlay.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:playground/notification.main.dart';

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
            final _formKey = GlobalKey<FormState>();
            return Scaffold(
              // backgroundColor: Colors.green.shade100,
              // appBar: AppBar(title: const Text('BegoApp')),
              body: Column(
                children: [
                  Form(
                    key: _formKey,

                    child: Container(
                      padding: p32,
                      child: BeFormField<String>(
                        title: 'Username',
                        helperText: 'Enter your username',
                        trailingTitleWidgets: [
                          const Icon(Icons.info_outline, size: 16),
                        ],
                        build:
                            (field) => TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Type here...',
                              ),
                              onChanged: field.didChange,
                            ),
                        validator:
                            (value) =>
                                value?.isEmpty ?? true ? 'Required' : null,
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    child: const Text("Hello"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      // final value = _formKey.currentState?.value;
                      // debugPrint("value: $value");
                    },
                    child: const Text("reset"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
