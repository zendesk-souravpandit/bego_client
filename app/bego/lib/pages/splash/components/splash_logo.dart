import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final double size;
  final Duration animationDuration;

  const SplashLogo({
    super.key,
    this.size = 100,
    this.animationDuration = const Duration(milliseconds: 1500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: animationDuration,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Icon(Icons.favorite, size: size, color: Colors.red),
    );
  }
}
