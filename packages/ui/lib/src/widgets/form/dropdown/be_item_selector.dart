import 'package:becore/hooks.dart';
import 'package:becore/modal.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/from.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class BeItemSelector<T extends KeyValuePair> extends HookWidget {
  const BeItemSelector({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    this.itemToString,
    this.itemBuilder,
    this.trailingTitleWidgets = const [],
    this.trailingHelperWidgets = const [],
    this.startWidgets = const [],
    this.endWidgets = const [],
    this.hint,
    this.label,
    this.validator,
    this.startEndAxisAlignment = CrossAxisAlignment.center,
    this.isExpanded = false,
    this.isDense = true,
    this.iconSize = 20,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.elevation = 4,
    this.contentPadding = const EdgeInsets.only(right: 8),
    this.dropdownColor,
    this.disabledHint,
    this.style,
    this.selectedItemBuilder,
    this.menuMaxHeight,
    this.onSaved,
    this.alignment = Alignment.centerLeft,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
  });

  final T? value;
  final List<T> items;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemBuilder;
  final String? hint;
  final String? label;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final bool isExpanded;
  final bool isDense;
  final List<Widget> trailingTitleWidgets;
  final List<Widget> trailingHelperWidgets;
  final List<Widget> startWidgets;
  final List<Widget> endWidgets;
  final CrossAxisAlignment startEndAxisAlignment;
  final double iconSize;
  final BorderRadius borderRadius;
  final int elevation;
  final EdgeInsetsGeometry contentPadding;
  final Color? dropdownColor;
  final Widget? disabledHint;
  final TextStyle? style;
  final DropdownButtonBuilder? selectedItemBuilder;
  final double? menuMaxHeight;
  final AlignmentGeometry alignment;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldSetter<T>? onSaved;
  @override
  Widget build(final BuildContext context) {
    final isOpen = useState(false);

    Widget defaultItemBuilder(final T item) {
      return BeText(item.display, overflow: TextOverflow.ellipsis);
    }

    return BeFormField<T>(
      // enabled: false,
      initialValue: value,
      shouldValidate: validator != null,
      onChanged: onChanged,
      validator: validator,
      title: label,
      onSaved: onSaved,
      trailingHelperWidgets: trailingHelperWidgets,
      endWidgets: endWidgets,
      startWidgets: startWidgets,
      trailingTitleWidgets: trailingTitleWidgets,
      startEndAxisAlignment: startEndAxisAlignment,

      build: (final field) {
        final state = field as BeFormFieldState<T>;
        return DropdownButtonFormField<T>(
          value: state.value,
          hint: BeText.bodyMedium(hint),
          borderRadius: borderRadius,
          onChanged: state.didChange,
          elevation: elevation,
          dropdownColor: dropdownColor,
          disabledHint: disabledHint,
          style: style,
          selectedItemBuilder: selectedItemBuilder,
          menuMaxHeight: menuMaxHeight,
          alignment: alignment,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          onTap: () {
            isOpen.value = !isOpen.value;
          },
          icon: Icon(isOpen.value ? BeIcons.icon_chevron_up : BeIcons.icon_chevron_down),
          items:
              items.map((final T item) {
                return DropdownMenuItem<T>(value: item, child: (itemBuilder ?? defaultItemBuilder)(item));
              }).toList(),
          decoration: InputDecoration(
            contentPadding: contentPadding,
            // border: InputBorder.none, // Remove default underline
          ),
        );
      },
    );
  }
}
