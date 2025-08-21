import 'package:flutter/widgets.dart';

/// An option for fields with selection options.
///
/// The type `T` is the type of the value the entry represents. All the entries
/// in a given menu must represent values with consistent types.
class BeFormBuilderFieldOption<T> extends StatelessWidget {
  /// Creates an option for fields with selection options
  const BeFormBuilderFieldOption({super.key, required this.value, this.child});

  /// The widget to display in list of options.
  final Widget? child;

  /// The value of the option.
  final T value;

  @override
  Widget build(final BuildContext context) {
    return child ?? Text(value.toString());
  }
}
