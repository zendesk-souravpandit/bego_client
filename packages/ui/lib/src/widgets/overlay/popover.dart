// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/decoration.dart';
import 'package:beui/src/layouts/portal/portal.dart';
import 'package:beui/src/layouts/portal/portal_shift.dart';
import 'package:beui/src/layouts/rendering.dart' show Alignments;
import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:beui/src/widgets/foundation/be_tappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A controller that controls whether a [BePopover] is shown or hidden.
final class BePopoverController extends ChangeNotifier {
  /// Creates a [BePopoverController] with the given [vsync] and animation [animationDuration].
  BePopoverController({
    required final TickerProvider vsync,
    final Duration animationDuration = const Duration(milliseconds: 100),
  }) {
    _animation = AnimationController(vsync: vsync, duration: animationDuration);
    _fade = _fadeTween.animate(_animation);
    _scale = _scaleTween.animate(_animation);
  }
  static final _fadeTween = Tween<double>(begin: 0, end: 1);
  static final _scaleTween = Tween<double>(begin: 0.95, end: 1);

  final OverlayPortalController _overlay = OverlayPortalController();
  late final AnimationController _animation;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  /// Convenience method for toggling the current [shown] status.
  ///
  /// This method should typically not be called while the widget tree is being rebuilt.
  Future<void> toggle() async => shown ? hide() : show();

  /// Shows the popover.
  ///
  /// If [shown] is already true, calling this method brings the popover it controls to the top.
  ///
  /// This method should typically not be called while the widget tree is being rebuilt.
  Future<void> show() async {
    _overlay.show();
    await _animation.forward();
    notifyListeners();
  }

  /// Hides the popover.
  ///
  /// Once hidden, the popover will be removed from the widget tree the next time the widget tree rebuilds, and stateful
  /// widgets in the popover may lose states as a result.
  ///
  /// This method should typically not be called while the widget tree is being rebuilt.
  Future<void> hide() async {
    await _animation.reverse();
    _overlay.hide();
    notifyListeners();
  }

  /// True if the popover is currently being shown. False if it is hidden.
  bool get shown => _overlay.isShowing;

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

/// The regions that can be tapped to hide a popover.
enum BeHidePopoverRegion {
  /// The entire screen, excluding the popover.
  anywhere,

  /// The entire screen, excluding the target and popover.
  excludeTarget,

  /// Disables tapping outside of the popover to hide it.
  none,
}

/// A popover displays rich content in a portal that is aligned to a child.
class BePopover extends StatefulWidget {
  /// Creates a popover that only shows the popover when the controller is manually toggled.
  BePopover({
    required BePopoverController this.controller,
    required this.popoverBuilder,
    required this.child,
    this.shift = FPortalShift.flip,
    this.hideOnTapOutside = BeHidePopoverRegion.anywhere,
    this.directionPadding = false,
    this.isChildWidth = false,
    this.semanticLabel,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.decoration,
    final AlignmentGeometry? popoverAnchor,
    final AlignmentGeometry? childAnchor,
    super.key,
  }) : popoverAnchor = popoverAnchor ?? defaultPlatform.popover,
       childAnchor = childAnchor ?? defaultPlatform.child,
       _automatic = false;

  /// Creates a popover that is automatically shown when the [child] is tapped.
  ///
  /// The implementation intelligently detects whether the [child] has its own gesture detector
  /// (like buttons) and adapts the gesture handling accordingly to avoid conflicts.
  ///
  /// For widgets with existing gesture detectors (buttons, InkWell, etc.), both the widget's
  /// onPressed callback AND the popover will be triggered.
  ///
  /// For plain widgets without gesture detectors, only the popover will be shown.
  ///
  /// It is safe to use [child] widgets that contain [GestureDetector], [ElevatedButton],
  /// [OutlinedButton], [TextButton], [IconButton], [InkWell], or [BeTappable].
  BePopover.automatic({
    required this.popoverBuilder,
    required this.child,
    this.controller,
    this.shift = FPortalShift.flip,
    this.hideOnTapOutside = BeHidePopoverRegion.excludeTarget,
    this.directionPadding = false,
    this.isChildWidth = false,
    this.autofocus = false,
    this.focusNode,
    this.decoration,
    this.onFocusChange,
    this.semanticLabel,
    final AlignmentGeometry? popoverAnchor,
    final AlignmentGeometry? childAnchor,
    super.key,
  }) : popoverAnchor = popoverAnchor ?? defaultPlatform.popover,
       childAnchor = childAnchor ?? defaultPlatform.child,
       _automatic = true;

  /// The platform-specific default popover and child anchors.
  static ({Alignment popover, Alignment child}) get defaultPlatform => BeTouch.primary
      ? (popover: Alignment.bottomCenter, child: Alignment.topCenter)
      : (popover: Alignment.topCenter, child: Alignment.bottomCenter);

  /// The controller that shows and hides the popover. It initially hides the popover.
  final BePopoverController? controller;

  /// {@template forui.widgets.BePopover.popoverAnchor}
  /// The point on the popover (floating content) that connects with the child, at the child's anchor.
  ///
  /// For example, [Alignment.topCenter] means the top-center point of the popover will connect with the child.
  /// See [childAnchor] for changing the child's anchor.
  /// {@endtemplate}
  ///
  /// Defaults to [Alignment.bottomCenter] on Android and iOS, and [Alignment.topCenter] on all other platforms.
  final AlignmentGeometry popoverAnchor;

  /// {@template forui.widgets.BePopover.childAnchor}
  /// The point on the child that connects with the popover, at the popover's anchor.
  ///
  /// For example, [Alignment.bottomCenter] means the bottom-center point of the child will connect with the popover.
  /// See [popoverAnchor] for changing the popover's anchor.
  /// {@endtemplate}
  ///
  /// Defaults to [Alignment.topCenter] on Android and iOS, and [Alignment.bottomCenter] on all other platforms.
  final AlignmentGeometry childAnchor;

  final BeBoxDecoration? decoration;

  /// {@template forui.widgets.BePopover.shift}
  /// The shifting strategy used to shift a popover when it overflows out of the viewport. Defaults to
  /// [FPortalShift.flip].
  ///
  /// See [FPortalShift] for more information on the different shifting strategies.
  /// {@endtemplate}
  final Offset Function(Size, FPortalChildBox, FPortalBox) shift;

  /// {@template forui.widgets.BePopover.hideOnTapOutside}
  /// The region that can be tapped to hide the popover.
  /// {@endtemplate}
  final BeHidePopoverRegion hideOnTapOutside;

  /// {@template forui.widgets.BePopover.directionPadding}
  /// True if the popover should include the cross-axis padding of the anchor when aligning to it. Defaults to false.
  ///
  /// Diagonal corners are ignored.
  /// {@endtemplate}
  final bool directionPadding;

  /// {@template forui.widgets.BePopover.isChildWidth}
  /// True if the popover should match the width of the child widget. Defaults to false.
  ///
  /// When enabled, the popover content will be constrained to have the same width as the child widget.
  /// {@endtemplate}
  final bool isChildWidth;

  /// {@macro forui.foundation.doc_templates.autofocus}
  final bool autofocus;

  /// {@macro forui.foundation.doc_templates.focusNode}
  final FocusNode? focusNode;

  /// {@macro forui.foundation.doc_templates.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// The popover's semantic label used by accessibility frameworks.
  final String? semanticLabel;

  /// The popover builder. The child passed to [popoverBuilder] will always be null.
  final ValueWidgetBuilder<BoxDecoration> popoverBuilder;

  /// The child.
  final Widget child;

  final bool _automatic;

  @override
  State<BePopover> createState() => _State();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('popoverAnchor', popoverAnchor))
      ..add(DiagnosticsProperty('childAnchor', childAnchor))
      ..add(ObjectFlagProperty.has('shift', shift))
      ..add(EnumProperty('hideOnTapOutside', hideOnTapOutside))
      ..add(FlagProperty('directionPadding', value: directionPadding, ifTrue: 'directionPadding'))
      ..add(FlagProperty('isChildWidth', value: isChildWidth, ifTrue: 'isChildWidth'))
      ..add(StringProperty('semanticLabel', semanticLabel))
      ..add(FlagProperty('autofocus', value: autofocus, ifTrue: 'autofocus'))
      ..add(DiagnosticsProperty('focusNode', focusNode))
      ..add(ObjectFlagProperty.has('onFocusChange', onFocusChange))
      ..add(ObjectFlagProperty.has('popoverBuilder', popoverBuilder));
  }
}

class _State extends State<BePopover> with SingleTickerProviderStateMixin {
  final Key _group = UniqueKey();
  late BePopoverController _controller;
  double? _childWidth;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BePopoverController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant final BePopover old) {
    super.didUpdateWidget(old);
    if (widget.controller == old.controller) {
      return;
    }

    if (old.controller == null) {
      _controller.dispose();
    }

    _controller = widget.controller ?? BePopoverController(vsync: this);
  }

  @override
  Widget build(final BuildContext context) {
    final textDirection = Directionality.maybeOf(context) ?? TextDirection.ltr;
    final popover = widget.popoverAnchor;
    final childAnchor = widget.childAnchor;

    var child = widget._automatic ? _buildAutomaticChild(widget.child) : widget.child;

    if (widget.hideOnTapOutside == BeHidePopoverRegion.excludeTarget) {
      child = TapRegion(groupId: _group, onTapOutside: (_) => _controller.hide(), child: child);
    }

    // If isChildWidth is enabled, wrap the child to measure its width
    if (widget.isChildWidth) {
      child = _ChildMeasurer(
        onSizeChanged: (final Size size) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _childWidth = size.width;
              });
            }
          });
        },
        child: child,
      );
    }

    return FPortal(
      controller: _controller._overlay,
      portalAnchor: widget.popoverAnchor,
      childAnchor: widget.childAnchor,
      shift: widget.shift,
      offset: widget.directionPadding
          ? Offset.zero
          : Alignments.removeDirectionalPadding(
              const EdgeInsets.all(4), // Default padding
              popover.resolve(textDirection),
              childAnchor.resolve(textDirection),
            ),
      portalBuilder: (final context) => CallbackShortcuts(
        bindings: {const SingleActivator(LogicalKeyboardKey.escape): _controller.hide},
        child: Semantics(
          label: widget.semanticLabel,
          container: true,
          child: Focus(
            autofocus: widget.autofocus,
            focusNode: widget.focusNode,
            onFocusChange: widget.onFocusChange,
            child: FocusTraversalGroup(
              child: Padding(
                padding: const EdgeInsets.all(4), // Default padding
                child: FadeTransition(
                  opacity: _controller._fade,
                  child: ScaleTransition(
                    scale: _controller._scale,
                    child: TapRegion(
                      groupId: _group,
                      onTapOutside: widget.hideOnTapOutside == BeHidePopoverRegion.none
                          ? null
                          : (_) => _controller.hide(),

                      child: widget.isChildWidth && _childWidth != null
                          ? ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: _childWidth!),
                              child: widget.popoverBuilder(context, widget.decoration ?? _popoverDecoration, null),
                            )
                          : widget.popoverBuilder(context, widget.decoration ?? _popoverDecoration, null),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      child: child,
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  /// Builds the automatic child that handles gesture detection for automatic popovers.
  /// Uses a combination of GestureDetector and TapRegion to support both standalone usage
  /// and widgets with existing gesture detectors like buttons.
  Widget _buildAutomaticChild(final Widget child) {
    // Check if the child is likely to have its own gesture detector
    // This is a heuristic approach - we look for common button types
    final hasOwnGesture = _hasOwnGestureDetector(child);

    if (hasOwnGesture) {
      // For widgets with their own gesture detectors (like buttons),
      // we use TapRegion which doesn't interfere with existing gestures
      return TapRegion(
        behavior: HitTestBehavior.translucent,
        onTapInside: (_) {
          // Small delay to allow the button's own onPressed to fire first
          Future.microtask(() {
            if (mounted) {
              _controller.toggle();
            }
          });
        },
        child: child,
      );
    } else {
      // For widgets without gesture detectors, use the traditional approach
      return GestureDetector(behavior: HitTestBehavior.translucent, onTap: _controller.toggle, child: child);
    }
  }

  /// Heuristic to determine if a widget likely has its own gesture detector.
  /// This checks for common button types and other interactive widgets.
  bool _hasOwnGestureDetector(final Widget widget) {
    // Check for common Flutter button types
    if (widget is ElevatedButton ||
        widget is OutlinedButton ||
        widget is TextButton ||
        widget is IconButton ||
        widget is FloatingActionButton ||
        widget is InkWell ||
        widget is GestureDetector) {
      return true;
    }

    // Check for custom tappable widgets
    if (widget is BeTappable) {
      return true;
    }

    // If it's a container-like widget, recursively check its child
    if (widget is Container && widget.child != null) {
      return _hasOwnGestureDetector(widget.child!);
    }

    if (widget is Padding && widget.child != null) {
      return _hasOwnGestureDetector(widget.child!);
    }

    if (widget is Center && widget.child != null) {
      return _hasOwnGestureDetector(widget.child!);
    }

    if (widget is Align && widget.child != null) {
      return _hasOwnGestureDetector(widget.child!);
    }

    return false;
  }
}

/// A widget that measures its child and calls a callback when the size changes.
class _ChildMeasurer extends StatefulWidget {
  const _ChildMeasurer({required this.onSizeChanged, required this.child});

  final ValueChanged<Size> onSizeChanged;
  final Widget child;

  @override
  State<_ChildMeasurer> createState() => _ChildMeasurerState();
}

class _ChildMeasurerState extends State<_ChildMeasurer> {
  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        // Schedule a callback to notify about size after layout
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null && renderBox.hasSize) {
            widget.onSizeChanged(renderBox.size);
          }
        });

        return widget.child;
      },
    );
  }
}

// BeBoxDecoration
BoxDecoration _popoverDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: .08 * 255),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ],
  border: Border.all(color: BeColors.gray200, width: 1),
);
