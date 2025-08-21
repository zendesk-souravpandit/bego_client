import 'package:beui/foundation.dart';
import 'package:beui/helper_ext.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeTappable', path: 'utils', type: BeTappable)
Widget useCaseTappableAnimation(final BuildContext context) => BeTappable.animated(
  builder:
      (final context, final data, final child) => Container(
        decoration: BoxDecoration(
          color:
              data.hovered
                  ? context.betheme.colors.primary
                  : BeColorUtils.createColorSwatchLevel(
                    context.betheme.colors.primary,
                    isDarkMode: context.betheme.colors.isDark,
                    level: ColorSwatchLevel.shade200,
                  ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: context.betheme.colors.warning),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: child!,
      ),
  child: const Text('Tappable'),
  onPress: () {},
);
