import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

/// A generic FormField wrapper that can make any widget accessible as a form field
class BeFormField<T> extends FormField<T> {
  BeFormField({
    super.key,
    required Widget Function(FormFieldState<T> field) builder,
    T? initialValue,
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled = true,
    super.restorationId,
    super.forceErrorText,
    ValueChanged<T?>? onChanged,
    bool shouldValidate = true,
  }) : super(
         initialValue: initialValue,
         builder: (FormFieldState<T> field) {
           void handleChanged(T? value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               const BeTextForm12(),
               builder(
                 _BeFormFieldState(
                   field: field,
                   onChanged: handleChanged,
                   enabled: enabled,
                 ),
               ),
               if (shouldValidate && field.hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 4.0),
                   child: Text(
                     field.errorText!,
                     style: TextStyle(
                       color: Theme.of(field.context).colorScheme.error,
                       fontSize: 12,
                     ),
                   ),
                 ),
               const BeTextForm11(),
             ],
           );
         },
       );
}

/// Custom FormField state that exposes additional properties to the builder
class _BeFormFieldState<T> extends FormFieldState<T> {
  _BeFormFieldState({
    required this.field,
    required this.onChanged,
    this.enabled = true,
  });

  final FormFieldState<T> field;
  final ValueChanged<T?> onChanged;

  /// The current value of the form field
  T? get value => field.value;

  /// Whether the field has an error
  bool get hasError => field.hasError;
  late bool enabled;

  /// The current error text
  String? get errorText => field.errorText;

  /// Whether the field is valid
  bool get isValid => field.isValid;

  /// Call this when the field value changes
  void didChange(T? value) => onChanged(value);

  /// Call this to mark the field as touched
  void markAsTouched() {
    if (!field.hasError) {
      field.didChange(field.value);
    }
  }
}

//  BeText
// BeTextForm21
// BeRow                                      F11

class BeTextForm12 extends StatelessWidget {
  const BeTextForm12({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: px8,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: BeText(
              'Input title',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          BeText(
            'Data2',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          BeText(
            'Data1',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class BeTextForm11 extends StatelessWidget {
  const BeTextForm11({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: px8,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: BeText(
              'Helper message',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: BeColors.gray500,
              ),
            ),
          ),
          BeText(
            'Data',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: BeColors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
