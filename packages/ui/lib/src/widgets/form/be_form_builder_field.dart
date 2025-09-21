import 'package:beui/src/widgets/form/be_form_builder.dart';
import 'package:flutter/widgets.dart';

enum BeOptionsOrientation { horizontal, vertical, wrap, auto }

enum BeControlAffinity { leading, trailing }

typedef BeValueTransformer<T> = dynamic Function(T value);

/// A single form field.
///
/// This widget maintains the current state of the form field, so that updates
/// and validation errors are visually reflected in the UI.
class BeFormBuilderField<T> extends FormField<T> {
  /// Creates a single form field.
  const BeFormBuilderField({
    super.key,
    super.onSaved,
    super.initialValue,
    super.autovalidateMode,
    super.enabled = true,
    super.validator,
    super.restorationId,
    required super.builder,
    super.errorBuilder,
    required this.name,
    this.valueTransformer,
    this.onChanged,
    this.onFormReset,
    this.focusNode,
  });

  /// Used to reference the field within the form, or to reference form data
  /// after the form is submitted.
  final String name;

  /// Called just before field value is saved. Used to massage data just before
  /// committing the value.
  ///
  /// This sample shows how to convert age in a [BeFormBuilderTextField] to number
  /// so that the final value is numeric instead of a String
  ///
  /// ```dart
  ///   BeFormBuilderTextField(
  ///     name: 'age',
  ///     valueTransformer: (text) => num.tryParse(text),
  ///     validator: BeFormBuilderValidators.numeric(context),
  ///     initialValue: '18',
  ///     keyboardType: TextInputType.number,
  ///  ),
  /// ```
  final BeValueTransformer<T?>? valueTransformer;

  /// Called when the field value is changed.
  final ValueChanged<T?>? onChanged;

  /// Called when the field value is reset.
  final VoidCallback? onFormReset;

  @override
  VoidCallback? get onReset => onFormReset;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  @override
  BeFormBuilderFieldState<BeFormBuilderField<T>, T> createState() =>
      BeFormBuilderFieldState<BeFormBuilderField<T>, T>();
}

class BeFormBuilderFieldState<F extends BeFormBuilderField<T>, T> extends FormFieldState<T> {
  String? _customErrorText;
  BeFormBuilderState? _formBuilderState;
  bool _touched = false;
  bool _dirty = false;

  /// The focus node that is used to focus this field.
  late FocusNode effectiveFocusNode;

  /// The focus attachment for the [effectiveFocusNode].
  FocusAttachment? focusAttachment;

  @override
  F get widget => super.widget as F;

  /// Returns the parent [BeFormBuilderState] if it exists.
  BeFormBuilderState? get formState => _formBuilderState;

  /// Returns the initial value, which may be declared at the field, or by the
  /// parent [BeFormBuilder.initialValue]. When declared at both levels, the field
  /// initialValue prevails.
  T? get initialValue =>
      widget.initialValue ?? (_formBuilderState?.initialValue ?? const <String, dynamic>{})[widget.name] as T?;

  dynamic get transformedValue => widget.valueTransformer == null ? value : widget.valueTransformer!(value);

  @override
  /// Returns the current error text,
  /// which may be a validation error or a custom error text.
  String? get errorText => super.errorText ?? _customErrorText;

  @override
  /// Returns `true` if the field has an error or has a custom error text.
  bool get hasError => super.hasError || errorText != null;

  @override
  /// Returns `true` if the field is valid and has no custom error text.
  bool get isValid => super.isValid && _customErrorText == null;

  /// Returns `true` if the field is valid.
  bool get valueIsValid => super.isValid;

  /// Returns `true` if the field has an error.
  bool get valueHasError => super.hasError;

  /// Returns `true` if the field is enabled and the parent BeFormBuilder is enabled.
  bool get enabled => widget.enabled && (_formBuilderState?.enabled ?? true);

  /// Returns `true` if the field is read only.
  ///
  /// See [BeFormBuilder.skipDisabled] for more information.
  bool get readOnly => !(_formBuilderState?.widget.skipDisabled ?? false);

  /// Will be true if the field is dirty
  ///
  /// The value of field is changed by user or by logic code.
  bool get isDirty => _dirty;

  /// Will be true if the field is touched
  ///
  /// The field is focused by user or by logic code
  bool get isTouched => _touched;

  void registerTransformer(final Map<String, Function> map) {
    final fun = widget.valueTransformer;
    if (fun != null) {
      map[widget.name] = fun;
    }
  }

  @override
  void initState() {
    super.initState();
    // Register this field when there is a parent BeFormBuilder
    _formBuilderState = BeFormBuilder.of(context);
    // Set the initial value
    _formBuilderState?.registerField(widget.name, this);

    effectiveFocusNode = widget.focusNode ?? FocusNode(debugLabel: widget.name);
    // Register a touch handler
    effectiveFocusNode.addListener(_touchedHandler);
    focusAttachment = effectiveFocusNode.attach(context);

    // Verify if need auto validate form
  }

  @override
  void didUpdateWidget(covariant final BeFormBuilderField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.name != oldWidget.name) {
      _formBuilderState?.unregisterField(oldWidget.name, this);
      _formBuilderState?.registerField(widget.name, this);
    }
    if (widget.focusNode != oldWidget.focusNode) {
      focusAttachment?.detach();
      effectiveFocusNode.removeListener(_touchedHandler);
      effectiveFocusNode = widget.focusNode ?? FocusNode(canRequestFocus: enabled);
      effectiveFocusNode.addListener(_touchedHandler);
      focusAttachment = effectiveFocusNode.attach(context);
    }
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_touchedHandler);
    // Checking if the focusNode is handled by the parent or not
    if (widget.focusNode == null) {
      effectiveFocusNode.dispose();
    }
    _formBuilderState?.unregisterField(widget.name, this);
    super.dispose();
  }

  void _informFormForFieldChange() {
    if (_formBuilderState != null) {
      _dirty = true;
      if (enabled || readOnly) {
        _formBuilderState!.setInternalFieldValue<T>(widget.name, value);
        return;
      }
      _formBuilderState!.removeInternalFieldValue(widget.name);
    }
  }

  void _touchedHandler() {
    if (effectiveFocusNode.hasFocus && _touched == false) {
      setState(() => _touched = true);
    }
  }

  @override
  void setValue(final T? value, {final bool populateForm = true}) {
    super.setValue(value);
    if (populateForm) {
      _informFormForFieldChange();
    }
  }

  @override
  void didChange(final T? value) {
    super.didChange(value);
    _informFormForFieldChange();
    widget.onChanged?.call(value);
  }

  @override
  /// Reset field value to initial value
  ///
  /// Also reset custom error text if exists, and set [isDirty] to `false`.
  void reset() {
    super.reset();
    didChange(initialValue);
    _dirty = false;
    if (_customErrorText != null) {
      setState(() => _customErrorText = null);
    }
    widget.onReset?.call();
  }

  /// Validate field
  ///
  /// Clear custom error if [clearCustomError] is `true`.
  /// By default `true`
  ///
  /// Focus when field is invalid if [focusOnInvalid] is `true`.
  /// By default `true`
  ///
  /// Auto scroll when focus invalid if [autoScrollWhenFocusOnInvalid] is `true`.
  /// By default `false`.
  ///
  /// Note: If a invalid field is from type **TextField** and will focused,
  /// the form will auto scroll to show this invalid field.
  /// In this case, the automatic scroll happens because is a behavior inside the framework,
  /// not because [autoScrollWhenFocusOnInvalid] is `true`.
  @override
  bool validate({
    final bool clearCustomError = true,
    final bool focusOnInvalid = true,
    final bool autoScrollWhenFocusOnInvalid = false,
  }) {
    if (clearCustomError) {
      setState(() => _customErrorText = null);
    }
    final isValid = super.validate() && !hasError;

    final fields =
        _formBuilderState?.fields ?? <String, BeFormBuilderFieldState<BeFormBuilderField<dynamic>, dynamic>>{};

    if (!isValid &&
        focusOnInvalid &&
        (formState?.focusOnInvalid ?? true) &&
        enabled &&
        !fields.values.any((final e) => e.effectiveFocusNode.hasFocus)) {
      focus();
      if (autoScrollWhenFocusOnInvalid) ensureScrollableVisibility();
    }

    return isValid;
  }

  /// Invalidate field with a [errorText]
  ///
  /// Focus field if [shouldFocus] is `true`.
  /// By default `true`
  ///
  /// Auto scroll when focus invalid if [shouldAutoScrollWhenFocus] is `true`.
  /// By default `false`.
  ///
  /// Note: If a invalid field is from type **TextField** and will focused,
  /// the form will auto scroll to show this invalid field.
  /// In this case, the automatic scroll happens because is a behavior inside the framework,
  /// not because [shouldAutoScrollWhenFocus] is `true`.
  void invalidate(
    final String errorText, {
    final bool shouldFocus = true,
    final bool shouldAutoScrollWhenFocus = false,
  }) {
    setState(() => _customErrorText = errorText);

    validate(
      clearCustomError: false,
      autoScrollWhenFocusOnInvalid: shouldAutoScrollWhenFocus,
      focusOnInvalid: shouldFocus,
    );
  }

  /// Focus field
  void focus() {
    FocusScope.of(context).requestFocus(effectiveFocusNode);
  }

  /// Scroll to show field
  void ensureScrollableVisibility() {
    Scrollable.ensureVisible(context);
  }
}
