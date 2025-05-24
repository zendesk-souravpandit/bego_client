import 'package:beui/src/extensions/be_double_ext.dart';
import 'package:flutter/material.dart';

class BeRoundedRectangleBorder extends RoundedRectangleBorder {
  const BeRoundedRectangleBorder({
    super.side = BorderSide.none,
    super.borderRadius = BorderRadius.zero,
    this.backgroundColor,
  });
  final Color? backgroundColor;

  @override
  void paint(final Canvas canvas, final Rect rect, {final TextDirection? textDirection}) {
    // Draw background first
    if (backgroundColor != null) {
      final RRect rrect = borderRadius.resolve(textDirection).toRRect(rect);
      canvas.drawRRect(
        rrect,
        Paint()
          ..color = backgroundColor!
          ..style = PaintingStyle.fill,
      );
    }

    // Then draw the normal border
    super.paint(canvas, rect, textDirection: textDirection);
  }

  @override
  ShapeBorder scale(final double t) {
    return BeRoundedRectangleBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
      backgroundColor: backgroundColor?.withAlpha(t.toAlpha()),
    );
  }

  @override
  ShapeBorder? lerpFrom(final ShapeBorder? a, final double t) {
    if (a is BeRoundedRectangleBorder) {
      return BeRoundedRectangleBorder(
        side: BorderSide.lerp(a.side, side, t),
        borderRadius: BorderRadius.lerp(a.borderRadius as BorderRadius?, borderRadius as BorderRadius?, t)!,
        backgroundColor: Color.lerp(a.backgroundColor, backgroundColor, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(final ShapeBorder? b, final double t) {
    if (b is BeRoundedRectangleBorder) {
      return BeRoundedRectangleBorder(
        side: BorderSide.lerp(side, b.side, t),
        borderRadius: BorderRadius.lerp(borderRadius as BorderRadius?, b.borderRadius as BorderRadius?, t)!,
        backgroundColor: Color.lerp(backgroundColor, b.backgroundColor, t),
      );
    }
    return super.lerpTo(b, t);
  }
}
