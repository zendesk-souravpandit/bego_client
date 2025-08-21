library bounce_tap;

import 'package:flutter/material.dart';

const _longPressThreshold = 1200;

enum BounceTapIntensity { weak, mid, strong, superStrong }

extension _EnhancedEnum on BounceTapIntensity {
  double get value {
    switch (this) {
      case BounceTapIntensity.weak:
        return 0.2;
      case BounceTapIntensity.mid:
        return 0.4;
      case BounceTapIntensity.strong:
        return 0.6;
      case BounceTapIntensity.superStrong:
        return 0.8;
    }
  }
}

class BeBounceTap extends StatefulWidget {
  const BeBounceTap({
    super.key,
    required this.child,
    required this.onTap,
    this.tapIntensity = BounceTapIntensity.weak,
    this.tapDelay = 300,
    this.duration,
    this.onLongPress,
  });

  /// this defines how hard you want the widget to bounce on tap
  final BounceTapIntensity tapIntensity;

  /// this is your widget child
  final Widget child;

  /// This is a user defined duration
  final Duration? duration;

  /// this callback triggers when your widget is tapped
  final VoidCallback onTap;

  /// this callback triggers when your widget is pressed for a long time
  final VoidCallback? onLongPress;

  /// it sets how much time must pass before executing onTap/onLongPress callbacks
  final int tapDelay;

  @override
  State<BeBounceTap> createState() => _BeBounceTapState();
}

class _BeBounceTapState extends State<BeBounceTap> with SingleTickerProviderStateMixin {
  /// this handles the animation
  late AnimationController _animationController;

  DateTime? tapDownTime;
  DateTime? tapUpTime;

  Duration get duration => widget.duration ?? const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: widget.tapIntensity.value,
      duration: duration,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTapDown: onTapDown,
    onTapUp: onTapUp,
    child: Transform.scale(scale: 1 - _animationController.value, child: widget.child),
  );

  void onTapDown(_) {
    tapDownTime = DateTime.now();

    ///Firing the animation right away
    _animationController.forward();
  }

  void onTapUp(_) {
    tapUpTime = DateTime.now();
    final difference = tapUpTime!.difference(tapDownTime!);
    if (difference.inMilliseconds <= 200) {
      widget.onTap.delayed(Duration(milliseconds: widget.tapDelay));
    } else {
      if (difference.inMilliseconds < _longPressThreshold) {
        widget.onLongPress?.delayed(Duration(milliseconds: widget.tapDelay));
      }
    }

    ///now reverse the animation
    _animationController.reverse();
  }
}

extension on VoidCallback {
  void delayed(final Duration duration) {
    Future<void>.delayed(duration).then((final value) => this.call());
  }
}
