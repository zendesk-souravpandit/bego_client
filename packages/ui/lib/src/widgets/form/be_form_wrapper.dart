import 'package:beui/src/widgets/form/be_enable.dart';
import 'package:flutter/material.dart';

class BeFormField<T> extends FormField<T> {
  BeFormField({
    Key? key,
    required this.build,
    T? initialValue,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    bool enabled = true,
    String? restorationId,
    String? forceErrorText,
    this.onChanged,
    this.shouldValidate = true,
    this.title,
    this.titleStyle,
    this.helperText,
    this.helperStyle,
    this.trailingTitleWidgets = const [],
    this.trailingHelperWidgets = const [],
    this.spacing = 4.0,
    this.errorStyle,
  }) : super(
         key: key,
         initialValue: initialValue,
         onSaved: onSaved,
         validator: validator,
         autovalidateMode: autovalidateMode,
         enabled: enabled,
         restorationId: restorationId,
         forceErrorText: forceErrorText,
         builder: (FormFieldState<T> field) {
           void handleChanged(T? value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return BeEnabled(
             enabled: enabled,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: [
                 if (title != null || trailingTitleWidgets.isNotEmpty)
                   _BeFormHeader(
                     title: title,
                     titleStyle: titleStyle,
                     trailingWidgets: trailingTitleWidgets,
                   ),

                 build(
                   _BeFormFieldState(
                     field: field,
                     onChanged: handleChanged,
                     enabled: enabled,
                   ),
                 ),

                 if (helperText != null || trailingHelperWidgets.isNotEmpty)
                   _BeFormHelper(
                     helperText: helperText,
                     helperStyle: helperStyle,
                     trailingWidgets: trailingHelperWidgets,
                   ),

                 if (shouldValidate && field.hasError)
                   Padding(
                     padding: EdgeInsets.only(top: spacing),
                     child: Text(
                       field.errorText!,
                       style:
                           errorStyle ??
                           TextStyle(
                             color: Theme.of(field.context).colorScheme.error,
                             fontSize: 12,
                           ),
                     ),
                   ),
               ],
             ),
           );
         },
       );

  final Widget Function(FormFieldState<T> field) build;
  final ValueChanged<T?>? onChanged;
  final bool shouldValidate;

  // Header section
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> trailingTitleWidgets;

  // Helper section
  final String? helperText;
  final TextStyle? helperStyle;
  final List<Widget> trailingHelperWidgets;

  // Layout
  final double spacing;
  final TextStyle? errorStyle;
}

/// Custom FormField state that exposes additional properties
class _BeFormFieldState<T> extends FormFieldState<T> {
  _BeFormFieldState({
    required this.field,
    required this.onChanged,
    this.enabled = true,
  });

  final FormFieldState<T> field;
  final ValueChanged<T?> onChanged;
  final bool enabled;

  // T? get value => field.value;
  // bool get hasError => field.hasError;
  // String? get errorText => field.errorText;
  // bool get isValid => field.isValid;

  void didChange(T? value) => onChanged(value);
  void markAsTouched() {
    if (!field.hasError) {
      field.didChange(field.value);
    }
  }
}

/// Reusable header component
class _BeFormHeader extends StatelessWidget {
  const _BeFormHeader({
    this.title,
    this.titleStyle,
    this.trailingWidgets = const [],
  });

  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> trailingWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null)
          Expanded(
            child: Text(
              title!,
              style:
                  titleStyle ??
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ...trailingWidgets,
      ],
    );
  }
}

/// Reusable helper text component
class _BeFormHelper extends StatelessWidget {
  const _BeFormHelper({
    this.helperText,
    this.helperStyle,
    this.trailingWidgets = const [],
  });

  final String? helperText;
  final TextStyle? helperStyle;
  final List<Widget> trailingWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (helperText != null)
          Expanded(
            child: Text(
              helperText!,
              style:
                  helperStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
            ),
          ),
        ...trailingWidgets,
      ],
    );
  }
}
