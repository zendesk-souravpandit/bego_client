import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:flutter/material.dart';

/// A switch form field.
class BeFormBuilderSwitch extends BeFormBuilderFieldDecoration<bool> {
  /// Creates a switch form field.
  BeFormBuilderSwitch({
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
    this.title,
    this.secondary,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.autofocus = false,
  }) : super(
         builder: (final FormFieldState<bool?> field) {
           final state = field as _BeFormBuilderSwitchState;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderSwitch-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: SwitchListTile(
                 value: field.value ?? false,
                 onChanged: state.enabled ? field.didChange : null,
                 title: title,
                 subtitle: subtitle,
                 secondary: secondary,
                 isThreeLine: isThreeLine,
                 dense: dense,
                 autofocus: autofocus,
               ),
             ),
           );
         },
       );

  /// The primary content of the list item.
  final Widget? title;

  /// A widget to display before the title.
  final Widget? secondary;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// Whether this list item is intended to display three lines of text.
  final bool isThreeLine;

  /// Whether this list item is part of a dense list.
  final bool? dense;

  /// Whether the switch should be auto focused.
  final bool autofocus;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderSwitch, bool> createState() => _BeFormBuilderSwitchState();
}

class _BeFormBuilderSwitchState extends BeFormBuilderFieldDecorationState<BeFormBuilderSwitch, bool> {}
