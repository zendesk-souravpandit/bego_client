// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/foundation.dart';
import 'package:beui/src/layouts/portal/portal.dart';
import 'package:beui/src/layouts/portal/portal_shift.dart';
import 'package:beui/src/layouts/rendering.dart' show Alignments;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A controller that controls whether a [BePopover] is shown or hidden.
final class BePopoverController extends ChangeNotifier {
  /// Creates a [BePopoverController] with the given [vsync] and animation [animationDuration].
  BePopoverController({required final TickerProvider vsync, final Duration animationDuration = const Duration(milliseconds: 100)}) {
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
    this.semanticLabel,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    final AlignmentGeometry? popoverAnchor,
    final AlignmentGeometry? childAnchor,
    super.key,
  }) : popoverAnchor = popoverAnchor ?? defaultPlatform.popover,
       childAnchor = childAnchor ?? defaultPlatform.child,
       _automatic = false;

  /// Creates a popover that is automatically shown when the [child] is tapped.
  ///
  /// It is not recommended for the [child] to contain a [GestureDetector], such as [BeButton]. Only one
  /// `GestureDetector` will be called if there are multiple overlapping `GestureDetector`s, leading to unexpected
  /// behavior.
  BePopover.automatic({
    required this.popoverBuilder,
    required this.child,
    this.controller,
    this.shift = FPortalShift.flip,
    this.hideOnTapOutside = BeHidePopoverRegion.excludeTarget,
    this.directionPadding = false,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.semanticLabel,
    final AlignmentGeometry? popoverAnchor,
    final AlignmentGeometry? childAnchor,
    super.key,
  }) : popoverAnchor = popoverAnchor ?? defaultPlatform.popover,
       childAnchor = childAnchor ?? defaultPlatform.child,
       _automatic = true;

  /// The platform-specific default popover and child anchors.
  static ({Alignment popover, Alignment child}) get defaultPlatform =>
      BeTouch.primary
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

    var child =
        widget._automatic
            ? GestureDetector(behavior: HitTestBehavior.translucent, onTap: _controller.toggle, child: widget.child)
            : widget.child;

    if (widget.hideOnTapOutside == BeHidePopoverRegion.excludeTarget) {
      child = TapRegion(groupId: _group, onTapOutside: (_) => _controller.hide(), child: child);
    }

    return FPortal(
      controller: _controller._overlay,
      portalAnchor: widget.popoverAnchor,
      childAnchor: widget.childAnchor,
      shift: widget.shift,
      offset:
          widget.directionPadding
              ? Offset.zero
              : Alignments.removeDirectionalPadding(
                const EdgeInsets.all(4), // Default padding
                popover.resolve(textDirection),
                childAnchor.resolve(textDirection),
              ),
      portalBuilder:
          (final context) => CallbackShortcuts(
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
                          onTapOutside:
                              widget.hideOnTapOutside == BeHidePopoverRegion.none ? null : (_) => _controller.hide(),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white, // Default color
                              borderRadius: BorderRadius.circular(4), // Default border radius
                              border: Border.all(width: 1, color: Colors.black), // Default border
                              boxShadow: const [], // Default shadow
                            ),
                            child: widget.popoverBuilder(context, const BoxDecoration(), null),
                          ),
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
}
