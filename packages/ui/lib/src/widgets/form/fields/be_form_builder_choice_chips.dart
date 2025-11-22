import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:beui/src/widgets/form/options/be_form_builder_chip_option.dart';
import 'package:flutter/material.dart';

/// A list of `Chip`s that acts like radio buttons
class BeFormBuilderChoiceChips<T> extends BeFormBuilderFieldDecoration<T> {
  /// Creates a choice chips field
  BeFormBuilderChoiceChips({
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
    required this.options,
    this.spacing = 8.0,
    this.runSpacing = 0.0,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.direction = Axis.horizontal,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.disabled,
  }) : super(
         builder: (final FormFieldState<T?> field) {
           final state = field as _BeFormBuilderChoiceChipsState<T>;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderChoiceChips-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: Wrap(
                 direction: direction,
                 spacing: spacing,
                 runSpacing: runSpacing,
                 alignment: alignment,
                 runAlignment: runAlignment,
                 crossAxisAlignment: crossAxisAlignment,
                 textDirection: textDirection,
                 verticalDirection: verticalDirection,
                 children: options.map<Widget>((final option) {
                   final isDisabled = !state.enabled || (disabled?.contains(option.value) ?? false);
                   final isSelected = field.value == option.value;

                   return Builder(
                     builder: (final context) => ChoiceChip(
                       label: option.build(context),
                       selected: isSelected,
                       onSelected: isDisabled
                           ? null
                           : (final selected) {
                               if (selected) {
                                 field.didChange(option.value);
                               } else {
                                 field.didChange(null);
                               }
                             },
                     ),
                   );
                 }).toList(),
               ),
             ),
           );
         },
       );

  /// The list of items the user can select.
  final List<BeFormBuilderChipOption<T>> options;

  /// The spacing between chips
  final double spacing;

  /// The spacing between runs
  final double runSpacing;

  /// How the chips should be aligned
  final WrapAlignment alignment;

  /// How the runs should be aligned
  final WrapAlignment runAlignment;

  /// Cross axis alignment
  final WrapCrossAlignment crossAxisAlignment;

  /// Direction of the chips
  final Axis direction;

  /// Text direction
  final TextDirection? textDirection;

  /// Vertical direction
  final VerticalDirection verticalDirection;

  /// List of disabled options
  final List<T>? disabled;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderChoiceChips<T>, T> createState() =>
      _BeFormBuilderChoiceChipsState<T>();
}

class _BeFormBuilderChoiceChipsState<T> extends BeFormBuilderFieldDecorationState<BeFormBuilderChoiceChips<T>, T> {}
