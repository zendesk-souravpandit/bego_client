import 'package:beui/src/widgets/form/be_form_builder_field_option.dart';
import 'package:flutter/widgets.dart';

/// An option for filter chips.
///
/// The type `T` is the type of the value the entry represents. All the entries
/// in a given menu must represent values with consistent types.
class BeFormBuilderChipOption<T> extends BeFormBuilderFieldOption<T> {
  /// Creates an option for fields with selection options
  const BeFormBuilderChipOption({super.key, required super.value, this.avatar, super.child});

  /// The avatar to display in list of options.
  final Widget? avatar;

  @override
  Widget build(final BuildContext context) {
    return child ?? Text(value.toString());
  }
}
