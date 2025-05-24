import 'package:beui/src/widgets/form/be_enable.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';

/// A customizable form field wrapper that provides consistent layout
/// and styling
/// for form fields with labels, helper text, and error messages.
///
/// Features:
/// - Flexible layout with start/end widgets
/// - Customizable title and helper sections
/// - Built-in validation handling
/// - Consistent error display

/// A customizable form field wrapper that provides consistent
/// layout and styling
/// for form fields with labels, helper text, and error messages.
class BeFormField<T> extends FormField<T> {
  BeFormField({
    super.key,
    required this.build,
    super.initialValue,
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled = true,
    super.restorationId,
    this.onChanged,
    this.shouldValidate = true,
    this.title,
    this.titleStyle,
    this.startEndAxisAlignment = CrossAxisAlignment.center,
    this.helperText,
    this.helperStyle,
    this.trailingTitleWidgets = const [],
    this.trailingHelperWidgets = const [],
    this.startWidgets = const [],
    this.endWidgets = const [],
    this.spacing = 4.0,
    this.errorStyle,
    this.gap = 8.0,
  }) : super(
         builder: (field) {
           onChanged?.call(field.value);
           return BeEnabled(
             enabled: enabled,
             child: _BeFormFieldLayout(
               startEndAxisAlignment: startEndAxisAlignment,
               startWidgets: startWidgets,
               endWidgets: endWidgets,
               children: [
                 if (title != null || trailingTitleWidgets.isNotEmpty)
                   _BeFormTitleSection(title: title, titleStyle: titleStyle, trailingWidgets: trailingTitleWidgets),
                 SizedBox(height: spacing),
                 build(field),
                 if (helperText != null || trailingHelperWidgets.isNotEmpty)
                   Padding(
                     padding: EdgeInsets.only(top: spacing),
                     child: _BeFormHelperSection(
                       helperText: helperText,
                       helperStyle: helperStyle,
                       trailingWidgets: trailingHelperWidgets,
                     ),
                   ),
                 if (shouldValidate && field.hasError)
                   Padding(
                     padding: EdgeInsets.only(top: spacing / 2),
                     child: _BeFormErrorText(errorText: field.errorText!, errorStyle: errorStyle),
                   ),
               ],
             ),
           );
         },
       );

  final Widget Function(FormFieldState<T> field) build;

  final ValueChanged<T?>? onChanged;
  final bool shouldValidate;
  final String? title;
  final TextStyle? titleStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final List<Widget> trailingTitleWidgets;
  final List<Widget> trailingHelperWidgets;
  final List<Widget> startWidgets;
  final List<Widget> endWidgets;
  final double spacing;
  final double gap;
  final CrossAxisAlignment startEndAxisAlignment;
  final TextStyle? errorStyle;

  @override
  FormFieldState<T> createState() => BeFormFieldState<T>();
}

// class _BeFormFieldState<T> extends FormFieldState<T> {
//   @override
//   BeFormField<T> get widget => super.widget as BeFormField<T>;
// }

class _BeFormFieldLayout extends StatelessWidget {
  const _BeFormFieldLayout({
    required this.startWidgets,
    required this.endWidgets,
    required this.children,
    this.startEndAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> startWidgets;
  final List<Widget> endWidgets;
  final List<Widget> children;
  final CrossAxisAlignment startEndAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: startEndAxisAlignment,
      children: [
        if (startWidgets.isNotEmpty) ...startWidgets,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
        if (endWidgets.isNotEmpty) ...endWidgets,
      ],
    );
  }
}

class _BeFormTitleSection extends StatelessWidget {
  const _BeFormTitleSection({this.title, this.titleStyle, this.trailingWidgets = const []});

  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> trailingWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null)
          Expanded(
            child: BeText(
              title!,
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
              style: titleStyle ?? const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        if (trailingWidgets.isNotEmpty) ...trailingWidgets,
      ],
    );
  }
}

class _BeFormHelperSection extends StatelessWidget {
  const _BeFormHelperSection({this.helperText, this.helperStyle, this.trailingWidgets = const []});

  final String? helperText;
  final TextStyle? helperStyle;
  final List<Widget> trailingWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (helperText != null)
          Expanded(
            child: BeText(
              helperText,
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
              style: helperStyle ?? const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey),
            ),
          ),
        if (trailingWidgets.isNotEmpty) ...trailingWidgets,
      ],
    );
  }
}

class _BeFormErrorText extends StatelessWidget {
  const _BeFormErrorText({required this.errorText, this.errorStyle});

  final String errorText;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BeText(errorText, style: errorStyle ?? TextStyle(color: theme.colorScheme.error, fontSize: 12));
  }
}

class BeFormFieldState<T> extends FormFieldState<T> {}
