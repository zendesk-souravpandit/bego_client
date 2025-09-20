import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:flutter/material.dart';

/// A range slider form field.
class BeFormBuilderRangeSlider extends BeFormBuilderFieldDecoration<RangeValues> {
  /// Creates a range slider form field.
  BeFormBuilderRangeSlider({
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
    super.onFormReset,
    super.focusNode,
    super.restorationId,
    super.errorBuilder,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.autofocus = false,
  }) : super(
         builder: (final FormFieldState<RangeValues?> field) {
           final state = field as _BeFormBuilderRangeSliderState;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderRangeSlider-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: RangeSlider(
                 values: field.value ?? RangeValues(min, max),
                 onChanged: state.enabled ? field.didChange : null,
                 min: min,
                 max: max,
                 divisions: divisions,
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
  BeFormBuilderFieldDecorationState<BeFormBuilderRangeSlider, RangeValues> createState() =>
      _BeFormBuilderRangeSliderState();
}

class _BeFormBuilderRangeSliderState extends BeFormBuilderFieldDecorationState<BeFormBuilderRangeSlider, RangeValues> {}
