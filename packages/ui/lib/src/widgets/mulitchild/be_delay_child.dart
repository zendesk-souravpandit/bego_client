// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

/// Controller for managing overlay entries with context control
class BeOverlayController {
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  bool _isShowing = false;

  /// Check if overlay is currently showing
  bool get isShowing => _isShowing;

  /// Show overlay with the given widget
  void show(final BuildContext context, final Widget child, {final Alignment alignment = Alignment.center}) {
    if (_isShowing) {
      return;
    }

    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (final BuildContext context) => Positioned.fill(child: Align(alignment: alignment, child: child)),
    );

    _overlayState?.insert(_overlayEntry!);
    _isShowing = true;
  }

  /// Show overlay with custom builder for full control
  void showCustom(final BuildContext context, final Widget Function(BuildContext) builder) {
    if (_isShowing) {
      return;
    }

    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: builder);

    _overlayState?.insert(_overlayEntry!);
    _isShowing = true;
  }

  /// Hide the overlay
  void hide() {
    if (!_isShowing) {
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = null;
    _overlayState = null;
    _isShowing = false;
  }

  /// Dispose and clean up resources
  void dispose() {
    hide();
  }
}

/// Widget that automatically manages an overlay with a controller
class BeDrawOver extends StatefulWidget {
  const BeDrawOver({
    super.key,
    required this.child,
    this.controller,
    this.autoShow = false,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final BeOverlayController? controller;
  final bool autoShow;
  final Alignment alignment;

  @override
  State<BeDrawOver> createState() => _BeDrawOverState();
}

class _BeDrawOverState extends State<BeDrawOver> {
  late BeOverlayController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BeOverlayController();

    if (widget.autoShow) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.show(context, widget.child, alignment: widget.alignment);
        }
      });
    }
  }

  @override
  void dispose() {
    // Only dispose if we created the controller internally
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    // Return an empty container since the actual content is shown in overlay
    return const SizedBox.shrink();
  }
}
