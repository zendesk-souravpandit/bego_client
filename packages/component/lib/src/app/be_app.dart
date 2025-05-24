import 'package:becomponent/app.dart';
import 'package:becomponent/src/app/app_controllers.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class BeApp extends StatelessWidget {
  const BeApp({super.key});

  @override
  Widget build(final BuildContext context) {
    Get
      ..put(AppStateController(AppState.initial()), permanent: true)
      ..put(AppThemeController(), permanent: true)
      ..put(AppLocaleController(), permanent: true);
    return const Placeholder();
  }
}
