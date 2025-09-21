import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field form field.
class BeFormBuilderTextField extends BeFormBuilderField<String> {
  /// Creates a text field form field.
  BeFormBuilderTextField({
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
    this.controller,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.onAppPrivateCommand,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.scrollController,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.maxLengthEnforcement,
  }) : super(
         builder: (final FormFieldState<String?> field) {
           final state = field as _BeFormBuilderTextFieldState;

           return TextField(
             controller: state._effectiveController,
             focusNode: state.effectiveFocusNode,
             decoration: (decoration ?? const InputDecoration()).copyWith(errorText: field.errorText),
             keyboardType: keyboardType,
             textInputAction: textInputAction,
             textCapitalization: textCapitalization,
             textDirection: textDirection,
             textAlign: textAlign,
             textAlignVertical: textAlignVertical,
             autofocus: autofocus,
             readOnly: readOnly,
             contextMenuBuilder: contextMenuBuilder,
             showCursor: showCursor,
             obscuringCharacter: obscuringCharacter,
             obscureText: obscureText,
             autocorrect: autocorrect,
             enableSuggestions: enableSuggestions,
             maxLines: maxLines,
             minLines: minLines,
             expands: expands,
             maxLength: maxLength,
             onChanged: state.didChange,
             onEditingComplete: onEditingComplete,
             onSubmitted: onSubmitted,
             inputFormatters: inputFormatters,
             enabled: enabled,
             cursorWidth: cursorWidth,
             cursorHeight: cursorHeight,
             cursorRadius: cursorRadius,
             cursorColor: cursorColor,
             scrollPadding: scrollPadding,
             keyboardAppearance: keyboardAppearance,
             enableInteractiveSelection: enableInteractiveSelection,
             onAppPrivateCommand: onAppPrivateCommand,
             buildCounter: buildCounter,
             scrollController: scrollController,
             scrollPhysics: scrollPhysics,
             autofillHints: autofillHints,
             enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
             mouseCursor: mouseCursor,
           );
         },
       );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final bool expands;
  final bool obscureText;
  final bool readOnly;
  final bool? showCursor;
  final bool enableInteractiveSelection;

  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  final double cursorWidth;
  final double? cursorHeight;

  final InputDecoration? decoration;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Radius? cursorRadius;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  @override
  BeFormBuilderFieldState<BeFormBuilderField<String>, String> createState() => _BeFormBuilderTextFieldState();
}

class _BeFormBuilderTextFieldState extends BeFormBuilderFieldState<BeFormBuilderTextField, String> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: initialValue);
    } else {
      widget.controller!.text = initialValue ?? '';
    }
    _effectiveController.addListener(_handleControllerChanged);
  }

  @override
  void didUpdateWidget(final BeFormBuilderTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _controller = TextEditingController.fromValue(oldWidget.controller!.value);
      }
      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    _effectiveController.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    _effectiveController.text = initialValue ?? '';
  }

  @override
  void didChange(final String? value) {
    super.didChange(value);
    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
