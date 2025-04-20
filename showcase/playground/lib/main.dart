import 'package:becomponent/app.dart';
import 'package:beui/overlay.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

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
      home: BeNotificationsProvider(
        child: Builder(
          builder: (context) {
            return Scaffold(
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
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          BeNotificationManager.of(
                            context,
                          ).show(const BeText.headlineLarge("Hello World"));
                        },
                        child: const Text('Regular Notifications'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final persistentKey = GlobalKey();
                          final container = MyNotificationContent(
                            persistentKey,
                          );
                          BeNotificationManager.of(
                            context,
                          ).show(container, key: persistentKey);
                        },
                        child: const Text('Notification'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final persistentKey = GlobalKey();
                          final container = MyNotificationContent2(
                            persistentKey,
                          );
                          BeNotificationManager.of(
                            context,
                          ).show(container, key: persistentKey);
                        },
                        child: const Text('Notification 2'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          BeNotificationManager.of(context).dismissAll();
                        },
                        child: const Text('Clear All Notifications'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          BeNotificationManager.of(
                            context,
                          ).dismissAllOfType(MyNotificationContent2);
                        },
                        child: const Text('Clear Type2 Notifications'),
                      ),
                    ),
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

class MyNotificationContent extends StatelessWidget {
  MyNotificationContent(this.persistentKey);

  final GlobalKey<State<StatefulWidget>> persistentKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BeTheme.of(context).colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text('This is my notification'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              BeNotificationManager.of(context).dismissByKey(persistentKey);
            },
          ),
        ],
      ),
    );
  }
}

class MyNotificationContent2 extends StatelessWidget {
  MyNotificationContent2(this.persistentKey);

  final GlobalKey<State<StatefulWidget>> persistentKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BeTheme.of(context).colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text('This is my notification 2'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              BeNotificationManager.of(context).dismissByKey(persistentKey);
            },
          ),
        ],
      ),
    );
  }
}
