import 'package:beui/decoration.dart';
import 'package:beui/mulitchild.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Avatar size variants with their corresponding pixel values
enum BeAvatarSize {
  xsmall(18),
  small(24),
  medium(32),
  large(48),
  extraLarge(56);

  const BeAvatarSize(this.size);
  final double size;
}

/// Avatar style variants
enum BeAvatarStyle { circle, rounded, square, hexagon }

/// Avatar status indicator with their corresponding colors
enum BeAvatarStatus {
  none(null),
  online(Colors.green),
  offline(Colors.grey),
  away(Colors.orange),
  busy(Colors.red);

  const BeAvatarStatus(this.color);
  final Color? color;
}

/// A customizable avatar component that follows BeUI design system
class BeAvatar extends StatelessWidget {
  const BeAvatar({
    super.key,
    this.image,
    this.child,
    this.initials,
    this.size = BeAvatarSize.medium,
    this.style = BeAvatarStyle.circle,
    this.backgroundColor,
    this.foregroundColor,
    this.status = BeAvatarStatus.none,
    this.showBadge = false,
    this.badgeContent,
    this.badgePosition = BeBadgePosition.topRight,
    this.onTap,
    this.elevation = 0,
    this.border,
    this.rounded = true,
    this.offset = const Offset(0, 0),
  });

  /// Creates an avatar with an image
  const BeAvatar.image({
    super.key,
    required this.image,
    this.size = BeAvatarSize.medium,
    this.style = BeAvatarStyle.circle,
    this.status = BeAvatarStatus.none,
    this.showBadge = false,
    this.badgeContent,
    this.badgePosition = BeBadgePosition.topRight,
    this.onTap,
    this.elevation = 0,
    this.border,
    this.rounded = true,
    this.offset = const Offset(0, 0),
  }) : child = null,
       initials = null,
       backgroundColor = null,
       foregroundColor = null;

  /// Creates an avatar with initials
  const BeAvatar.initials({
    super.key,
    required this.initials,
    this.size = BeAvatarSize.medium,
    this.style = BeAvatarStyle.circle,
    this.backgroundColor,
    this.foregroundColor,
    this.status = BeAvatarStatus.none,
    this.showBadge = false,
    this.badgeContent,
    this.badgePosition = BeBadgePosition.topRight,
    this.onTap,
    this.elevation = 0,
    this.border,
    this.rounded = true,
    this.offset = const Offset(0, 0),
  }) : image = null,
       child = null;

  /// Creates an avatar with a custom child widget
  const BeAvatar.custom({
    super.key,
    required this.child,
    this.size = BeAvatarSize.medium,
    this.style = BeAvatarStyle.circle,
    this.backgroundColor,
    this.foregroundColor,
    this.status = BeAvatarStatus.none,
    this.showBadge = false,
    this.badgeContent,
    this.badgePosition = BeBadgePosition.topRight,
    this.onTap,
    this.elevation = 0,
    this.border,
    this.rounded = true,
    this.offset = const Offset(0, 0),
  }) : image = null,
       initials = null;

  // Properties
  final ImageProvider? image;
  final Widget? child;
  final String? initials;
  final BeAvatarSize size;
  final BeAvatarStyle style;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BeAvatarStatus status;
  final bool showBadge;
  final Widget? badgeContent;
  final BeBadgePosition badgePosition;
  final VoidCallback? onTap;
  final double elevation;
  final Border? border;
  final bool rounded;
  final Offset offset;

  @override
  Widget build(final BuildContext context) {
    final theme = BeTheme.of(context);
    final avatarWidget = _AvatarBuilder(
      size: size,
      style: style,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      border: border,
      theme: theme,
    ).build(image: image, initials: initials, child: child);

    return _wrapWithDecorations(avatarWidget, theme);
  }

  /// Wraps the avatar with badges and tap functionality
  Widget _wrapWithDecorations(final Widget avatarWidget, final BeThemeData theme) {
    Widget result = avatarWidget;

    // Add status indicator if specified
    if (status != BeAvatarStatus.none) {
      result = BeBadge(
        position: BeBadgePosition.bottomRight,
        badge: _StatusIndicator(status: status, size: size, theme: theme).build(),
        rounded: rounded,
        offset: offset,
        child: result,
      );
    }

    // Add custom badge if specified
    if (showBadge && badgeContent != null) {
      result = BeBadge(position: badgePosition, rounded: rounded, offset: offset, badge: badgeContent, child: result);
    }

    // Add tap functionality if provided
    if (onTap != null) {
      result = GestureDetector(onTap: onTap, child: result);
    }

    return result;
  }
}

/// Helper class to build avatar content
class _AvatarBuilder {
  const _AvatarBuilder({
    required this.size,
    required this.style,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.elevation,
    required this.border,
    required this.theme,
  });

  final BeAvatarSize size;
  final BeAvatarStyle style;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final Border? border;
  final BeThemeData theme;

  Widget build({final ImageProvider? image, final String? initials, final Widget? child}) {
    final avatarSize = size.size;
    final borderRadius = _getBorderRadius(style, avatarSize);
    final bgColor = backgroundColor ?? theme.colors.primary;
    final fgColor = foregroundColor ?? theme.colors.onPrimary;
    final hexRadius = size.size * 0.1;

    Widget content;

    if (image != null) {
      content = _buildImageContent(avatarSize, borderRadius, image);
    } else if (initials != null) {
      content = _buildInitialsContent(avatarSize, borderRadius, bgColor, fgColor, initials);
    } else if (child != null) {
      content = _buildCustomContent(avatarSize, borderRadius, bgColor, child);
    } else {
      content = _buildDefaultContent(avatarSize, borderRadius, bgColor, fgColor);
    }

    // Apply hexagon clipping if needed
    if (style == BeAvatarStyle.hexagon) {
      content = ClipPath(clipper: HexagonClipper(borderRadius: hexRadius), child: content);
    }

    return content;
  }

  Widget _buildImageContent(final double avatarSize, final BorderRadius? borderRadius, final ImageProvider image) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: _getContainerDecoration(borderRadius),
      child:
          style == BeAvatarStyle.hexagon
              ? Image(image: image, fit: BoxFit.cover, width: avatarSize, height: avatarSize)
              : ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                child: Image(image: image, fit: BoxFit.cover, width: avatarSize, height: avatarSize),
              ),
    );
  }

  Widget _buildInitialsContent(
    final double avatarSize,
    final BorderRadius? borderRadius,
    final Color bgColor,
    final Color fgColor,
    final String initials,
  ) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: _getContainerDecoration(borderRadius, bgColor),
      child: Center(child: Text(initials, style: _getTextStyle().copyWith(color: fgColor))),
    );
  }

  Widget _buildCustomContent(
    final double avatarSize,
    final BorderRadius? borderRadius,
    final Color bgColor,
    final Widget child,
  ) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: _getContainerDecoration(borderRadius, bgColor),
      child:
          style == BeAvatarStyle.hexagon
              ? child
              : ClipRRect(borderRadius: borderRadius ?? BorderRadius.zero, child: child),
    );
  }

  Widget _buildDefaultContent(
    final double avatarSize,
    final BorderRadius? borderRadius,
    final Color bgColor,
    final Color fgColor,
  ) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: _getContainerDecoration(borderRadius, bgColor),
      child: Icon(Icons.person, color: fgColor, size: avatarSize * 0.6),
    );
  }

  BoxDecoration _getContainerDecoration(final BorderRadius? borderRadius, [final Color? color]) {
    return BoxDecoration(
      color: color,
      borderRadius: style == BeAvatarStyle.hexagon ? null : borderRadius,
      border: border,
      boxShadow:
          elevation > 0
              ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: elevation * 2,
                  offset: Offset(0, elevation),
                ),
              ]
              : null,
    );
  }

  BorderRadius? _getBorderRadius(final BeAvatarStyle style, final double avatarSize) {
    switch (style) {
      case BeAvatarStyle.circle:
        return BorderRadius.circular(avatarSize / 2);
      case BeAvatarStyle.rounded:
        return BorderRadius.circular(8);
      case BeAvatarStyle.square:
      case BeAvatarStyle.hexagon:
        return null;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case BeAvatarSize.xsmall:
        return theme.style.bodySmall.copyWith(fontSize: 10);
      case BeAvatarSize.small:
        return theme.style.labelSmall;
      case BeAvatarSize.medium:
        return theme.style.labelMedium;
      case BeAvatarSize.large:
        return theme.style.titleMedium;
      case BeAvatarSize.extraLarge:
        return theme.style.titleLarge;
    }
  }
}

/// Helper class to build status indicators
class _StatusIndicator {
  const _StatusIndicator({required this.status, required this.size, required this.theme});

  final BeAvatarStatus status;
  final BeAvatarSize size;
  final BeThemeData theme;

  Widget build() {
    if (status == BeAvatarStatus.none || status.color == null) {
      return const SizedBox.shrink();
    }

    final indicatorSize = _getStatusIndicatorSize();

    return Container(
      width: indicatorSize,
      height: indicatorSize,
      decoration: BoxDecoration(
        color: status.color,
        shape: BoxShape.circle,
        border: Border.all(color: theme.colors.surface, width: 2),
      ),
    );
  }

  double _getStatusIndicatorSize() {
    switch (size) {
      case BeAvatarSize.xsmall:
        return 6;
      case BeAvatarSize.small:
        return 8;
      case BeAvatarSize.medium:
        return 12;
      case BeAvatarSize.large:
        return 16;
      case BeAvatarSize.extraLarge:
        return 20;
    }
  }
}
