import 'package:beui/be_icons.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgets/icons/icons_list.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(name: 'Icons', path: 'Widget', type: BeIcons)
// Widget redContainerUseCase(BuildContext context) =>
//  const Icon(BeIcons.icon_youtube, color: Colors.red, size: 100);

@widgetbook.UseCase(name: 'Icons', path: 'widget', type: BeIcons)
Widget useCaseBeIconsList(BuildContext context) {
  final color = context.knobs.colorOrNull(label: "Color");
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
    ),
    itemCount: begoIcons.length,
    itemBuilder: (_, index) {
      final icon = begoIcons[index];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon.data, size: 32, color: color),
          const SizedBox(height: 10),
          Text(icon.name),
        ],
      );
    },
  );
}
