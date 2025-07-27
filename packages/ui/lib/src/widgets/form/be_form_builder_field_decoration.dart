import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:flutter/material.dart';

/// Extends [BeFormBuilderField] and add a `decoration` (InputDecoration) property
///
/// This class override `decoration.enable` with [enable] value
class BeFormBuilderFieldDecoration<T> extends BeFormBuilderField<T> {
  BeFormBuilderFieldDecoration({
    super.key,
    super.onSaved,
    super.initialValue,
    super.autovalidateMode,
    super.enabled = true,
    super.validator,
    super.restorationId,
    required super.name,
    super.valueTransformer,
    super.onChanged,
    super.onReset,
    super.focusNode,
    super.errorBuilder,
    required super.builder,
    this.decoration = const InputDecoration(),
  }) : assert(
         decoration.enabled == enabled || (enabled == false && decoration.enabled),
         '''decoration.enabled will be used instead of enabled BeFormBuilderField property.
            This will create conflicts and unexpected behaviors on focus, errorText, and other properties.
            Please, to enable or disable the field, use the enabled property of BeFormBuilderField.''',
       );
  final InputDecoration decoration;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderFieldDecoration<T>, T> createState() =>
      BeFormBuilderFieldDecorationState<BeFormBuilderFieldDecoration<T>, T>();
}

class BeFormBuilderFieldDecorationState<F extends BeFormBuilderFieldDecoration<T>, T>
    extends BeFormBuilderFieldState<BeFormBuilderField<T>, T> {
  @override
  F get widget => super.widget as F;

  /// Get the decoration with the current state
  InputDecoration get decoration {
    final String? efectiveErrorText = widget.enabled || readOnly ? widget.decoration.errorText ?? errorText : null;

    return widget.decoration.copyWith(
      // Read only allow show error to support property skipDisabled
      errorText: widget.errorBuilder != null ? null : efectiveErrorText,
      error:
          widget.errorBuilder != null && efectiveErrorText != null
              ? widget.errorBuilder!(context, efectiveErrorText)
              : null,
      enabled: widget.decoration.enabled ? widget.enabled : false,
    );
  }

  @override
  bool get hasError => super.hasError || widget.decoration.errorText != null;

  @override
  bool get isValid => super.isValid && widget.decoration.errorText == null;
}
