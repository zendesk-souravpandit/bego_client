import 'package:becomponent/app.dart';
import 'package:becomponent/services.dart';
import 'package:bego/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeApp(package: 'bego.app', routerDelegate: BegoAppDelegate());
  runApp(const BeApp());
}
