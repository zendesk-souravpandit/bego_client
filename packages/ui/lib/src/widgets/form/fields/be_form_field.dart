import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:flutter/material.dart';

/// A customizable form field wrapper that provides consistent layout
/// for form fields with labels, helper text, and error messages.
///
/// Features:
/// - Flexible layout with start/end widgets
/// - Customizable title and helper sections
/// - Built-in validation handling
/// - Consistent error display
/// - Full integration with BeFormBuilder system
/// - Advanced state management (dirty, touched, focus)

/// A customizable form field wrapper that extends BeFormBuilderField
/// to provide consistent layout for form fields with labels,
/// helper text, and error messages.
class BeFormField<T> extends BeFormBuilderField<T> {
  BeFormField({
    super.key,
    required super.name,
    required this.fieldBuilder,
    super.initialValue,
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled = true,
    super.restorationId,
    super.valueTransformer,
    super.onChanged,
    super.onReset,
    super.focusNode,
    this.shouldValidate = true,
    this.title,
    this.startEndAxisAlignment = CrossAxisAlignment.center,
    this.helperText,
    this.trailingTitleWidgets = const [],
    this.trailingHelperWidgets = const [],
    this.startWidgets = const [],
    this.endWidgets = const [],
    this.spacing = 4.0,
    this.gap = 8.0,
  }) : super(
         builder: (final field) {
           return _BeFormFieldLayout(
             startEndAxisAlignment: startEndAxisAlignment,
             startWidgets: startWidgets,
             endWidgets: endWidgets,
             children: [
               if (title != null || trailingTitleWidgets.isNotEmpty)
                 _BeFormTitleSection(title: title, trailingWidgets: trailingTitleWidgets),
               SizedBox(height: spacing),
               fieldBuilder(field as BeFormBuilderFieldState<BeFormBuilderField<T>, T>),
               if (helperText != null || trailingHelperWidgets.isNotEmpty)
                 Padding(
                   padding: EdgeInsets.only(top: spacing),
                   child: _BeFormHelperSection(helperText: helperText, trailingWidgets: trailingHelperWidgets),
                 ),
               if (shouldValidate && field.hasError)
                 Padding(
                   padding: EdgeInsets.only(top: spacing / 2),
                   child: _BeFormErrorText(errorText: field.errorText!),
                 ),
             ],
           );
         },
       );

  /// The builder function that creates the actual form field widget
  final Widget Function(BeFormBuilderFieldState<BeFormBuilderField<T>, T> field) fieldBuilder;

  /// Whether to show validation errors
  final bool shouldValidate;

  /// The title text displayed above the field
  final String? title;

  /// Helper text displayed below the field
  final String? helperText;

  /// Widgets displayed after the title
  final List<Widget> trailingTitleWidgets;

  /// Widgets displayed after the helper text
  final List<Widget> trailingHelperWidgets;

  /// Widgets displayed at the start of the field
  final List<Widget> startWidgets;

  /// Widgets displayed at the end of the field
  final List<Widget> endWidgets;

  /// Spacing between field elements
  final double spacing;

  /// Gap between field sections
  final double gap;

  /// Cross axis alignment for start/end widgets
  final CrossAxisAlignment startEndAxisAlignment;

  @override
  BeFormBuilderFieldState<BeFormBuilderField<T>, T> createState() => BeFormFieldState<T>();
}

/// Custom state class that extends BeFormBuilderFieldState to provide
/// access to all BeFormBuilder features while maintaining custom styling
class BeFormFieldState<T> extends BeFormBuilderFieldState<BeFormBuilderField<T>, T> {
  @override
  BeFormField<T> get widget => super.widget as BeFormField<T>;
}

/// Layout widget that arranges start widgets, main content, and end widgets
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
  Widget build(final BuildContext context) {
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

/// Widget that displays the title section with optional trailing widgets
class _BeFormTitleSection extends StatelessWidget {
  const _BeFormTitleSection({this.title, this.trailingWidgets = const []});

  final String? title;
  final List<Widget> trailingWidgets;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        if (title != null) Expanded(child: Text(title!, maxLines: 1, overflow: TextOverflow.ellipsis)),
        if (trailingWidgets.isNotEmpty) ...trailingWidgets,
      ],
    );
  }
}

/// Widget that displays the helper section with optional trailing widgets
class _BeFormHelperSection extends StatelessWidget {
  const _BeFormHelperSection({this.helperText, this.trailingWidgets = const []});

  final String? helperText;
  final List<Widget> trailingWidgets;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        if (helperText != null) Expanded(child: Text(helperText!, maxLines: 1, overflow: TextOverflow.ellipsis)),
        if (trailingWidgets.isNotEmpty) ...trailingWidgets,
      ],
    );
  }
}

/// Widget that displays error text
class _BeFormErrorText extends StatelessWidget {
  const _BeFormErrorText({required this.errorText});

  final String errorText;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return Text(errorText, style: TextStyle(color: theme.colorScheme.error));
  }
}
