import 'dart:ui';

import 'package:beui/src/extensions/be_double_ext.dart';
import 'package:flutter/material.dart';

// class RoundedBlurredRectangleBorder extends RoundedRectangleBorder {
//   const RoundedBlurredRectangleBorder({BorderRadius super.borderRadius, super.side, this.blurSigma = 10.0});
//   final double blurSigma;

//   @override
//   void paint(
//     final Canvas canvas,
//     final Rect rect, {
//     final TextDirection? textDirection,
//     final BoxShape shape = BoxShape.rectangle,
//     final BorderRadius? borderRadius,
//   }) {
//     final BorderRadius effectiveBorderRadius = borderRadius ?? this.borderRadius.resolve(textDirection);
//     final RRect rRect = effectiveBorderRadius.toRRect(rect);

//     canvas
//       ..saveLayer(rect, Paint())
//       ..drawRRect(
//         rRect,
//         Paint()
//           ..imageFilter = ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma)
//           ..color = Colors.transparent,
//       )
//       ..drawRRect(rRect, Paint()..color = Colors.white.withOpacity(0.2));

//     if (side != BorderSide.none) {
//       final borderPaint = side.toPaint();
//       canvas.drawRRect(rRect.deflate(side.width / 2), borderPaint);
//     }

//     canvas.restore();
//   }
// }

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
