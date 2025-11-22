import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:beui/src/widgets/form/extensions/generic_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A dropdown form field.
class BeFormBuilderDropdown<T> extends BeFormBuilderField<T> {
  /// Creates a dropdown form field.
  BeFormBuilderDropdown({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onFormReset,
    super.focusNode,
    super.restorationId,
    required this.items,
    this.selectedItemBuilder,
    this.hint,
    this.disabledHint,
    this.onTap,
    this.elevation = 8,
    this.isDense = true,
    this.isExpanded = true,
    this.itemHeight,
    this.dropdownColor,
    this.decoration,
    this.inputDecoration = const InputDecoration(),
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.allowClear = false,
    this.clearIcon = const Icon(Icons.close),
    this.borderRadius,
    this.autofocus = false,
    this.focusColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.itemsListBuilder,
  }) : super(
         builder: (final FormFieldState<T?> field) {
           final state = field as _BeFormBuilderDropdownState<T>;

           // Check if current value exists in items
           final hasValue = items?.map((final e) => e.value).contains(field.value) ?? false;

           return InputDecorator(
             decoration: (inputDecoration ?? const InputDecoration()).copyWith(
               errorText: field.errorText,
               enabled: enabled,
             ),
             isEmpty: !hasValue,
             child: DropdownButtonHideUnderline(
               child: DropdownButton<T>(
                 value: hasValue ? field.value : null,
                 items: items,
                 selectedItemBuilder: selectedItemBuilder,
                 hint: hint,
                 disabledHint: hasValue && items != null
                     ? items.firstWhere((final dropDownItem) => dropDownItem.value == field.value).child
                     : disabledHint,
                 onChanged: enabled
                     ? (final value) {
                         field.didChange(value);
                         onTap?.call();
                       }
                     : null,
                 elevation: elevation,
                 isDense: isDense,
                 isExpanded: isExpanded,
                 itemHeight: itemHeight,
                 focusNode: state.effectiveFocusNode,
                 autofocus: autofocus,
                 dropdownColor: dropdownColor,
                 icon: allowClear && field.value != null
                     ? GestureDetector(
                         onTap: enabled
                             ? () {
                                 field.didChange(null);
                               }
                             : null,
                         child: clearIcon,
                       )
                     : icon,
                 iconDisabledColor: iconDisabledColor,
                 iconEnabledColor: iconEnabledColor,
                 iconSize: iconSize,
                 borderRadius: borderRadius,
                 focusColor: focusColor,
                 menuMaxHeight: menuMaxHeight,
                 enableFeedback: enableFeedback,
                 alignment: alignment,
               ),
             ),
           );
         },
       );
  final List<DropdownMenuItem<T>>? items;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Widget? hint;
  final Widget? disabledHint;
  final VoidCallback? onTap;
  final int elevation;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? dropdownColor;
  final Decoration? decoration;
  final InputDecoration? inputDecoration;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool allowClear;
  final Widget clearIcon;
  final BorderRadius? borderRadius;
  final bool autofocus;
  final Color? focusColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final Widget Function(BuildContext)? itemsListBuilder;

  @override
  BeFormBuilderFieldState<BeFormBuilderField<T>, T> createState() => _BeFormBuilderDropdownState<T>();
}

class _BeFormBuilderDropdownState<T> extends BeFormBuilderFieldState<BeFormBuilderDropdown<T>, T> {
  @override
  void didUpdateWidget(covariant final BeFormBuilderDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldValues = oldWidget.items?.map((final e) => e.value).toList() ?? [];
    final currentlyValues = widget.items?.map((final e) => e.value).toList() ?? [];
    final oldChilds = oldWidget.items?.map((final e) => e.child.toString()).toList() ?? [];
    final currentlyChilds = widget.items?.map((final e) => e.child.toString()).toList() ?? [];

    // Check if initial value is valid
    if (!currentlyValues.contains(initialValue) && !initialValue.emptyValidator()) {
      assert(
        currentlyValues.contains(initialValue) || initialValue.emptyValidator(),
        'The initialValue [$initialValue] is not in the list of items or is not null or empty. '
        'Please provide one of the items as the initialValue or update your initial value. '
        'By default, will apply [null] to field value',
      );
      setValue(null);
    }

    // Update value if items changed and initial value is valid
    if ((!listEquals(oldChilds, currentlyChilds) || !listEquals(oldValues, currentlyValues)) &&
        (currentlyValues.contains(initialValue) || initialValue.emptyValidator())) {
      setValue(initialValue);
    }
  }
}
