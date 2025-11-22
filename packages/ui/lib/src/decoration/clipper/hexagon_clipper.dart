import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A custom clipper that clips widgets into a hexagonal shape.
/// Perfect for creating hexagonal avatars or other UI elements.
class HexagonClipper extends CustomClipper<Path> {
  const HexagonClipper({this.borderRadius = 0, this.rotation = 0});

  /// The border radius for rounded corners (optional).
  /// Set to 0 for sharp corners, or a positive value for rounded corners.
  final double borderRadius;

  /// The rotation angle in radians.
  /// Default is 0 (flat top hexagon). Use math.pi/6 for pointy top hexagon.
  final double rotation;

  @override
  Path getClip(final Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Calculate hexagon vertices
    final vertices = <Offset>[];
    for (int i = 0; i < 6; i++) {
      final angle = (i * math.pi / 3) + rotation;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      vertices.add(Offset(x, y));
    }

    if (borderRadius <= 0) {
      // Sharp corners hexagon
      path.moveTo(vertices[0].dx, vertices[0].dy);
      for (int i = 1; i < vertices.length; i++) {
        path.lineTo(vertices[i].dx, vertices[i].dy);
      }
      path.close();
    } else {
      // Rounded corners hexagon
      _createRoundedHexagon(path, vertices, borderRadius);
    }

    return path;
  }

  void _createRoundedHexagon(final Path path, final List<Offset> vertices, final double radius) {
    for (int i = 0; i < vertices.length; i++) {
      final current = vertices[i];
      final next = vertices[(i + 1) % vertices.length];
      final previous = vertices[(i - 1 + vertices.length) % vertices.length];

      // Calculate the direction vectors
      final dirToPrevious = Offset(previous.dx - current.dx, previous.dy - current.dy).normalized();
      final dirToNext = Offset(next.dx - current.dx, next.dy - current.dy).normalized();

      // Calculate the start and end points of the rounded corner
      final startPoint = Offset(current.dx + dirToPrevious.dx * radius, current.dy + dirToPrevious.dy * radius);
      final endPoint = Offset(current.dx + dirToNext.dx * radius, current.dy + dirToNext.dy * radius);

      if (i == 0) {
        path.moveTo(startPoint.dx, startPoint.dy);
      } else {
        path.lineTo(startPoint.dx, startPoint.dy);
      }

      // Add the rounded corner
      path.quadraticBezierTo(current.dx, current.dy, endPoint.dx, endPoint.dy);
    }
    path.close();
  }

  @override
  bool shouldReclip(final CustomClipper<Path> oldClipper) {
    if (oldClipper is HexagonClipper) {
      return borderRadius != oldClipper.borderRadius || rotation != oldClipper.rotation;
    }
    return true;
  }
}

/// Extension to normalize an Offset vector
extension OffsetExtension on Offset {
  Offset normalized() {
    final magnitude = math.sqrt(dx * dx + dy * dy);
    if (magnitude == 0) return const Offset(0, 0);
    return Offset(dx / magnitude, dy / magnitude);
  }
}

/// A convenient widget that clips its child into a hexagonal shape.
class HexagonAvatar extends StatelessWidget {
  const HexagonAvatar({
    super.key,
    required this.child,
    required this.size,
    this.borderRadius = 0,
    this.rotation = 0,
    this.border,
    this.backgroundColor,
  });

  /// The child widget to be clipped (usually an image or avatar).
  final Widget child;

  /// The size of the hexagon (width and height will be equal).
  final double size;

  /// The border radius for rounded corners (optional).
  final double borderRadius;

  /// The rotation angle in radians.
  final double rotation;

  /// Optional border decoration.
  final BoxBorder? border;

  /// Background color behind the clipped content.
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, border: border),
      child: ClipPath(
        clipper: HexagonClipper(borderRadius: borderRadius, rotation: rotation),
        child: child,
      ),
    );
  }
}
