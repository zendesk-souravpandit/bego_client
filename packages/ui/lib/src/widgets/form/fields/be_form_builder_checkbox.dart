import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:flutter/material.dart';

/// A checkbox form field.
class BeFormBuilderCheckbox extends BeFormBuilderField<bool> {
  /// Creates a checkbox form field.
  BeFormBuilderCheckbox({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onFormReset,
    super.focusNode,
    super.restorationId,
    this.title,
    this.leading,
    this.trailing,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.activeColor,
    this.checkColor,
    this.tristate = false,
    this.controlAffinity = BeControlAffinity.leading,
    this.autofocus = false,
  }) : super(
         builder: (final FormFieldState<bool?> field) {
           final state = field as _BeFormBuilderCheckboxState;

           return CheckboxListTile(
             value: field.value ?? false,
             onChanged: enabled ? field.didChange : null,
             title: title,
             subtitle: subtitle,
             secondary: controlAffinity == BeControlAffinity.trailing ? leading : trailing,
             isThreeLine: isThreeLine,
             dense: dense,
             activeColor: activeColor,
             checkColor: checkColor,
             tristate: tristate,
             controlAffinity: controlAffinity == BeControlAffinity.leading
                 ? ListTileControlAffinity.leading
                 : ListTileControlAffinity.trailing,
             autofocus: autofocus,
             focusNode: state.effectiveFocusNode,
           );
         },
       );

  /// The primary content of the list item.
  final Widget? title;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display after the title.
  final Widget? trailing;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// Whether this list item is intended to display three lines of text.
  final bool isThreeLine;

  /// Whether this list item is part of a dense list.
  final bool? dense;

  /// The color to use when this checkbox is checked.
  final Color? activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  final Color? checkColor;

  /// If true the checkbox's value can be true, false, or null.
  final bool tristate;

  /// Where to place the control next to a label.
  final BeControlAffinity controlAffinity;

  /// Whether the checkbox should be auto focused.
  final bool autofocus;

  @override
  BeFormBuilderFieldState<BeFormBuilderField<bool>, bool> createState() => _BeFormBuilderCheckboxState();
}

class _BeFormBuilderCheckboxState extends BeFormBuilderFieldState<BeFormBuilderCheckbox, bool> {}
