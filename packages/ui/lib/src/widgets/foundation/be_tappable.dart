// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/src/widgets/foundation/be_tappable.style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@internal
extension BeTouch on Never {
  /// The platforms that use touch as the primary input. It isn't 100% accurate as there are hybrid devices that use
  /// both touch and keyboard/mouse input, i.e., Windows Surface laptops.
  static const platforms = {TargetPlatform.android, TargetPlatform.iOS, TargetPlatform.fuchsia};

  static bool? _primary;

  /// True if the current platform uses touch as the primary input.
  static bool get primary => _primary ?? platforms.contains(defaultTargetPlatform);

  @visibleForTesting
  static set primary(final bool? value) {
    if (!kDebugMode) {
      throw UnsupportedError('Setting Touch.primary is only available in debug mode.');
    }

    _primary = value;
  }
}

/// The tappable's current data.
typedef BeTappableData = ({bool focused, bool hovered});

/// An area that responds to touch.
///
/// It is typically used to create other high-level widgets, i.e., [BeTappable]. Unless you are creating a custom widget,
/// you should use those high-level widgets instead.
class BeTappable extends StatefulWidget {
  /// Creates a [BeTappable].
  ///
  /// ## Contract
  /// Throws [AssertionError] if [builder] and [child] are both null.
  const BeTappable({
    this.focusedOutlineStyle,
    this.semanticLabel,
    this.semanticSelected = false,
    this.excludeSemantics = false,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.touchHoverEnterDuration = const Duration(milliseconds: 200),
    this.touchHoverExitDuration = Duration.zero,
    this.behavior = HitTestBehavior.translucent,
    this.onPress,
    this.onLongPress,
    this.child,
    final ValueWidgetBuilder<BeTappableData>? builder,
    super.key,
  }) : assert(builder != null || child != null, 'Either builder or child must be provided.'),
       builder = builder ?? _builder;

  /// Creates an animated [BeTappable].
  ///
  /// ## Contract
  /// Throws [AssertionError] if [builder] and [child] are both null.
  const factory BeTappable.animated({
    final BeFocusedOutlineStyle? focusedOutlineStyle,
    final String? semanticLabel,
    final bool semanticSelected,
    final bool excludeSemantics,
    final bool autofocus,
    final FocusNode? focusNode,
    final ValueChanged<bool>? onFocusChange,
    final Tween<double>? animationTween,
    final HitTestBehavior behavior,
    final Duration touchHoverEnterDuration,
    final Duration touchHoverExitDuration,
    final VoidCallback? onPress,
    final VoidCallback? onLongPress,
    final ValueWidgetBuilder<BeTappableData>? builder,
    final Widget? child,
    final Key? key,
  }) = AnimatedBeTapable;
  static Widget _builder(BuildContext _, BeTappableData _, final Widget? child) => child!;

  /// The style used when the tappable is focused. This tappable will not be outlined if null.
  final BeFocusedOutlineStyle? focusedOutlineStyle;

  /// {@macro forui.foundation.doc_templates.semanticsLabel}
  final String? semanticLabel;

  /// Used by accessibility frameworks to determine whether this tappable has been selected. Defaults to false.
  final bool semanticSelected;

  /// Whether to replace all child semantics with this node. Defaults to false.
  final bool excludeSemantics;

  /// {@macro forui.foundation.doc_templates.autofocus}
  final bool autofocus;

  /// {@macro forui.foundation.doc_templates.focusNode}
  final FocusNode? focusNode;

  /// {@macro forui.foundation.doc_templates.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// The duration to wait before applying the hover effect after the user presses the tile. Defaults to 200ms.
  final Duration touchHoverEnterDuration;

  /// The duration to wait before removing the hover effect after the user stops pressing the tile. Defaults to 0s.
  final Duration touchHoverExitDuration;

  /// The tappable's hit test behavior. Defaults to [HitTestBehavior.translucent].
  final HitTestBehavior behavior;

  /// {@template forui.foundation.BeTapable.onPress}
  /// A callback for when the widget is pressed.
  ///
  /// The widget will be disabled if both [onPress] and [onLongPress] are null.
  /// {@endtemplate}
  final VoidCallback? onPress;

  /// {@template forui.foundation.BeTapable.onLongPress}
  /// A callback for when the widget is long pressed.
  ///
  /// The widget will be disabled if both [onPress] and [onLongPress] are null.
  /// {@endtemplate}
  final VoidCallback? onLongPress;

  /// The builder used to build to create a child with the current state.
  final ValueWidgetBuilder<({bool focused, bool hovered})> builder;

  /// The child.
  ///
  /// This argument is optional and can be null if the entire widget subtree the [builder] builds reacts to focus and
  /// hover changes.
  final Widget? child;

  @override
  State<BeTappable> createState() => _BeTappableState<BeTappable>();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('focusedOutlineStyle', focusedOutlineStyle))
      ..add(StringProperty('semanticLabel', semanticLabel))
      ..add(FlagProperty('semanticsSelected', value: semanticSelected, ifTrue: 'selected'))
      ..add(FlagProperty('excludeSemantics', value: excludeSemantics, ifTrue: 'excludeSemantics'))
      ..add(FlagProperty('autofocus', value: autofocus, ifTrue: 'autofocus'))
      ..add(DiagnosticsProperty('focusNode', focusNode))
      ..add(ObjectFlagProperty.has('onFocusChange', onFocusChange))
      ..add(DiagnosticsProperty('touchHoverEnterDuration', touchHoverEnterDuration))
      ..add(DiagnosticsProperty('touchHoverExitDuration', touchHoverExitDuration))
      ..add(EnumProperty('behavior', behavior))
      ..add(ObjectFlagProperty.has('onPress', onPress))
      ..add(ObjectFlagProperty.has('onLongPress', onLongPress))
      ..add(ObjectFlagProperty.has('builder', builder));
  }

  bool get _enabled => onPress != null || onLongPress != null;
}

class _BeTappableState<T extends BeTappable> extends State<T> {
  int _monotonic = 0;
  bool _focused = false;
  bool _hovered = false;
  bool _touched = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.autofocus;
  }

  @override
  void didUpdateWidget(covariant final T old) {
    super.didUpdateWidget(old);
    if (widget._enabled != old._enabled) {
      _hovered = false;
      _touched = false;
    }
  }

  @override
  Widget build(final BuildContext context) {
    var tappable = widget.builder(context, (focused: _focused, hovered: _hovered || _touched), widget.child);
    tappable = _decorate(context, tappable);

    if (widget._enabled) {
      tappable = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        // We use a separate Listener instead of the GestureDetector in _child as GestureDetectors fight in
        // GestureArena and only 1 GestureDetector will win. This is problematic if this tappable is wrapped in
        // another GestureDetector as onTapDown and onTapUp might absorb EVERY gesture, including drags and pans.
        child: Listener(
          onPointerDown: (_) async {
            final count = ++_monotonic;
            _onPointerDown();

            await Future<void>.delayed(widget.touchHoverEnterDuration);
            if (mounted && count == _monotonic && !_touched) {
              setState(() => _touched = true);
            }
          },
          onPointerUp: (_) async {
            final count = ++_monotonic;
            _onPointerUp();

            await Future<void>.delayed(widget.touchHoverExitDuration);
            if (mounted && count == _monotonic && _touched) {
              setState(() => _touched = false);
            }
          },
          child: GestureDetector(
            behavior: widget.behavior,
            onTap: widget.onPress,
            onLongPress: widget.onLongPress,
            child: tappable,
          ),
        ),
      );
    }

    tappable = Semantics(
      enabled: widget._enabled,
      label: widget.semanticLabel,
      container: true,
      button: true,
      selected: widget.semanticSelected,
      excludeSemantics: widget.excludeSemantics,
      child: Focus(
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onFocusChange: (final focused) {
          setState(() => _focused = focused);
          widget.onFocusChange?.call(focused);
        },
        child: tappable,
      ),
    );

    if (widget.focusedOutlineStyle case final style?) {
      tappable = BeFocusedOutline(focused: _focused, style: style, child: tappable);
    }

    if (widget.onPress case final onPress?) {
      tappable = Shortcuts(
        shortcuts: const {SingleActivator(LogicalKeyboardKey.enter): ActivateIntent()},
        child: Actions(
          actions: {ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => onPress())},
          child: tappable,
        ),
      );
    }

    return tappable;
  }

  Widget _decorate(BuildContext _, final Widget child) => child;

  void _onPointerDown() {}

  void _onPointerUp() {}
}

@internal
class AnimatedBeTapable extends BeTappable {
  const AnimatedBeTapable({
    this.animationTween,
    super.focusedOutlineStyle,
    super.semanticLabel,
    super.semanticSelected = false,
    super.excludeSemantics = false,
    super.autofocus = false,
    super.focusNode,
    super.onFocusChange,
    super.behavior,
    super.touchHoverEnterDuration,
    super.touchHoverExitDuration,
    super.onPress,
    super.onLongPress,
    super.builder,
    super.child,
    super.key,
  });
  final Tween<double>? animationTween;

  @override
  State<BeTappable> createState() => AnimatedBeTapableState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('animationTween', animationTween));
  }
}

@internal
class AnimatedBeTapableState extends _BeTappableState<AnimatedBeTapable> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    animation = (widget.animationTween ?? Tween(begin: 1.0, end: 0.97)).animate(controller);
  }

  @override
  void didUpdateWidget(covariant final AnimatedBeTapable old) {
    super.didUpdateWidget(old);
    if (widget.animationTween != old.animationTween) {
      animation = (widget.animationTween ?? Tween(begin: 1.0, end: 0.97)).animate(controller);
    }
  }

  @override
  void _onPointerDown() => controller.forward();

  @override
  void _onPointerUp() => controller.reverse();

  @override
  Widget _decorate(BuildContext _, final Widget child) => ScaleTransition(scale: animation, child: child);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('animation', animation));
  }
}
