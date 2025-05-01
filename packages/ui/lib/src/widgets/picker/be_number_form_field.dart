import 'package:beui/be_icons.dart';
import 'package:beui/src/decoration/bego_edge_insets.dart';
import 'package:beui/src/widgets/picker/_number_button.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeNumberFormField extends FormField<int> {
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue].
  BeNumberFormField({
    super.key,
    int? initialValue,
    int min = 0,
    int max = 100,
    super.onSaved,
    ValueChanged<int?>? onChanged,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.always,
    String? validationError,
    super.enabled,
    FocusNode? focusNode,
    TextEditingController? controller,
    BoxConstraints? constraints,
  }) : assert(
         initialValue == null || controller == null,
         'initialValue or controller must be null',
       ),
       assert(
         initialValue == null || initialValue >= min && initialValue <= max,
         'initial value should be null or in [min, max] range',
       ),
       super(
         initialValue: initialValue ?? int.tryParse(controller?.text ?? ''),
         validator:
             (value) =>
                 value != null && (value >= min && value <= max)
                     ? null
                     : validationError,
         builder: (FormFieldState<int> field) {
           void handleChanged(int? value) {
             field.didChange(value);
             onChanged?.call(value);
           }

           return _BeNumberPicker(
             initialValue: initialValue,
             min: min,
             max: max,
             onChanged: handleChanged,
             enabled: enabled,
             error: field.errorText,
             focusNode: focusNode,
             controller: controller,
             constraints: constraints,
           );
         },
       );
}

class _BeNumberPicker extends StatefulWidget {
  const _BeNumberPicker({
    required this.onChanged,
    this.initialValue,
    this.min = 0,
    this.max = 100,
    this.focusNode,
    this.enabled = true,
    this.error,
    this.controller,
    this.constraints,
  });

  final int? initialValue;
  final ValueChanged<int?> onChanged;
  final int min;
  final int max;
  final FocusNode? focusNode;
  final bool enabled;
  final String? error;
  final TextEditingController? controller;
  final BoxConstraints? constraints;

  @override
  _BeNumberPickerState createState() => _BeNumberPickerState();
}

class _BeNumberPickerState extends State<_BeNumberPicker> {
  int? _value;

  TextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ??
      (_controller ??= TextEditingController(
        text: widget.initialValue?.toString() ?? '',
      ));

  FocusNode? _focusNode;

  void _controllerListener() => _onChanged(_effectiveController.text);

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? int.tryParse(widget.controller?.text ?? '');
    _effectiveController.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    _effectiveController.removeListener(_controllerListener);
    _controller?.dispose();
    super.dispose();
  }

  void _onMinusTap() {
    final value = _value;
    final int newValue;
    if (value != null) {
      newValue =
          value < widget.min + 1
              ? widget.min
              : value > widget.max
              ? widget.max
              : value - 1;
    } else {
      newValue = widget.min;
    }
    _updateController(newValue);
  }

  void _onPlusTap() {
    final value = _value;
    final int newValue;
    if (value != null) {
      newValue =
          value < widget.min
              ? widget.min
              : value > widget.max - 1
              ? widget.max
              : value + 1;
    } else {
      newValue = widget.min;
    }
    _updateController(newValue);
  }

  void _onChanged(String v) {
    final value = int.tryParse(v);
    if (value != null && value >= widget.min && value <= widget.max) {
      widget.onChanged(value);
    } else {
      widget.onChanged(null);
    }
    _value = value;
  }

  void _updateController(int? value) {
    final newValue = value?.toString() ?? '';
    _effectiveController
      ..text = newValue
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: newValue.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    final value = _value;

    return TextFormField(
      scrollPadding: p0,
      textAlign: TextAlign.center,
      cursorWidth: 0,
      autocorrect: false,
      showCursor: false,
      keyboardType: TextInputType.number,
      controller: _effectiveController,
      focusNode: AlwaysDisabledFocusNode(),
      cursorHeight: 0,

      inputFormatters: [
        FilteringTextInputFormatter.allow(_integersOrEmptyString),
      ],
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: BeColors.white,
      ),

      textAlignVertical: const TextAlignVertical(y: 0),
      decoration: InputDecoration(
        contentPadding: px8 + py8,

        isDense: true,
        isCollapsed: true,

        constraints: const BoxConstraints(maxWidth: 84),
        suffixIconConstraints: const BoxConstraints(minWidth: 14 + 12),
        prefixIconConstraints: const BoxConstraints(minWidth: 14 + 12),
        fillColor: BeColors.primary,

        prefixIcon: NumberPickerButton(
          iconData: BeIcons.icon_math_minus,

          onPressed: value == null || value > widget.min ? _onMinusTap : null,
        ),
        suffixIcon: NumberPickerButton(
          iconData: BeIcons.icon_math_plus,
          onPressed: value == null || value < widget.max ? _onPlusTap : null,
        ),
      ),
    );
  }
}

final _integersOrEmptyString = RegExp(r'^$|^[-]?\d+|^[-]');

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
