import 'package:becomponent/src/app/theme_controller.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, Widget, LayoutBuilder, BuildContext, WidgetsBinding;

class AppResponsiveWrapper extends StatelessWidget {
  const AppResponsiveWrapper({super.key, required this.child, required this.responsivePoints});
  final Widget child;
  final BeResponsivePoints responsivePoints;

  @override
  Widget build(final BuildContext context) {
    final themeController = Get.find<AppThemeController>();

    return LayoutBuilder(
      builder: (final context, final constraints) {
        final width = constraints.maxWidth;
        final breakpoint = calculateBreakpoint(width, responsivePoints);
        if (themeController.breakpoint.value != breakpoint) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            themeController.setBreakpoint(breakpoint);
          });
        }

        return child;
      },
    );
  }
}
