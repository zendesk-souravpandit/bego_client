import 'package:beui/src/widgets/form/be_form_builder_field_decoration.dart';
import 'package:flutter/material.dart';

/// A date range picker form field.
class BeFormBuilderDateRangePicker extends BeFormBuilderFieldDecoration<DateTimeRange> {
  /// Creates a date range picker form field.
  BeFormBuilderDateRangePicker({
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
    this.readOnly = false,
    this.firstDate,
    this.lastDate,
  }) : super(
         builder: (final FormFieldState<DateTimeRange?> field) {
           final state = field as _BeFormBuilderDateRangePickerState;

           return Focus(
             focusNode: state.effectiveFocusNode,
             skipTraversal: true,
             canRequestFocus: state.enabled,
             debugLabel: 'BeFormBuilderDateRangePicker-$name',
             child: InputDecorator(
               decoration: state.decoration,
               isFocused: state.effectiveFocusNode.hasFocus,
               child: TextFormField(
                 readOnly: true,
                 controller: TextEditingController(
                   text: field.value != null
                       ? '${field.value!.start.toString().split(' ')[0]} - ${field.value!.end.toString().split(' ')[0]}'
                       : '',
                 ),
                 decoration: const InputDecoration(suffixIcon: Icon(Icons.date_range), border: InputBorder.none),
                 onTap: state.enabled && !readOnly
                     ? () async {
                         final picked = await showDateRangePicker(
                           context: state.context,
                           firstDate: firstDate ?? DateTime(1900),
                           lastDate: lastDate ?? DateTime(2100),
                           initialDateRange: field.value,
                         );
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

  /// Whether the field should be read only
  final bool readOnly;

  /// First selectable date
  final DateTime? firstDate;

  /// Last selectable date
  final DateTime? lastDate;

  @override
  BeFormBuilderFieldDecorationState<BeFormBuilderDateRangePicker, DateTimeRange> createState() =>
      _BeFormBuilderDateRangePickerState();
}

class _BeFormBuilderDateRangePickerState
    extends BeFormBuilderFieldDecorationState<BeFormBuilderDateRangePicker, DateTimeRange> {}
