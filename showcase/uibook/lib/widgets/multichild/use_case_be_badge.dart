import 'package:beui/be_icons.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Multi Child', path: 'multi-child', type: BeBadge)
Widget renderBeBadgeWidget(BuildContext context) {
  final BeBadgePosition position = context.knobs.list(label: 'Position', options: BeBadgePosition.values);
  final icon = context.knobs.list(
    label: 'Icon',
    options: [BeIcons.icon_notifications, BeIcons.icon_add, BeIcons.icon_circleci, BeIcons.icon_alert],
  );

  return BeBadge(
    position: position,
    badge: Icon(icon),
    child: const SizedBox(width: 100, height: 50, child: Card(child: Center(child: Text('Child')))),
  );
}
