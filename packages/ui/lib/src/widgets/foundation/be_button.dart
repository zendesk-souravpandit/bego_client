import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Button size variants
enum BeButtonSize { small, medium, large }

/// Button style variants
enum BeButtonVariant { primary, secondary, outline, text, destructive }

/// A customizable button component that follows BeUI design system
class BeButton extends StatelessWidget {
  const BeButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.variant = BeButtonVariant.primary,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  });

  /// Creates a primary button
  const BeButton.primary({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  }) : variant = BeButtonVariant.primary;

  /// Creates a secondary button
  const BeButton.secondary({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  }) : variant = BeButtonVariant.secondary;

  /// Creates an outline button
  const BeButton.outline({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  }) : variant = BeButtonVariant.outline;

  /// Creates a text button
  const BeButton.text({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  }) : variant = BeButtonVariant.text;

  /// Creates a destructive button
  const BeButton.destructive({
    super.key,
    required this.onPressed,
    required this.child,
    this.size = BeButtonSize.medium,
    this.isLoading = false,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
  }) : variant = BeButtonVariant.destructive;

  final VoidCallback? onPressed;
  final Widget child;
  final BeButtonSize size;
  final BeButtonVariant variant;
  final bool isLoading;
  final bool disabled;
  final bool fullWidth;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    final theme = BeTheme.of(context);
    final style = _getButtonStyle(theme);

    final effectiveOnPressed = (disabled || isLoading) ? null : onPressed;

    Widget buttonChild = _buildButtonContent();

    if (fullWidth) {
      buttonChild = SizedBox(width: double.infinity, child: buttonChild);
    }

    return ElevatedButton(onPressed: effectiveOnPressed, style: style, child: buttonChild);
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: _getButtonHeight(),
        child: const Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
      );
    }

    if (icon != null) {
      return Row(mainAxisSize: MainAxisSize.min, children: [icon!, const SizedBox(width: 8), child]);
    }

    return child;
  }

  ButtonStyle _getButtonStyle(final BeThemeData theme) {
    final colors = theme.colors;
    final adaptiveStyle = theme.style.adaptiveStyle;

    // Get responsive padding based on size and screen breakpoint
    final padding = _getButtonPadding(adaptiveStyle);
    final height = _getButtonHeight();

    switch (variant) {
      case BeButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          padding: padding,
          minimumSize: Size(0, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case BeButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          padding: padding,
          minimumSize: Size(0, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case BeButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          padding: padding,
          minimumSize: Size(0, height),
          side: BorderSide(color: colors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case BeButtonVariant.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          padding: padding,
          minimumSize: Size(0, height),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case BeButtonVariant.destructive:
        return ElevatedButton.styleFrom(
          backgroundColor: colors.error,
          foregroundColor: colors.onError,
          padding: padding,
          minimumSize: Size(0, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
    }
  }

  EdgeInsets _getButtonPadding(final BeAdaptiveStyle adaptiveStyle) {
    switch (size) {
      case BeButtonSize.small:
        return EdgeInsets.symmetric(horizontal: adaptiveStyle.buttonSmallPaddingHorizontal, vertical: 8);
      case BeButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: adaptiveStyle.buttonMediumPaddingHorizontal, vertical: 12);
      case BeButtonSize.large:
        return EdgeInsets.symmetric(horizontal: adaptiveStyle.buttonLargePaddingHorizontal, vertical: 16);
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case BeButtonSize.small:
        return 32;
      case BeButtonSize.medium:
        return 40;
      case BeButtonSize.large:
        return 48;
    }
  }
}
