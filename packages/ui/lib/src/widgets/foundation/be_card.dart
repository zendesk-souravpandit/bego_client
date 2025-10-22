import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Card elevation variants
enum BeCardElevation { none, low, medium, high }

/// A customizable card component that follows BeUI design system
class BeCard extends StatelessWidget {
  const BeCard({
    super.key,
    required this.child,
    this.elevation = BeCardElevation.low,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.border,
    this.backgroundColor,
  });

  /// Creates a card with no elevation
  const BeCard.flat({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.border,
    this.backgroundColor,
  }) : elevation = BeCardElevation.none;

  /// Creates a card with low elevation
  const BeCard.elevated({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.border,
    this.backgroundColor,
  }) : elevation = BeCardElevation.medium;

  final Widget child;
  final BeCardElevation elevation;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) {
    final theme = BeTheme.of(context);

    final effectivePadding = padding ?? const EdgeInsets.all(16);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);
    final effectiveBackgroundColor = backgroundColor ?? theme.colors.surface;

    Widget cardContent = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        border: border,
        boxShadow: _getElevationShadow(theme),
      ),
      child: child,
    );

    if (margin != null) {
      cardContent = Padding(padding: margin!, child: cardContent);
    }

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, borderRadius: effectiveBorderRadius, child: cardContent),
      );
    }

    return cardContent;
  }

  List<BoxShadow>? _getElevationShadow(final BeThemeData theme) {
    if (elevation == BeCardElevation.none) return null;

    final shadowColor = Colors.black.withValues(alpha: theme.isDark ? 0.3 : 0.1);

    switch (elevation) {
      case BeCardElevation.none:
        return null;
      case BeCardElevation.low:
        return [BoxShadow(color: shadowColor, blurRadius: 4, offset: const Offset(0, 2))];
      case BeCardElevation.medium:
        return [BoxShadow(color: shadowColor, blurRadius: 8, offset: const Offset(0, 4))];
      case BeCardElevation.high:
        return [BoxShadow(color: shadowColor, blurRadius: 16, offset: const Offset(0, 8))];
    }
  }
}
