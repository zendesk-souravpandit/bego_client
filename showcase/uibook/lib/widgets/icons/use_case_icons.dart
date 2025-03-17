import 'package:beui/be_icons.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icons List', type: BeIcons)
Widget redContainerUseCase(BuildContext context) => const Center(
  child: Icon(BeIcons.icon_youtube, color: Colors.red, size: 100),
);
