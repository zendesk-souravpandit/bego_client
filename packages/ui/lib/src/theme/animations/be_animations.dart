import 'package:beui/src/constants/design_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Advanced animation system with Material 3 motion principles
class BeAnimations {
  const BeAnimations._();

  // ========== Entrance Animations ==========

  /// Fade in animation with scale
  static Widget fadeInScale({
    required final Widget child,
    final Duration duration = BeDesignToken.motionStandard,
    final Curve curve = BeDesignToken.curveStandard,
    final double initialScale = 0.8,
    final Offset? initialOffset,
  }) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: curve,
      child: TweenAnimationBuilder<double>(
        duration: duration,
        curve: curve,
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (final context, final value, final child) {
          return Transform.scale(
            scale: initialScale + (1.0 - initialScale) * value,
            child: Opacity(
              opacity: value,
              child: initialOffset != null
                  ? Transform.translate(offset: initialOffset * (1.0 - value), child: child)
                  : child,
            ),
          );
        },
        child: child,
      ),
    );
  }

  /// Slide in animation from specified direction
  static Widget slideIn({
    required final Widget child,
    required final SlideDirection direction,
    final Duration duration = BeDesignToken.motionStandard,
    final Curve curve = BeDesignToken.curveEmphasized,
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (final context, final value, final child) {
        Offset offset;
        switch (direction) {
          case SlideDirection.left:
            offset = Offset(-1.0 * (1.0 - value), 0.0);
            break;
          case SlideDirection.right:
            offset = Offset(1.0 * (1.0 - value), 0.0);
            break;
          case SlideDirection.up:
            offset = Offset(0.0, -1.0 * (1.0 - value));
            break;
          case SlideDirection.down:
            offset = Offset(0.0, 1.0 * (1.0 - value));
            break;
        }

        return SlideTransition(position: AlwaysStoppedAnimation(offset), child: child);
      },
      child: child,
    );
  }

  /// Elastic bounce animation
  static Widget bounceIn({required final Widget child, final Duration duration = BeDesignToken.motionEmphasized}) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: Curves.elasticOut,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (final context, final value, final child) {
        return Transform.scale(scale: value, child: child);
      },
      child: child,
    );
  }

  // ========== Interactive Animations ==========

  /// Ripple effect animation for buttons
  static Widget rippleEffect({
    required final Widget child,
    final Color? rippleColor,
    final double radius = 25.0,
    final VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap?.call();
        },
        borderRadius: BorderRadius.circular(radius),
        splashColor: rippleColor?.withValues(alpha: 0.1),
        highlightColor: rippleColor?.withValues(alpha: 0.05),
        child: child,
      ),
    );
  }

  /// Press animation with scale feedback
  static Widget pressScale({
    required final Widget child,
    final double pressedScale = 0.95,
    final Duration duration = BeDesignToken.motionQuick,
    final VoidCallback? onPressed,
  }) {
    return _PressScaleWidget(pressedScale: pressedScale, duration: duration, onPressed: onPressed, child: child);
  }

  /// Hover animation with elevation
  static Widget hoverElevation({
    required final Widget child,
    final double normalElevation = 2.0,
    final double hoveredElevation = 8.0,
    final Duration duration = BeDesignToken.motionQuick,
    final Color? shadowColor,
  }) {
    return _HoverElevationWidget(
      normalElevation: normalElevation,
      hoveredElevation: hoveredElevation,
      duration: duration,
      shadowColor: shadowColor,
      child: child,
    );
  }

  // ========== Loading Animations ==========

  /// Shimmer loading animation
  static Widget shimmer({
    required final Widget child,
    final Color? baseColor,
    final Color? highlightColor,
    final Duration period = const Duration(milliseconds: 1500),
  }) {
    return _ShimmerWidget(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      period: period,
      child: child,
    );
  }

  /// Pulse loading animation
  static Widget pulse({
    required final Widget child,
    final double minOpacity = 0.5,
    final double maxOpacity = 1.0,
    final Duration duration = const Duration(milliseconds: 1000),
  }) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween(begin: minOpacity, end: maxOpacity),
      builder: (final context, final value, final child) {
        return AnimatedOpacity(opacity: value, duration: duration, child: child);
      },
      child: child,
    );
  }

  // ========== Page Transitions ==========

  /// Shared axis transition (Material 3)
  static PageRouteBuilder<T> sharedAxisTransition<T>({
    required final Widget child,
    required final SharedAxisTransitionType transitionType,
    final Duration duration = BeDesignToken.motionStandard,
    final bool fillColor = false,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (final context, final animation, final secondaryAnimation) => child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (final context, final animation, final secondaryAnimation, final child) {
        return _SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          fillColor: fillColor,
          child: child,
        );
      },
    );
  }

  /// Fade through transition
  static PageRouteBuilder<T> fadeThrough<T>({
    required final Widget child,
    final Duration duration = BeDesignToken.motionStandard,
    final Color? fillColor,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (final context, final animation, final secondaryAnimation) => child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (final context, final animation, final secondaryAnimation, final child) {
        return _FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: fillColor ?? Theme.of(context).colorScheme.surface,
          child: child,
        );
      },
    );
  }
}

// ========== Enums ==========

enum SlideDirection { left, right, up, down }

enum SharedAxisTransitionType { horizontal, vertical, scaled }

// ========== Private Animation Widgets ==========

class _PressScaleWidget extends StatefulWidget {
  const _PressScaleWidget({required this.child, required this.pressedScale, required this.duration, this.onPressed});

  final Widget child;
  final double pressedScale;
  final Duration duration;
  final VoidCallback? onPressed;

  @override
  State<_PressScaleWidget> createState() => _PressScaleWidgetState();
}

class _PressScaleWidgetState extends State<_PressScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.pressedScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(final TapDownDetails details) {
    _controller.forward();
    HapticFeedback.lightImpact();
  }

  void _handleTapUp(final TapUpDetails details) {
    _controller.reverse();
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (final context, final child) {
          return Transform.scale(scale: _scaleAnimation.value, child: widget.child);
        },
      ),
    );
  }
}

class _HoverElevationWidget extends StatefulWidget {
  const _HoverElevationWidget({
    required this.child,
    required this.normalElevation,
    required this.hoveredElevation,
    required this.duration,
    this.shadowColor,
  });

  final Widget child;
  final double normalElevation;
  final double hoveredElevation;
  final Duration duration;
  final Color? shadowColor;

  @override
  State<_HoverElevationWidget> createState() => _HoverElevationWidgetState();
}

class _HoverElevationWidgetState extends State<_HoverElevationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _elevationAnimation = Tween<double>(
      begin: widget.normalElevation,
      end: widget.hoveredElevation,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _controller.forward();
      },
      onExit: (_) {
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _elevationAnimation,
        builder: (final context, final child) {
          return Material(elevation: _elevationAnimation.value, shadowColor: widget.shadowColor, child: widget.child);
        },
      ),
    );
  }
}

class _ShimmerWidget extends StatefulWidget {
  const _ShimmerWidget({
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    required this.period,
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration period;

  @override
  State<_ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<_ShimmerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.period, vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (final context, final child) {
        return ShaderMask(
          shaderCallback: (final bounds) {
            return LinearGradient(
              colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 - _controller.value * 2, 0.0),
              end: Alignment(1.0 - _controller.value * 2, 0.0),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class _SharedAxisTransition extends StatelessWidget {
  const _SharedAxisTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.transitionType,
    required this.child,
    this.fillColor = false,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final SharedAxisTransitionType transitionType;
  final Widget child;
  final bool fillColor;

  @override
  Widget build(final BuildContext context) {
    return SlideTransition(
      position: _getSlideAnimation(),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  Animation<Offset> _getSlideAnimation() {
    switch (transitionType) {
      case SharedAxisTransitionType.horizontal:
        return Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: BeDesignToken.curveEmphasized));
      case SharedAxisTransitionType.vertical:
        return Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: BeDesignToken.curveEmphasized));
      case SharedAxisTransitionType.scaled:
        return Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(animation);
    }
  }
}

class _FadeThroughTransition extends StatelessWidget {
  const _FadeThroughTransition({
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
    required this.fillColor,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;
  final Color fillColor;

  @override
  Widget build(final BuildContext context) {
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (final context, final animation, final child) {
        return FadeTransition(opacity: animation, child: child);
      },
      reverseBuilder: (final context, final animation, final child) {
        return FadeTransition(opacity: ReverseAnimation(animation), child: child);
      },
      child: Container(color: fillColor, child: child),
    );
  }
}
