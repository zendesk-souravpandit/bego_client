import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:beui/src/widgets/form/options/be_form_builder_chip_option.dart';
import 'package:flutter/material.dart';

/// A filter chips form field.
class BeFormBuilderFilterChips<T> extends BeFormBuilderFieldDecoration<List<T>> {
  /// Creates a filter chips form field.
  BeFormBuilderFilterChips({
    super.key,
    required super.name,
    required this.options,
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
    this.allowMultipleSelection = true,
    this.maxChips,
    this.spacing,
    this.runSpacing,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(
         builder: (final FormFieldState<List<T>?> field) {
           final state = field as _BeFormBuilderFilterChipsState<T>;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderFilterChips-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: Wrap(
                 spacing: spacing ?? 8.0,
                 runSpacing: runSpacing ?? 4.0,
                 direction: direction,
                 alignment: alignment,
                 crossAxisAlignment: crossAxisAlignment,
                 textDirection: textDirection,
                 verticalDirection: verticalDirection,
                 children:
                     options.map((final option) {
                       final isSelected = field.value?.contains(option.value) ?? false;

                       return FilterChip(
                         label: option.child ?? Text('${option.value}'),
                         selected: isSelected,
                         onSelected:
                             state.enabled
                                 ? (final selected) {
                                   List<T> currentValue = List<T>.from(field.value ?? []);

                                   if (selected) {
                                     if (allowMultipleSelection) {
                                       if (maxChips == null || currentValue.length < maxChips) {
                                         if (!currentValue.contains(option.value)) {
                                           currentValue.add(option.value);
                                         }
                                       }
                                     } else {
                                       currentValue = [option.value];
                                     }
                                   } else {
                                     currentValue.remove(option.value);
                                   }

                                   field.didChange(currentValue);
                                 }
                                 : null,
                       );
                     }).toList(),
               ),
             ),
           );
         },
       );

  /// List of chip options
  final List<BeFormBuilderChipOption<T>> options;

  /// Whether multiple selections are allowed
  final bool allowMultipleSelection;

  /// Maximum number of chips that can be selected
  final int? maxChips;

  /// Spacing between chips
  final double? spacing;

  /// Run spacing between chip rows
  final double? runSpacing;

  /// Direction of the chip layout
  final Axis direction;

  /// Alignment of chips in each run
  final WrapAlignment alignment;

  /// Cross axis alignment of chips
  final WrapCrossAlignment crossAxisAlignment;

  /// Text direction
  final TextDirection? textDirection;

  /// Vertical direction
  final VerticalDirection verticalDirection;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderFilterChips<T>, List<T>> createState() =>
      _BeFormBuilderFilterChipsState<T>();
}

class _BeFormBuilderFilterChipsState<T>
    extends BeFormBuilderFieldDecorationState<BeFormBuilderFilterChips<T>, List<T>> {}
