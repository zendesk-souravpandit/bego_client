import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:flutter/material.dart';

/// A date time picker form field.
class BeFormBuilderDateTimePicker extends BeFormBuilderFieldDecoration<DateTime> {
  /// Creates a date time picker form field.
  BeFormBuilderDateTimePicker({
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
    this.inputType = InputType.date,
    this.readOnly = false,
    this.firstDate,
    this.lastDate,
  }) : super(
         builder: (final FormFieldState<DateTime?> field) {
           final state = field as _BeFormBuilderDateTimePickerState;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderDateTimePicker-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: TextFormField(
                 readOnly: true,
                 controller: TextEditingController(text: field.value?.toString() ?? ''),
                 decoration: const InputDecoration(suffixIcon: Icon(Icons.calendar_today), border: InputBorder.none),
                 onTap: state.enabled && !readOnly
                     ? () async {
                         DateTime? picked;
                         if (inputType == InputType.date) {
                           picked = await showDatePicker(
                             context: state.context,
                             initialDate: field.value ?? DateTime.now(),
                             firstDate: firstDate ?? DateTime(1900),
                             lastDate: lastDate ?? DateTime(2100),
                           );
                         } else if (inputType == InputType.time) {
                           final time = await showTimePicker(
                             context: state.context,
                             initialTime: TimeOfDay.fromDateTime(field.value ?? DateTime.now()),
                           );
                           if (time != null) {
                             final now = DateTime.now();
                             picked = DateTime(now.year, now.month, now.day, time.hour, time.minute);
                           }
                         }
                         if (picked != null) {
                           field.didChange(picked);
                         }
                       }
                     : null,
               ),
             ),
           );
         },
       );

  /// The type of input to show (date, time, or both)
  final InputType inputType;

  /// Whether the field should be read only
  final bool readOnly;

  /// First selectable date
  final DateTime? firstDate;

  /// Last selectable date
  final DateTime? lastDate;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderDateTimePicker, DateTime> createState() =>
      _BeFormBuilderDateTimePickerState();
}

enum InputType { date, time, both }

class _BeFormBuilderDateTimePickerState
    extends BeFormBuilderFieldDecorationState<BeFormBuilderDateTimePicker, DateTime> {}
