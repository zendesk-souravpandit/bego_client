import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';

/// Blur its [child] widget.
///
/// - [blur] controls the intensity of blur (default 5).
/// - [blurColor] is the overlay color on the blur (default white).
/// - [colorOpacity] is the opacity of the overlay color (default 0.5).
/// - [borderRadius] clips the child and the blur overlay.
/// - [overlay] is an optional widget stacked on top of blur (e.g. text or icons).
/// - [alignment] aligns the [overlay] widget.
/// - [height], [width], [padding] control the size and spacing of the blur overlay.
/// - [clipBehavior] controls how the Blur overlay is clipped (default Clip.antiAlias).
/// - [overlayDecoration] lets you provide a custom decoration instead of a colored box.
/// - [border] adds a border around the overlay.
class BeBlur extends StatelessWidget {
  const BeBlur({
    super.key,
    required this.child,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.colorOpacity = 0.5,
    this.borderRadius,
    this.overlay,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.padding,
    this.clipBehavior = Clip.antiAlias,
    this.overlayDecoration,
    this.border,
  });

  /// Convenience constructor for a common "glassmorphism" style blur.
  factory BeBlur.glass({
    final Key? key,
    required final Widget child,
    final BorderRadius? borderRadius,
    final double blur = 20,
    final Color blurColor = Colors.white,
    final double colorOpacity = 0.15,
    final Widget? overlay,
    final AlignmentGeometry alignment = Alignment.center,
    final double? height,
    final double? width,
    final EdgeInsetsGeometry? padding,
    final Clip clipBehavior = Clip.antiAlias,
    final Decoration? overlayDecoration,
    final Border? border,
  }) {
    return BeBlur(
      key: key,
      blur: blur,
      blurColor: blurColor,
      colorOpacity: colorOpacity,
      borderRadius: borderRadius,
      overlay: overlay,
      alignment: alignment,
      height: height,
      width: width,
      padding: padding,
      clipBehavior: clipBehavior,
      overlayDecoration: overlayDecoration,
      border: border,
      child: child,
    );
  }

  final Widget child;
  final double blur;
  final Color blurColor;
  final double colorOpacity;
  final BorderRadius? borderRadius;
  final Widget? overlay;
  final AlignmentGeometry alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;
  final Decoration? overlayDecoration;
  final Border? border;

  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipBehavior: clipBehavior,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                height: height,
                width: width,
                padding: padding,
                decoration:
                    overlayDecoration ??
                    BoxDecoration(
                      color: blurColor.withAlpha((colorOpacity * 255).round()),
                      borderRadius: borderRadius,
                      border: border,
                    ),
                alignment: alignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
