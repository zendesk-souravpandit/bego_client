// import 'package:flutter/material.dart';

// /// A generic FormField wrapper that can make any widget accessible as a form field
// class BeFormField<T> extends FormField<T> {
//   BeFormField({
//     super.key,
//     required Widget Function(FormFieldState<T> field) builder,
//     super.onSaved,
//     super.validator,
//     super.autovalidateMode = AutovalidateMode.disabled,
//     super.enabled = true,
//     super.restorationId,
//     super.forceErrorText,
//     T? initialValue,
//     ValueChanged<T?>? onChanged,
//     bool shouldValidate = true,
//   }) : super(
//          initialValue: initialValue,
//          builder: (FormFieldState<T> field) {
//            void handleChanged(T? value) {
//              field.didChange(value);
//              onChanged?.call(value);
//            }

//            return Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisSize: MainAxisSize.min,
//              children: [
//                builder(
//                  _BeFormFieldState(
//                    field: field,
//                    onChanged: handleChanged,
//                    enabled: enabled,
//                  ),
//                ),
//                if (shouldValidate && field.hasError)
//                  Padding(
//                    padding: const EdgeInsets.only(top: 4.0),
//                    child: Text(
//                      field.errorText!,
//                      style: TextStyle(
//                        color: Theme.of(field.context).colorScheme.error,
//                        fontSize: 12,
//                      ),
//                    ),
//                  ),
//              ],
//            );
//          },
//        );
// }

// /// Custom FormField state that exposes additional properties to the builder
// class _BeFormFieldState<T> extends FormFieldState<T> {
//   _BeFormFieldState({
//     required this.field,
//     required this.onChanged,
//     this.enabled = true,
//   });

//   final FormFieldState<T> field;
//   final ValueChanged<T?> onChanged;

//   /// The current value of the form field
//   T? get value => field.value;

//   /// Whether the field has an error
//   bool get hasError => field.hasError;
//   late bool enabled;

//   /// The current error text
//   String? get errorText => field.errorText;

//   /// Whether the field is valid
//   bool get isValid => field.isValid;

//   /// Call this when the field value changes
//   void didChange(T? value) => onChanged(value);

//   /// Call this to mark the field as touched
//   void markAsTouched() {
//     if (!field.hasError) {
//       field.didChange(field.value);
//     }
//   }
// }
