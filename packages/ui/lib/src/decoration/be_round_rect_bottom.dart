import 'package:flutter/material.dart';

class RoundedBottomBorder extends ShapeBorder {
  const RoundedBottomBorder({
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.borderSide = const BorderSide(width: 1.0, color: Colors.black),
  });
  final BorderRadius borderRadius;
  final BorderSide borderSide;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: borderSide.width);

  @override
  Path getOuterPath(final Rect rect, {final TextDirection? textDirection}) {
    // The shape path (rounded rectangle)
    return Path()..addRRect(borderRadius.toRRect(rect));
  }

  @override
  void paint(final Canvas canvas, final Rect rect, {final TextDirection? textDirection}) {
    final Paint paint = borderSide.toPaint();

    borderRadius.toRRect(rect);

    // We will draw only the bottom border line with rounded corners

    final double borderWidth = borderSide.width;

    // Calculate points for the bottom border path:
    final Path bottomBorderPath = Path();

    // Define the bottom border as a rounded path following the bottom edge with corners:

    // Get points for bottom left corner arc
    // Bottom left arc center and radius:
    final Radius bottomLeftRadius = borderRadius.bottomLeft;

    // Bottom right arc center and radius:
    final Radius bottomRightRadius = borderRadius.bottomRight;

    // Start at left bottom, inside the border
    bottomBorderPath
      ..moveTo(rect.left + bottomLeftRadius.x, rect.bottom - borderWidth / 2)
      // Bottom line from left rounded corner to right rounded corner (excluding corners)
      ..lineTo(rect.right - bottomRightRadius.x, rect.bottom - borderWidth / 2);

    // Draw the bottom right rounded corner arc
    if (bottomRightRadius.x > 0 && bottomRightRadius.y > 0) {
      bottomBorderPath.arcToPoint(
        Offset(rect.right, rect.bottom - bottomRightRadius.y),
        radius: bottomRightRadius,
        clockwise: false,
      );
    } else {
      bottomBorderPath.lineTo(rect.right, rect.bottom - borderWidth / 2);
    }

    // Draw vertical line up after corner (this is optional since we only want bottom stroke)
    // Then arc the bottom left corner in reverse (counterclockwise)
    if (bottomLeftRadius.x > 0 && bottomLeftRadius.y > 0) {
      bottomBorderPath
        ..moveTo(rect.right - bottomRightRadius.x, rect.bottom - borderWidth / 2)
        ..lineTo(rect.left + bottomLeftRadius.x, rect.bottom - borderWidth / 2)
        ..arcToPoint(Offset(rect.left, rect.bottom - bottomLeftRadius.y), radius: bottomLeftRadius, clockwise: false);
    } else {
      bottomBorderPath.lineTo(rect.left, rect.bottom - borderWidth / 2);
    }

    canvas.drawPath(bottomBorderPath, paint);
  }

  @override
  ShapeBorder scale(final double t) {
    return RoundedBottomBorder(borderRadius: borderRadius * t, borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(final Rect rect, {final TextDirection? textDirection}) {
    final double inset = borderSide.width;
    final Rect innerRect = rect.deflate(inset);
    return Path()..addRRect(borderRadius.toRRect(innerRect));
  }
}
