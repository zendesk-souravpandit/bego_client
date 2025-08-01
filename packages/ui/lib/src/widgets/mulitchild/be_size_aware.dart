// ignore_for_file: library_private_types_in_public_api, avoid_setters_without_getters, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Custom Flutter widget that provides size information to its child builder
///
/// The [builder] function receives the available [Size] and should return a widget
/// that can use this size information to render appropriately.
///
/// This is useful for creating responsive widgets that need to know their
/// parent's dimensions to make layout decisions.
///
/// Example:
/// ```dart
/// BeSizeAware(
///   builder: (size) => Container(
///     width: size.width * 0.5, // Use half the available width
///     height: size.height * 0.3, // Use 30% of available height
///     child: Text('Responsive content'),
///   ),
/// )
/// ```
///
/// With custom constraints:
/// ```dart
/// BeSizeAware(
///   constraints: BoxConstraints(maxWidth: 300, maxHeight: 200),
///   builder: (size) => Container(
///     width: size.width, // Will be max 300
///     height: size.height, // Will be max 200
///     child: Text('Constrained content'),
///   ),
/// )
/// ```
class BeSizeAware extends StatefulWidget {
  const BeSizeAware({required this.builder, super.key, this.constraints, this.onSizeChanged});

  /// Builder function that receives the available size and returns a widget
  final Widget Function(Size size) builder;

  /// Optional constraints to apply before measuring size
  /// If null, the widget will use the constraints passed from parent
  final BoxConstraints? constraints;

  /// Optional callback that gets called when the size changes
  final void Function(Size oldSize, Size newSize)? onSizeChanged;

  @override
  State<BeSizeAware> createState() => _BeSizeAwareState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints?>('constraints', constraints));
    properties.add(DiagnosticsProperty<bool>('hasOnSizeChanged', onSizeChanged != null));
  }
}

class _BeSizeAwareState extends State<BeSizeAware> {
  Size _availableSize = Size.zero;

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        // Use custom constraints if provided, otherwise use parent constraints
        final effectiveConstraints = widget.constraints ?? constraints;

        // Calculate the available size based on constraints
        final availableSize = Size(
          effectiveConstraints.maxWidth.isFinite ? effectiveConstraints.maxWidth : 0,
          effectiveConstraints.maxHeight.isFinite ? effectiveConstraints.maxHeight : 0,
        );

        // Check if size has changed and notify if callback is provided
        if (_availableSize != availableSize && widget.onSizeChanged != null) {
          // Schedule the callback to be called after the build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onSizeChanged?.call(_availableSize, availableSize);
          });
        }

        // Update the available size
        _availableSize = availableSize;

        // Build the child with the available size
        return widget.builder(_availableSize);
      },
    );
  }
}

/// A more advanced version that uses RenderObject for better performance
/// when you need precise control over layout and painting
class BeSizeAwareRender extends SingleChildRenderObjectWidget {
  const BeSizeAwareRender({required super.child, super.key, this.onSizeAvailable, this.constraints});

  /// Callback that receives the calculated size before child layout
  final void Function(Size size)? onSizeAvailable;

  /// Optional constraints to apply
  final BoxConstraints? constraints;

  @override
  RenderObject createRenderObject(final BuildContext context) =>
      _BeSizeAwareRenderObject(onSizeAvailable: onSizeAvailable, customConstraints: constraints);

  @override
  void updateRenderObject(final BuildContext context, final _BeSizeAwareRenderObject renderObject) {
    renderObject
      ..onSizeAvailable = onSizeAvailable
      ..customConstraints = constraints;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<BoxConstraints?>('constraints', constraints))
      ..add(DiagnosticsProperty<bool>('hasOnSizeAvailable', onSizeAvailable != null));
  }
}

class _BeSizeAwareRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  _BeSizeAwareRenderObject({final void Function(Size size)? onSizeAvailable, final BoxConstraints? customConstraints})
    : _onSizeAvailable = onSizeAvailable,
      _customConstraints = customConstraints;

  void Function(Size size)? _onSizeAvailable;
  set onSizeAvailable(final void Function(Size size)? value) {
    _onSizeAvailable = value;
  }

  BoxConstraints? _customConstraints;
  set customConstraints(final BoxConstraints? value) {
    if (_customConstraints == value) return;
    _customConstraints = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    // Use custom constraints if provided, otherwise use parent constraints
    final effectiveConstraints = _customConstraints ?? constraints;

    // Calculate the available size
    final availableSize = Size(
      effectiveConstraints.maxWidth.isFinite ? effectiveConstraints.maxWidth : 0,
      effectiveConstraints.maxHeight.isFinite ? effectiveConstraints.maxHeight : 0,
    );

    // Notify about the available size
    _onSizeAvailable?.call(availableSize);

    // Layout the child with the effective constraints
    if (child != null) {
      child!.layout(effectiveConstraints, parentUsesSize: true);
      size = child!.size;
    } else {
      size = effectiveConstraints.smallest;
    }
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }

  @override
  bool hitTestChildren(final BoxHitTestResult result, {required final Offset position}) {
    if (child != null) {
      return child!.hitTest(result, position: position);
    }
    return false;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints?>('customConstraints', _customConstraints));
  }
}
