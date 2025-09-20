import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:beui/src/widgets/form/be_form_builder_field_option.dart';
import 'package:beui/src/widgets/form/group/be_grouped_radio.dart';
import 'package:flutter/material.dart';

/// A list of radio buttons for selecting a single option
class BeFormBuilderRadioGroup<T> extends BeFormBuilderFieldDecoration<T> {
  /// Creates a list of radio buttons for selecting a single option
  BeFormBuilderRadioGroup({
    super.key,
    required super.name,
    this.visualDensity,
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
    this.disabled,
    this.materialTapTargetSize,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = BeControlAffinity.leading,
    this.orientation = BeOptionsOrientation.wrap,
  }) : super(
         builder: (final FormFieldState<T?> field) {
           final state = field as _BeFormBuilderRadioGroupState<T>;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderRadioGroup-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: BeGroupedRadio<T>(
                 orientation: orientation,
                 value: state.value,
                 options: options,
                 onChanged: field.didChange,
                 disabled: state.enabled ? disabled : options.map((final e) => e.value).toList(),
                 visualDensity: visualDensity,
                 materialTapTargetSize: materialTapTargetSize,
                 wrapAlignment: wrapAlignment,
                 wrapCrossAxisAlignment: wrapCrossAxisAlignment,
                 wrapDirection: wrapDirection,
                 wrapRunAlignment: wrapRunAlignment,
                 wrapRunSpacing: wrapRunSpacing,
                 wrapSpacing: wrapSpacing,
                 wrapTextDirection: wrapTextDirection,
                 wrapVerticalDirection: wrapVerticalDirection,
                 separator: separator,
                 controlAffinity: controlAffinity,
               ),
             ),
           );
         },
       );
  final List<BeFormBuilderFieldOption<T>> options;
  final VisualDensity? visualDensity;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final BeControlAffinity controlAffinity;
  final BeOptionsOrientation orientation;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderRadioGroup<T>, T> createState() => _BeFormBuilderRadioGroupState<T>();
}

class _BeFormBuilderRadioGroupState<T> extends BeFormBuilderFieldDecorationState<BeFormBuilderRadioGroup<T>, T> {}
