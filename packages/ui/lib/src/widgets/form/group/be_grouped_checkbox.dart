import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:beui/src/widgets/form/be_form_builder_field_option.dart';
import 'package:flutter/material.dart';

class BeGroupedCheckbox<T> extends StatelessWidget {
  /// Creates a grouped checkbox widget.
  const BeGroupedCheckbox({
    super.key,
    required this.options,
    required this.onChanged,
    this.value,
    this.disabled,
    this.orientation = BeOptionsOrientation.wrap,
    this.visualDensity,
    this.tristate = false,
    this.materialTapTargetSize,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = BeControlAffinity.leading,
  });

  /// A list of options that describes each checkbox. Each item must be distinct.
  final List<BeFormBuilderFieldOption<T>> options;

  /// A list which specifies automatically checked checkboxes.
  /// Every element must match an item from options.
  final List<T>? value;

  /// Specifies which checkbox option values should be disabled.
  /// If this is null, then no checkbox options will be disabled.
  final List<T>? disabled;

  /// Specifies the orientation of the elements in options.
  final BeOptionsOrientation orientation;

  /// Called when the value of the checkbox group changes.
  final ValueChanged<List<T>> onChanged;

  final VisualDensity? visualDensity;

  /// If true the checkbox's value can be true, false, or null.
  final bool tristate;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  //.......................WRAP ORIENTATION.....................................

  /// The direction to use as the main axis.
  final Axis wrapDirection;

  /// How the children within a run should be placed in the main axis.
  final WrapAlignment wrapAlignment;

  /// How much space to place between children in a run in the main axis.
  final double wrapSpacing;

  /// How the runs themselves should be placed in the cross axis.
  final WrapAlignment wrapRunAlignment;

  /// How much space to place between the runs themselves in the cross axis.
  final double wrapRunSpacing;

  /// How the children within a run should be aligned relative to each other in
  /// the cross axis.
  final WrapCrossAlignment wrapCrossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  final TextDirection? wrapTextDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  final VerticalDirection wrapVerticalDirection;

  /// An optional widget to display between checkboxes.
  final Widget? separator;

  /// Where to place the control relative to the text.
  final BeControlAffinity controlAffinity;

  @override
  Widget build(final BuildContext context) {
    final List<Widget> checkboxes = [];

    for (int i = 0; i < options.length; i++) {
      final option = options[i];
      final isDisabled = disabled?.contains(option.value) ?? false;
      final isSelected = value?.contains(option.value) ?? false;

      final checkbox = CheckboxListTile(
        title: option,
        value: tristate ? (isSelected ? true : null) : isSelected,
        onChanged:
            isDisabled
                ? null
                : (final bool? checked) {
                  final currentValue = List<T>.from(value ?? <T>[]);
                  if (checked == true) {
                    if (!currentValue.contains(option.value)) {
                      currentValue.add(option.value);
                    }
                  } else {
                    currentValue.remove(option.value);
                  }
                  onChanged(currentValue);
                },
        tristate: tristate,
        controlAffinity:
            controlAffinity == BeControlAffinity.leading
                ? ListTileControlAffinity.leading
                : ListTileControlAffinity.trailing,
        visualDensity: visualDensity,
        materialTapTargetSize: materialTapTargetSize,
      );

      checkboxes.add(checkbox);

      if (separator != null && i < options.length - 1) {
        checkboxes.add(separator!);
      }
    }

    switch (orientation) {
      case BeOptionsOrientation.horizontal:
        return Row(children: checkboxes);
      case BeOptionsOrientation.vertical:
        return Column(children: checkboxes);
      case BeOptionsOrientation.wrap:
        return Wrap(
          direction: wrapDirection,
          alignment: wrapAlignment,
          spacing: wrapSpacing,
          runAlignment: wrapRunAlignment,
          runSpacing: wrapRunSpacing,
          crossAxisAlignment: wrapCrossAxisAlignment,
          textDirection: wrapTextDirection,
          verticalDirection: wrapVerticalDirection,
          children: checkboxes,
        );
      default:
        return Wrap(children: checkboxes);
    }
  }
}
