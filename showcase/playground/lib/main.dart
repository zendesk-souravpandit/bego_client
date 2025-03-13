import 'package:becomponent/app.dart';
import 'package:becore/utils.dart';
import 'package:beui/screen.dart';
import 'package:beui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  const BegoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final betheme = context.betheme;
    final appState = AppStateProvider.of(context).state;
    final appEvent = AppStateProvider.of(context).appEventBus;
    final updateEvent = AppStateProvider.of(context).updateEvent;
    appEvent.on<UpdateLocaleEvent>().listen((event) {
      updateEvent(UpdateLocaleEvent(const Locale('fr', 'FR')));
    });
    return MaterialApp(
      themeMode: appState.themeMode,
      theme: ThemeData(
        brightness: appState.themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
        extensions: [betheme],
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('BegoApp')),
        body: Center(
          child: Column(
            children: [
              Text('App Theme: $betheme + ${appState.themeMode}'),
              Text('Screen Locale: ${appState.locale}'),
              Text('Screen Width: ${appState.screenWidth}'),
              Text('Screen breakpoint: ${appState.breakpoint}'),
              switch (context.breakpoint) {
                BeBreakpoint.xs => const Text('Extra Small Layout'),
                BeBreakpoint.sm => const Text('Small Layout'),
                BeBreakpoint.md => const Text('Medium Layout'),
                BeBreakpoint.lg => const Text('Large Layout'),
                BeBreakpoint.xl => const Text('Extra Large Layout'),
                BeBreakpoint.xl2 => const Text('Extra Extra Large Layout'),
              },
              ElevatedButton(
                onPressed: () {
                  appEvent.fire(UpdateLocaleEvent(const Locale('fr', 'FR')));
                },
                child: const Text('Press Me'),
              ),
              ElevatedButton(
                onPressed: () {
                  appEvent.fire(
                    UpdateThemeModeEvent(appState.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light),
                  );
                },
                child: const Text('Change Theme'),
              ),

              ElevatedButton(
                onPressed: () {
                  updateEvent(UpdateLocaleEvent(const Locale('abaac', 'US')));
                },
                child: const Text('Reset Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final numberRound = BeMathUtils.roundToDecimalPlaces(1.2345, 2);

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('You have pushed the button this many times:'), Text(numberRound.toString())],
        ),
      ),
    );
  }
}
