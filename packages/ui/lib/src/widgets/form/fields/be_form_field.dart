import 'package:beui/beui.dart';
import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:flutter/material.dart';

/// A customizable form field wrapper that provides consistent layout
/// for form fields with labels, helper text, and error messages.
///
/// This widget extends [BeFormBuilderField] and provides a comprehensive
/// solution for creating form fields with consistent styling and behavior.
///
/// ## Features:
/// - Flexible layout with start/end widgets
/// - Customizable title and helper sections
/// - Built-in validation handling with customizable error display
/// - Consistent spacing and alignment
/// - Full integration with BeFormBuilder system
/// - Advanced state management (dirty, touched, focus)
/// - Accessibility support with semantic labels
/// - Performance optimized with const constructors
///
/// ## Usage Example:
/// ```dart
/// BeFormField<String>(
///   name: 'email',
///   title: 'Email Address',
///   helperText: 'Enter your email address',
///   validator: (value) => value?.isEmpty == true ? 'Required' : null,
///   fieldBuilder: (field) => TextField(
///     onChanged: field.didChange,
///     decoration: InputDecoration(
///       hintText: 'Enter email...',
///       errorText: field.errorText,
///     ),
///   ),
///   startWidgets: [Icon(Icons.email)],
///   trailingTitleWidgets: [Text('*', style: TextStyle(color: Colors.red))],
/// )
/// ```
///
/// ## Layout Structure:
/// ```
/// Row(
///   children: [
///     [startWidgets], // Optional leading widgets
///     Expanded(
///       child: Column(
///         children: [
///           [title + trailingTitleWidgets], // Optional title row
///           [fieldBuilder result],          // The actual form field
///           [helperText + trailingHelperWidgets], // Optional helper row
///           [error text],                   // Optional error text
///         ],
///       ),
///     ),
///     [endWidgets], // Optional trailing widgets
///   ],
/// )
/// ```
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
    super.onFormReset,
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
           final typedField = field as BeFormBuilderFieldState<BeFormBuilderField<T>, T>;
           final children = <Widget>[
             if (title != null || trailingTitleWidgets.isNotEmpty) ...[
               _BeFormTitleSection(title: title, trailingWidgets: trailingTitleWidgets),
               if (spacing > 0) SizedBox(height: spacing),
             ],

             // Main field content
             fieldBuilder(typedField),

             // Helper section and spacing
             if (helperText != null || trailingHelperWidgets.isNotEmpty) ...[
               if (spacing > 0) SizedBox(height: spacing),
               _BeFormHelperSection(helperText: helperText, trailingWidgets: trailingHelperWidgets),
             ],

             // Error section
             if (shouldValidate && typedField.hasError && typedField.errorText != null) ...[
               SizedBox(height: spacing / 2),
               _BeFormErrorText(errorText: typedField.errorText!),
             ],
           ];

           return BeEnabled(
             enabled: enabled,

             child: _BeFormFieldLayout(
               startEndAxisAlignment: startEndAxisAlignment,
               startWidgets: startWidgets,
               endWidgets: endWidgets,
               children: children,
             ),
           );
         },
       );

  /// The builder function that creates the actual form field widget.
  ///
  /// This function receives the current field state and should return
  /// the widget that represents the form input (e.g., TextField, Checkbox, etc.).
  ///
  /// Example:
  /// ```dart
  /// fieldBuilder: (field) => TextField(
  ///   onChanged: field.didChange,
  ///   decoration: InputDecoration(
  ///     errorText: field.errorText,
  ///   ),
  /// )
  /// ```
  final Widget Function(BeFormBuilderFieldState<BeFormBuilderField<T>, T> field) fieldBuilder;

  /// Whether to display validation errors.
  ///
  /// When `false`, error messages will not be shown even if validation fails.
  /// Defaults to `true`.
  final bool shouldValidate;

  /// The title text displayed above the field.
  ///
  /// If null, no title section will be displayed.
  final String? title;

  /// Helper text displayed below the field.
  ///
  /// Typically used to provide additional context or instructions.
  /// If null, no helper section will be displayed.
  final String? helperText;

  /// Widgets displayed after the title in the title row.
  ///
  /// Commonly used for required field indicators (*) or info icons.
  /// Only displayed when [title] is not null.
  final List<Widget> trailingTitleWidgets;

  /// Widgets displayed after the helper text in the helper row.
  ///
  /// Can be used for additional actions or information icons.
  /// Only displayed when [helperText] is not null.
  final List<Widget> trailingHelperWidgets;

  /// Widgets displayed at the start (left in LTR) of the entire field.
  ///
  /// Useful for icons, labels, or other leading content.
  final List<Widget> startWidgets;

  /// Widgets displayed at the end (right in LTR) of the entire field.
  ///
  /// Useful for action buttons, status indicators, or trailing content.
  final List<Widget> endWidgets;

  /// Spacing between field elements (title, field, helper, error).
  ///
  /// This controls the vertical spacing between different sections.
  final double spacing;

  /// Gap between field sections (deprecated - use spacing instead).
  ///
  /// This property is kept for backward compatibility.
  final double gap;

  /// Cross axis alignment for the start and end widgets.
  ///
  /// Controls how the start/end widgets align with the main content area.
  /// Defaults to [CrossAxisAlignment.center].
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

/// Layout widget that arranges start widgets, main content, and end widgets.
///
/// This widget provides a flexible layout system for form fields with
/// optional leading and trailing widgets, and a main content area.
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
        // Start widgets with spacing
        if (startWidgets.isNotEmpty) ..._buildWidgetList(startWidgets, true),

        // Main content area
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),

        // End widgets with spacing
        if (endWidgets.isNotEmpty) ..._buildWidgetList(endWidgets, false),
      ],
    );
  }

  /// Builds a list of widgets with proper spacing.
  ///
  /// This ensures consistent spacing between multiple start or end widgets.
  List<Widget> _buildWidgetList(final List<Widget> widgets, final bool isStart) {
    if (widgets.isEmpty) return [];

    final spacedWidgets = <Widget>[];

    // Add spacing before start widgets or after end widgets
    if (isStart && widgets.isNotEmpty) {
      spacedWidgets
        ..addAll(widgets)
        ..add(const SizedBox(width: 8.0)); // Space after start widgets
    } else if (!isStart && widgets.isNotEmpty) {
      spacedWidgets
        ..add(const SizedBox(width: 8.0))
        ..addAll(widgets); // Space before end widgets
    }

    return spacedWidgets;
  }
}

/// Widget that displays the title section with optional trailing widgets.
///
/// This widget handles the layout of the title text and any trailing widgets
/// like required field indicators or info icons.
class _BeFormTitleSection extends StatelessWidget {
  const _BeFormTitleSection({this.title, this.trailingWidgets = const <Widget>[]});

  final String? title;
  final List<Widget> trailingWidgets;

  @override
  Widget build(final BuildContext context) {
    if (title == null && trailingWidgets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        if (title != null)
          Expanded(
            child: Text(
              title!,
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (trailingWidgets.isNotEmpty) ..._buildTrailingWidgets(),
      ],
    );
  }

  /// Builds trailing widgets with proper spacing.
  List<Widget> _buildTrailingWidgets() {
    if (trailingWidgets.isEmpty) return [];

    final spacedWidgets = <Widget>[];
    for (int i = 0; i < trailingWidgets.length; i++) {
      if (i > 0) spacedWidgets.add(const SizedBox(width: 4.0));
      spacedWidgets.add(trailingWidgets[i]);
    }
    return spacedWidgets;
  }
}

/// Widget that displays the helper section with optional trailing widgets.
///
/// This widget handles the layout of helper text and any trailing widgets
/// like additional information or action buttons.
class _BeFormHelperSection extends StatelessWidget {
  const _BeFormHelperSection({this.helperText, this.trailingWidgets = const <Widget>[]});

  final String? helperText;
  final List<Widget> trailingWidgets;

  @override
  Widget build(final BuildContext context) {
    if (helperText == null && trailingWidgets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (helperText != null)
          Expanded(
            child: Text(
              helperText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (trailingWidgets.isNotEmpty) ..._buildTrailingWidgets(),
      ],
    );
  }

  /// Builds trailing widgets with proper spacing.
  List<Widget> _buildTrailingWidgets() {
    if (trailingWidgets.isEmpty) return [];

    final spacedWidgets = <Widget>[];
    for (int i = 0; i < trailingWidgets.length; i++) {
      if (i > 0) spacedWidgets.add(const SizedBox(width: 4.0));
      spacedWidgets.add(trailingWidgets[i]);
    }
    return spacedWidgets;
  }
}

/// Widget that displays error text with proper styling and accessibility.
///
/// This widget provides consistent error message display with theme-aware
/// styling and proper accessibility support.
class _BeFormErrorText extends StatelessWidget {
  const _BeFormErrorText({required this.errorText});

  final String errorText;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final errorStyle = theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error, fontSize: 12.0);

    return Semantics(
      liveRegion: true,
      child: Text(errorText, style: errorStyle, maxLines: 3, overflow: TextOverflow.ellipsis),
    );
  }
}
