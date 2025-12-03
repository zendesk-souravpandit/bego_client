import 'package:becomponent/src/app/theme_controller.dart';
import 'package:becore/getx.dart';
import 'package:beui/layout.dart';
import 'package:flutter/material.dart';

class AppResponsiveWrapper extends StatefulWidget {
  const AppResponsiveWrapper({super.key, required this.child, required this.responsivePoints});
  final Widget child;
  final BeResponsivePoints responsivePoints;

  @override
  State<AppResponsiveWrapper> createState() => _AppResponsiveWrapperState();
}

class _AppResponsiveWrapperState extends State<AppResponsiveWrapper> {
  late final AppThemeController _themeController;
  BeBreakpoint? _lastBreakpoint;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _themeController = Get.find<AppThemeController>();
  }

  void _updateBreakpointIfNeeded(final BeBreakpoint breakpoint) {
    // Avoid redundant updates and prevent concurrent updates
    if (_lastBreakpoint == breakpoint || _isUpdating) return;

    _isUpdating = true;
    _lastBreakpoint = breakpoint;

    // Always schedule after frame to ensure GetX is fully initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _themeController.setBreakpoint(breakpoint);
        _isUpdating = false;
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        final breakpoint = calculateBreakpoint(constraints.maxWidth, widget.responsivePoints);
        _updateBreakpointIfNeeded(breakpoint);
        return widget.child;
      },
    );
  }
}
