// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class BeRoundedRectangleBorder extends RoundedRectangleBorder {
//   const BeRoundedRectangleBorder({
//     super.side = BorderSide.none,
//     super.borderRadius = BorderRadius.zero,
//     this.backgroundColor,
//     this.shadows,
//     this.clipShadow = false,
//   });

//   final Color? backgroundColor;
//   final List<BeBoxShadow>? shadows;
//   final bool clipShadow;

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     final RRect rrect = borderRadius.resolve(textDirection).toRRect(rect);

//     // Draw shadows first (behind everything)
//     if (shadows != null && shadows!.isNotEmpty) {
//       for (final shadow in shadows!) {
//         _paintShadow(canvas, rrect, shadow);
//       }
//     }

//     // Draw background color if provided
//     if (backgroundColor != null) {
//       canvas.drawRRect(
//         rrect,
//         Paint()
//           ..color = backgroundColor!
//           ..style = PaintingStyle.fill,
//       );
//     }

//     // Draw the border
//     super.paint(canvas, rect, textDirection: textDirection);
//   }

//   void _paintShadow(Canvas canvas, RRect rrect, BeBoxShadow shadow) {
//     final Paint paint = shadow.toPaint();
//     final Rect bounds = rrect.outerRect;

//     if (shadow.inset) {
//       // Inset shadow (drawn inside the shape)
//       final Path path = Path()..addRRect(rrect);
//       canvas.drawShadow(
//         path,
//         shadow.color,
//         shadow.blurRadius,
//         shadow.spreadRadius < 0,
//       );
//     } else {
//       // Outset shadow (drawn outside the shape)
//       final double spread = shadow.spreadRadius;
//       final RRect shadowRect = rrect.inflate(spread).shift(shadow.offset);

//       if (clipShadow) {
//         canvas.save();
//         canvas.clipRRect(rrect, doAntiAlias: true);
//       }

//       if (shadow.blurRadius == 0) {
//         canvas.drawRRect(shadowRect, paint);
//       } else {
//         canvas.drawRRect(
//           shadowRect,
//           paint
//             ..maskFilter = MaskFilter.
//               blur(BlurStyle.normal, shadow.blurSigma),
//         );
//       }

//       if (clipShadow) {
//         canvas.restore();
//       }
//     }
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return BeRoundedRectangleBorder(
//       side: side.scale(t),
//       borderRadius: borderRadius * t,
//       backgroundColor: backgroundColor?.withValues(alpha:t),
//       shadows: shadows?.map((s) => s.scale(t)).toList(),
//       clipShadow: clipShadow,
//     );
//   }

//   @override
//   ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
//     if (a is BeRoundedRectangleBorder) {
//       return BeRoundedRectangleBorder(
//         side: BorderSide.lerp(a.side, side, t),
//         borderRadius:
//             BorderRadius.lerp(
//               a.borderRadius as BorderRadius?,
//               borderRadius as BorderRadius?,
//               t,
//             )!,
//         backgroundColor: Color.lerp(a.backgroundColor, backgroundColor, t),
//         shadows: _lerpShadows(a.shadows, shadows, t),
//         clipShadow: t < 0.5 ? a.clipShadow : clipShadow,
//       );
//     }
//     return super.lerpFrom(a, t);
//   }

//   @override
//   ShapeBorder? lerpTo(ShapeBorder? b, double t) {
//     if (b is BeRoundedRectangleBorder) {
//       return BeRoundedRectangleBorder(
//         side: BorderSide.lerp(side, b.side, t),
//         borderRadius:
//             BorderRadius.lerp(
//               borderRadius as BorderRadius?,
//               b.borderRadius as BorderRadius?,
//               t,
//             )!,
//         backgroundColor: Color.lerp(backgroundColor, b.backgroundColor, t),
//         shadows: _lerpShadows(shadows, b.shadows, t),
//         clipShadow: t < 0.5 ? clipShadow : b.clipShadow,
//       );
//     }
//     return super.lerpTo(b, t);
//   }

//   static List<BeBoxShadow>? _lerpShadows(
//     List<BeBoxShadow>? a,
//     List<BeBoxShadow>? b,
//     double t,
//   ) {
//     if (a == null && b == null) return null;
//     if (a == null) return b!.map((s) => s.scale(t)).toList();
//     if (b == null) return a.map((s) => s.scale(1 - t)).toList();
//     if (a.length != b.length) return t < 0.5 ? a : b;

//     return List.generate(a.length, (i) => BeBoxShadow.lerp(a[i], b[i], t)!);
//   }
// }

// class BeBoxShadow {
//   const BeBoxShadow({
//     this.color = const Color(0xFF000000),
//     this.offset = Offset.zero,
//     this.blurRadius = 0.0,
//     this.spreadRadius = 0.0,
//     this.inset = false,
//   });
//   final Color color;
//   final Offset offset;
//   final double blurRadius;
//   final double spreadRadius;
//   final bool inset;

//   double get blurSigma => blurRadius * 0.57735 + 0.5;

//   Paint toPaint() =>
//       Paint()
//         ..color = color
//         ..style = PaintingStyle.fill;

//   BeBoxShadow scale(double factor) {
//     return BeBoxShadow(
//       color: color.withValues(alpha:color.opacity * factor),
//       offset: offset * factor,
//       blurRadius: blurRadius * factor,
//       spreadRadius: spreadRadius * factor,
//       inset: inset,
//     );
//   }

//   static BeBoxShadow? lerp(BeBoxShadow? a, BeBoxShadow? b, double t) {
//     if (a == null && b == null) return null;
//     if (a == null) return b!.scale(t);
//     if (b == null) return a.scale(1 - t);
//     if (t == 0.0) return a;
//     if (t == 1.0) return b;

//     return BeBoxShadow(
//       color: Color.lerp(a.color, b.color, t)!,
//       offset: Offset.lerp(a.offset, b.offset, t)!,
//       blurRadius: lerpDouble(a.blurRadius, b.blurRadius, t)!,
//       spreadRadius: lerpDouble(a.spreadRadius, b.spreadRadius, t)!,
//       inset: t < 0.5 ? a.inset : b.inset,
//     );
//   }
// }
