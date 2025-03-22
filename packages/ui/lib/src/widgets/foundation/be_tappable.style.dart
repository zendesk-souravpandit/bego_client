import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// An outline around a focused widget that does not affect its layout.
class BeFocusedOutline extends SingleChildRenderObjectWidget {
  /// Creates a [BeFocusedOutline].
  const BeFocusedOutline({required this.focused, required super.child, this.style, super.key});

  /// The style.
  final BeFocusedOutlineStyle? style;

  /// True if the [child] should be outlined.
  final bool focused;

  @override
  RenderObject createRenderObject(BuildContext context) => _Outline(
    style ?? BeFocusedOutlineStyle.defaultStyle,
    Directionality.maybeOf(context) ?? TextDirection.ltr,
    focused: focused,
  );

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, _Outline renderObject) {
    renderObject
      ..style = style ?? BeFocusedOutlineStyle.defaultStyle
      ..textDirection = Directionality.maybeOf(context) ?? TextDirection.ltr
      ..focused = focused;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('style', style))
      ..add(FlagProperty('focused', value: focused, ifTrue: 'focused'));
  }
}

class _Outline extends RenderProxyBox {
  _Outline(this._style, this._textDirection, {required bool focused}) : _focused = focused;
  BeFocusedOutlineStyle _style;
  TextDirection _textDirection;
  bool _focused;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    if (focused) {
      final radius = _style.borderRadius.resolve(_textDirection);
      context.canvas.drawPath(
        Path()..addRRect(
          RRect.fromRectAndCorners(
            (offset & child!.size).inflate(_style.spacing),
            topLeft: radius.topLeft,
            topRight: radius.topRight,
            bottomLeft: radius.bottomLeft,
            bottomRight: radius.bottomRight,
          ),
        ),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = _style.color
          ..strokeWidth = _style.width,
      );
    }
  }

  @override
  Rect get paintBounds => _focused ? child!.paintBounds.inflate(_style.spacing) : super.paintBounds;

  BeFocusedOutlineStyle get style => _style;

  set style(BeFocusedOutlineStyle value) {
    if (style != value) {
      _style = value;
      markNeedsPaint();
    }
  }

  TextDirection get textDirection => _textDirection;

  set textDirection(TextDirection value) {
    if (textDirection != value) {
      _textDirection = value;
      markNeedsPaint();
    }
  }

  bool get focused => _focused;

  set focused(bool value) {
    if (focused != value) {
      _focused = value;
      markNeedsPaint();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('style', style))
      ..add(EnumProperty('textDirection', textDirection))
      ..add(FlagProperty('focused', value: focused, ifTrue: 'focused'));
  }
}

/// The [BeFocusedOutline]'s style.
class BeFocusedOutlineStyle with Diagnosticable {
  /// Creates a [BeFocusedOutlineStyle].
  const BeFocusedOutlineStyle({required this.color, required this.borderRadius, this.width = 1, this.spacing = 3})
    : assert(0 < width, 'The width must be greater than 0.');

  /// The outline's color.
  final Color color;

  /// The border radius.
  final BorderRadiusGeometry borderRadius;

  /// The outline's width. Defaults to 1.
  ///
  /// ## Contract
  /// Throws [AssertionError] if the width is not positive.
  final double width;

  /// The spacing between the outline and the outlined widget. Defaults to 3.
  final double spacing;

  /// Returns a copy of this [BeFocusedOutlineStyle] with the given properties replaced.
  BeFocusedOutlineStyle copyWith({Color? color, BorderRadiusGeometry? borderRadius, double? width, double? spacing}) =>
      BeFocusedOutlineStyle(
        color: color ?? this.color,
        borderRadius: borderRadius ?? this.borderRadius,
        width: width ?? this.width,
        spacing: spacing ?? this.spacing,
      );

  /// A default style for [BeFocusedOutline].
  static const defaultStyle = BeFocusedOutlineStyle(color: Color(0xFF000000), borderRadius: BorderRadius.zero);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(DiagnosticsProperty('borderRadius', borderRadius))
      ..add(DoubleProperty('width', width))
      ..add(DoubleProperty('spacing', spacing));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BeFocusedOutlineStyle &&
          color == other.color &&
          borderRadius == other.borderRadius &&
          width == other.width &&
          spacing == other.spacing);

  @override
  int get hashCode => color.hashCode ^ borderRadius.hashCode ^ width.hashCode ^ spacing.hashCode;
}
