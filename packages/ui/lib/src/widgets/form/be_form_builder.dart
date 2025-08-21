// ignore_for_file: strict_raw_type

import 'package:beui/src/widgets/form/be_form_builder_field.dart';
import 'package:beui/src/widgets/form/extensions/auto_validate_extension.dart';
import 'package:flutter/widgets.dart';

/// A container for form fields.
class BeFormBuilder extends StatefulWidget {
  /// Creates a container for form fields.
  ///
  /// The [child] argument must not be null.
  const BeFormBuilder({
    super.key,
    required this.child,
    this.onChanged,
    this.autovalidateMode,
    this.onPopInvokedWithResult,
    this.initialValue = const <String, dynamic>{},
    this.skipDisabled = false,
    this.enabled = true,
    this.clearValueOnUnregister = false,
    this.canPop,
  });

  /// Called when one of the form fields changes.
  ///
  /// In addition to this callback being invoked, all the form fields themselves
  /// will rebuild.
  final VoidCallback? onChanged;

  /// {@macro flutter.widgets.navigator.onPopInvokedWithResult}
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;

  /// {@macro flutter.widgets.PopScope.canPop}
  final bool? canPop;

  /// The widget below this widget in the tree.
  ///
  /// This is the root of the widget hierarchy that contains this form.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Used to enable/disable form fields auto validation and update their error
  /// text.
  ///
  /// {@macro flutter.widgets.form.autovalidateMode}
  final AutovalidateMode? autovalidateMode;

  /// An optional Map of field initialValues. Keys correspond to the field's
  /// name and value to the initialValue of the field.
  ///
  /// The initialValues set here will be ignored if the field has a local
  /// initialValue set.
  final Map<String, dynamic> initialValue;

  /// Whether the form should ignore submitting values from fields where
  /// `enabled` is `false`.
  ///
  /// This behavior is common in HTML forms where _readonly_ values are not
  /// submitted when the form is submitted.
  ///
  /// `true` = Disabled / `false` = Read only
  ///
  /// When `true`, the final form value will not contain disabled fields.
  /// Default is `false`.
  final bool skipDisabled;

  /// Whether the form is able to receive user input.
  ///
  /// Defaults to true.
  ///
  /// When `false` all the form fields will be disabled - won't accept input -
  /// and their enabled state will be ignored.
  final bool enabled;

  /// Whether to clear the internal value of a field when it is unregistered.
  ///
  /// Defaults to `false`.
  ///
  /// When set to `true`, the form builder will not keep the internal values
  /// from disposed [BeFormBuilderField]s. This is useful for dynamic forms where
  /// fields are registered and unregistered due to state change.
  ///
  /// This setting will have no effect when registering a field with the same
  /// name as the unregistered one.
  final bool clearValueOnUnregister;

  static BeFormBuilderState? of(final BuildContext context) => context.findAncestorStateOfType<BeFormBuilderState>();

  @override
  BeFormBuilderState createState() => BeFormBuilderState();
}

/// A type alias for a map of form fields.
typedef BeFormBuilderFields = Map<String, BeFormBuilderFieldState<BeFormBuilderField<dynamic>, dynamic>>;

class BeFormBuilderState extends State<BeFormBuilder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BeFormBuilderFields _fields = {};
  final Map<String, dynamic> _instantValue = {};
  final Map<String, dynamic> _savedValue = {};
  // Because dart type system will not accept ValueTransformer<dynamic>
  final Map<String, Function> _transformers = {};
  bool _focusOnInvalid = true;

  /// Will be true if will focus on invalid field when validate
  ///
  /// Only used to internal logic
  bool get focusOnInvalid => _focusOnInvalid;

  /// Get if form is enabled
  bool get enabled => widget.enabled;

  /// Verify if all fields on form are valid.
  bool get isValid => fields.values.every((final field) => field.isValid);

  /// Will be true if some field on form are dirty.
  ///
  /// Dirty: The value of field is changed by user or by logic code.
  bool get isDirty => fields.values.any((final field) => field.isDirty);

  /// Will be true if some field on form are touched.
  ///
  /// Touched: The field is focused by user or by logic code.
  bool get isTouched => fields.values.any((final field) => field.isTouched);

  /// Get a map of errors
  Map<String, String> get errors => {
    for (final element in fields.entries.where((final element) => element.value.hasError))
      element.key.toString(): element.value.errorText ?? '',
  };

  /// Get initialValue.
  Map<String, dynamic> get initialValue => widget.initialValue;

  /// Get all fields of form.
  BeFormBuilderFields get fields => _fields;

  /// Get all fields values of form.
  Map<String, dynamic> get instantValue => Map<String, dynamic>.unmodifiable(
    _instantValue.map(
      (final key, final value) => MapEntry(key, _transformers[key] == null ? value : _transformers[key]!(value)),
    ),
  );

  /// Returns the saved value only
  Map<String, dynamic> get value => Map<String, dynamic>.unmodifiable(
    _savedValue.map(
      (final key, final value) => MapEntry(key, _transformers[key] == null ? value : _transformers[key]!(value)),
    ),
  );

  dynamic transformValue<T>(final String name, final T? v) {
    final t = _transformers[name];
    return t != null ? t.call(v) : v;
  }

  dynamic getTransformedValue<T>(final String name, {final bool fromSaved = false}) {
    return transformValue<T>(name, getRawValue(name));
  }

  T? getRawValue<T>(final String name, {final bool fromSaved = false}) {
    // ignore: avoid_dynamic_calls, implicit_dynamic_map_literal
    final dynamic value = (fromSaved ? _savedValue[name] : _instantValue[name]) ?? initialValue[name];
    return value is T ? value : null;
  }

  /// Get a field value by name
  void setInternalFieldValue<T>(final String name, final T? value) {
    _instantValue[name] = value;
    widget.onChanged?.call();
  }

  /// Remove a field value by name
  void removeInternalFieldValue(final String name) {
    _instantValue.remove(name);
  }

  /// Register a field on form
  void registerField(final String name, final BeFormBuilderFieldState field) {
    // Each field must have a unique name.  Ideally we could simply:
    //   assert(!_fields.containsKey(name));
    // However, Flutter will delay dispose of deactivated fields, so if a
    // field is being replaced, the new instance is registered before the old
    // one is unregistered.  To accommodate that use case, but also provide
    // assistance to accidental duplicate names, we check and emit a warning.
    final oldField = _fields[name];
    assert(() {
      if (oldField != null) {
        debugPrint(
          'Warning! Replacing duplicate Field for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
      }
      return true;
    }());

    _fields[name] = field;
    field.registerTransformer(_transformers);

    if (widget.clearValueOnUnregister || (_instantValue[name] == null)) {
      _instantValue[name] = field.initialValue ?? initialValue[name];
    }

    field.setValue(_instantValue[name], populateForm: false);
  }

  /// Unregister a field on form
  void unregisterField(final String name, final BeFormBuilderFieldState field) {
    assert(
      _fields.containsKey(name),
      'Failed to unregister a field. Make sure that all field names in a form are unique.',
    );

    // Only remove the field when it is the one registered.  It's possible that
    // the field is replaced (registerField is called twice for a given name)
    // before unregisterField is called for the name, so just emit a warning
    // since it may be intentional.
    if (field == _fields[name]) {
      _fields.remove(name);
      _transformers.remove(name);
      if (widget.clearValueOnUnregister) {
        _instantValue.remove(name);
        _savedValue.remove(name);
      }
    } else {
      assert(() {
        // This is OK to ignore when you are intentionally replacing a field
        // with another field using the same name.
        debugPrint(
          'Warning! Ignoring Field un-registration for $name'
          ' -- this is OK to ignore as long as the field was intentionally replaced',
        );
        return true;
      }());
    }
  }

  /// Save form values
  void save() {
    _formKey.currentState!.save();
    // Copy values from instant to saved
    _savedValue
      ..clear()
      ..addAll(_instantValue);
  }

  /// Validate all fields of form
  ///
  /// Focus to first invalid field when has field invalid, if [focusOnInvalid] is `true`.
  /// By default `true`
  ///
  /// Auto scroll to first invalid field focused if [autoScrollWhenFocusOnInvalid] is `true`.
  /// By default `false`.
  ///
  /// Note: If a invalid field is from type **TextField** and will focused,
  /// the form will auto scroll to show this invalid field.
  /// In this case, the automatic scroll happens because is a behavior inside the framework,
  /// not because [autoScrollWhenFocusOnInvalid] is `true`.
  bool validate({final bool focusOnInvalid = true, final bool autoScrollWhenFocusOnInvalid = false}) {
    _focusOnInvalid = focusOnInvalid;
    final hasError = !_formKey.currentState!.validate();
    if (hasError) {
      final wrongFields = fields.values.where((final element) => element.hasError).toList();
      if (wrongFields.isNotEmpty) {
        if (focusOnInvalid) {
          wrongFields.first.focus();
        }
        if (autoScrollWhenFocusOnInvalid) {
          wrongFields.first.ensureScrollableVisibility();
        }
      }
    }
    return !hasError;
  }

  /// Save form values and validate all fields of form
  ///
  /// Focus to first invalid field when has field invalid, if [focusOnInvalid] is `true`.
  /// By default `true`
  ///
  /// Auto scroll to first invalid field focused if [autoScrollWhenFocusOnInvalid] is `true`.
  /// By default `false`.
  ///
  /// Note: If a invalid field is from type **TextField** and will focused,
  /// the form will auto scroll to show this invalid field.
  /// In this case, the automatic scroll happens because is a behavior inside the framework,
  /// not because [autoScrollWhenFocusOnInvalid] is `true`.
  bool saveAndValidate({final bool focusOnInvalid = true, final bool autoScrollWhenFocusOnInvalid = false}) {
    save();
    return validate(focusOnInvalid: focusOnInvalid, autoScrollWhenFocusOnInvalid: autoScrollWhenFocusOnInvalid);
  }

  /// Reset form to `initialValue` set on BeFormBuilder or on each field.
  void reset() {
    _formKey.currentState?.reset();
  }

  /// Update fields values of form.
  /// Useful when need update all values at once, after init.
  ///
  /// To load all values at once on init, use `initialValue` property
  void patchValue(final Map<String, dynamic> val) {
    val.forEach((final key, final dynamic value) {
      _fields[key]?.didChange(value);
    });
  }

  @override
  void initState() {
    // Verify if need auto validate form
    if (enabled && (widget.autovalidateMode?.isAlways ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // No focus on invalid, like default behavior on Flutter base Form
        validate(focusOnInvalid: false);
      });
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidateMode,
      onPopInvokedWithResult: widget.onPopInvokedWithResult,
      canPop: widget.canPop,
      // `onChanged` is called during setInternalFieldValue else will be called early
      child: _BeFormBuilderScope(formState: this, child: FocusTraversalGroup(child: widget.child)),
    );
  }
}

class _BeFormBuilderScope extends InheritedWidget {
  const _BeFormBuilderScope({required super.child, required final BeFormBuilderState formState})
    : _formState = formState;

  final BeFormBuilderState _formState;

  /// The [BeFormBuilder] associated with this widget.
  BeFormBuilder get form => _formState.widget;

  @override
  bool updateShouldNotify(final _BeFormBuilderScope oldWidget) => oldWidget._formState != _formState;
}
