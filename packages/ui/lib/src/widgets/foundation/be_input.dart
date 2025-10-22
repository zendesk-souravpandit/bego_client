import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// Input field size variants
enum BeInputSize { small, medium, large }

/// Input field variants
enum BeInputVariant { outlined, filled, underlined }

/// A customizable input field component that follows BeUI design system
class BeInput extends StatelessWidget {
  const BeInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.size = BeInputSize.medium,
    this.variant = BeInputVariant.outlined,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.focusNode,
  });

  /// Creates an outlined input field
  const BeInput.outlined({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.size = BeInputSize.medium,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.focusNode,
  }) : variant = BeInputVariant.outlined;

  /// Creates a filled input field
  const BeInput.filled({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.size = BeInputSize.medium,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.focusNode,
  }) : variant = BeInputVariant.filled;

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BeInputSize size;
  final BeInputVariant variant;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(final BuildContext context) {
    final theme = BeTheme.of(context);
    final adaptiveStyle = theme.style.adaptiveStyle;

    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      focusNode: focusNode,
      style: _getTextStyle(theme),
      decoration: _getInputDecoration(theme, adaptiveStyle),
    );
  }

  TextStyle _getTextStyle(final BeThemeData theme) {
    switch (size) {
      case BeInputSize.small:
        return theme.style.bodySmall;
      case BeInputSize.medium:
        return theme.style.bodyMedium;
      case BeInputSize.large:
        return theme.style.bodyLarge;
    }
  }

  InputDecoration _getInputDecoration(final BeThemeData theme, final BeAdaptiveStyle adaptiveStyle) {
    final colors = theme.colors;
    final padding = _getContentPadding(adaptiveStyle);

    final baseDecoration = InputDecoration(
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding,
      enabled: enabled,
    );

    switch (variant) {
      case BeInputVariant.outlined:
        return baseDecoration.copyWith(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.error),
          ),
        );

      case BeInputVariant.filled:
        return baseDecoration.copyWith(
          filled: true,
          fillColor: colors.surface,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: colors.primary, width: 2),
          ),
        );

      case BeInputVariant.underlined:
        return baseDecoration.copyWith(
          border: UnderlineInputBorder(borderSide: BorderSide(color: colors.outline)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.outline)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.primary, width: 2)),
        );
    }
  }

  EdgeInsets _getContentPadding(final BeAdaptiveStyle adaptiveStyle) {
    switch (size) {
      case BeInputSize.small:
        return EdgeInsets.symmetric(
          horizontal: adaptiveStyle.inputContentPaddingHorizontal * 0.75,
          vertical: adaptiveStyle.inputContentPaddingVertical * 0.75,
        );
      case BeInputSize.medium:
        return EdgeInsets.symmetric(
          horizontal: adaptiveStyle.inputContentPaddingHorizontal,
          vertical: adaptiveStyle.inputContentPaddingVertical,
        );
      case BeInputSize.large:
        return EdgeInsets.symmetric(
          horizontal: adaptiveStyle.inputContentPaddingHorizontal * 1.25,
          vertical: adaptiveStyle.inputContentPaddingVertical * 1.25,
        );
    }
  }
}
