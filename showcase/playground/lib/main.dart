import 'package:becomponent/app.dart';
import 'package:becore/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppStateWrapper(child: BegoApp()));
}

class BegoApp extends StatelessWidget {
  const BegoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateInherited.of(context).state;
    final appEvent = AppStateInherited.of(context).appEventBus;
    final updateEvent = AppStateInherited.of(context).updateEvent;
    appEvent.on<UpdateLocaleEvent>().listen((event) {
      updateEvent(UpdateLocaleEvent(const Locale('fr', 'FR')));
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('BegoApp')),
        body: Center(
          child: Column(
            children: [
              Text('Screen Locale: ${appState.locale}'),
              Text('Screen Width: ${appState.screenWidth}'),
              Text('Screen breakpoint: ${appState.breakpoint}'),
              ElevatedButton(
                onPressed: () {
                  appEvent.fire(UpdateLocaleEvent(const Locale('fr', 'FR')));
                },
                child: const Text('Press Me'),
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
          children: <Widget>[const Text('You have pushed the button this many times:'), Text(numberRound.toString())],
        ),
      ),
    );
  }
}
