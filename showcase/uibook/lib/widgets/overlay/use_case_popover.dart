import 'package:beui/be_icons.dart';
import 'package:beui/helper_ext.dart';
import 'package:beui/overlay.dart';
import 'package:beui/text.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgets/buttons/use_case_icon_text_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BePopover', path: 'widget/overlay', type: BePopover)
Widget useCasePopover(BuildContext context) => const PopoverDemo();

class PopoverDemo extends StatefulWidget {
  const PopoverDemo({super.key});

  @override
  State<PopoverDemo> createState() => _PopoverDemoState();
}

class _PopoverDemoState extends State<PopoverDemo> with SingleTickerProviderStateMixin {
  late final BePopoverController controller = BePopoverController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BePopover(
          controller: controller,
          autofocus: true,
          childAnchor: Alignment.bottomRight,
          popoverAnchor: Alignment.topRight,
          child: BeIconTextButton(
            direction: BeIconDirection.left,
            buttonIcon: const Icon(BeIcons.icon_fi_rr_menu_dots, size: 32),
            buttonText: const BeText("Menu", padding: EdgeInsets.symmetric(horizontal: 4)),
            onPressed: () {
              controller.show();
            },
          ),
          popoverBuilder: (BuildContext context, BoxDecoration value, Widget? child) {
            return Container(
              color: ColorUtils.createColorSwatchLevel(
                context.betheme.colors.background,
                isDarkMode: context.betheme.colors.isDark,
                level: ColorSwatchLevel.shade50,
              ),
              width: 200,
              height: 200,
              child: const Center(child: Text("Popover")),
            );
          },
        ),
      ],
    );
  }
}
