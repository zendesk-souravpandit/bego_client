import 'package:becomponent/src/state/list_tile_item.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key, required this.model});

  final ListTileItem model;

  @override
  Widget build(final BuildContext context) {
    final isDarkMode = becolors(context).isDark;
    return ListTile(
      leading: Container(
        padding: p8,
        decoration: ShapeDecoration(
          color: Color(stringToColor(model.icon.toString(), lightTone: !isDarkMode)),
          shape: const RoundedSuperellipseBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Icon(
          model.icon,
          color: isDarkMode ? BeColors.slate200 : BeColors.slate700,
          size: 24,
        ),
      ),
      title: BeText.bodyMedium(model.title),
      subtitle: BeText.bodySmall(model.subtitle, color: BeColors.gray400),
      onTap: model.onTap ?? () {},
      trailing:
          model.trailing ?? (model.onTap != null ? const Icon(BeIcons.icon_chevron_right) : null),
    );
  }
}
