import 'package:becomponent/app.dart';
import 'package:becomponent/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initBeApp(package: 'demo.app');
  runApp(const BeApp());
}
