import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'BeIconShapeBorder',
  path: 'decoration',
  type: BeIconShapeBorder,
)
Widget useCaseBeIcon(BuildContext context) => Center(
  child: Container(
    width: 400,
    height: 100,
    decoration: const ShapeDecoration(
      shape: BeIconShapeBorder(
        icon: BeIcons.icon_file_add,
        size: 24,
        color: Colors.green,
        iconStyle: TextStyle(color: Colors.red, fontSize: 16),
        radius: 8,
        width: 1,
        alignment: BeIconAlignment.centerRight,
      ),
    ),
    child: const Center(
      child: Text("Hello", style: TextStyle(color: Colors.green)),
    ),
  ),
);
