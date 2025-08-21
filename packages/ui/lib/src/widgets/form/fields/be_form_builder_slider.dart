import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:flutter/material.dart';

/// A slider form field.
class BeFormBuilderSlider extends BeFormBuilderFieldDecoration<double> {
  /// Creates a slider form field.
  BeFormBuilderSlider({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    super.restorationId,
    super.errorBuilder,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.autofocus = false,
  }) : super(
         builder: (final FormFieldState<double?> field) {
           final state = field as _BeFormBuilderSliderState;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderSlider-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: Slider(
                 value: (field.value ?? min).clamp(min, max),
                 onChanged: state.enabled ? field.didChange : null,
                 min: min,
                 max: max,
                 divisions: divisions,
                 autofocus: autofocus,
               ),
             ),
           );
         },
       );

  /// The minimum value the user can select.
  final double min;

  /// The maximum value the user can select.
  final double max;

  /// The number of discrete divisions.
  final int? divisions;

  /// Whether the slider should be auto focused.
  final bool autofocus;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderSlider, double> createState() => _BeFormBuilderSliderState();
}

class _BeFormBuilderSliderState extends BeFormBuilderFieldDecorationState<BeFormBuilderSlider, double> {}
