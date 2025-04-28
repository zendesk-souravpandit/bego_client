// import 'package:flutter/material.dart';

// // 1. First define the inherited widget for form state management
// class _BeFormInherited extends InheritedWidget {
//   const _BeFormInherited({required this.formState, required super.child});
//   final _BeFormState formState;

//   static _BeFormState? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<_BeFormInherited>()
//         ?.formState;
//   }

//   @override
//   bool updateShouldNotify(_BeFormInherited oldWidget) {
//     return formState != oldWidget.formState;
//   }
// }

// // 2. Main form widget
// class BeForm extends StatefulWidget {
//   const BeForm({super.key, required this.child, this.onSubmit});
//   final Widget child;
//   final void Function(Map<String, dynamic> values)? onSubmit;

//   @override
//   State<BeForm> createState() => _BeFormState();
// }

// class _BeFormState extends State<BeForm> {
//   final Map<String, dynamic> _fields = {};
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _registerField(String name, dynamic field) {
//     _fields[name] = field;
//   }

//   void _unregisterField(String name) {
//     _fields.remove(name);
//   }

//   bool validate() {
//     return _formKey.currentState?.validate() ?? false;
//   }

//   Map<String, dynamic> getValues() {
//     return Map.from(_fields);
//   }

//   void submit() {
//     if (validate()) {
//       widget.onSubmit?.call(getValues());
//       getValues().entries.forEach((entry) {
//         final field = _fields[entry.key];
//         if (field is _BeFormFieldState) {
//           field.didChange(entry.value.value);

//           debugPrint('Field ${entry.key} value: ${entry.value.value}');
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: _BeFormInherited(formState: this, child: widget.child),
//     );
//   }
// }

// // 3. The form field widget - now properly extending FormField
// class BeFormField<T> extends FormField<T> {
//   BeFormField({
//     super.key,
//     required this.name,
//     required this.builder,
//     super.onSaved,
//     super.validator,
//     super.enabled,
//     super.autovalidateMode,
//     super.restorationId,
//     this.shouldValidate = true,
//     this.title,
//     this.titleStyle,
//     this.helperText,
//     this.helperStyle,
//     this.trailingTitleWidgets = const [],
//     this.trailingHelperWidgets = const [],
//     this.spacing = 4.0,
//     this.errorStyle,
//   }) : super(builder: builder);
//   final String name;
//   final Widget Function(FormFieldState<T>) builder;
//   final bool shouldValidate;
//   final String? title;
//   final TextStyle? titleStyle;
//   final String? helperText;
//   final TextStyle? helperStyle;
//   final List<Widget> trailingTitleWidgets;
//   final List<Widget> trailingHelperWidgets;
//   final double spacing;
//   final TextStyle? errorStyle;

//   @override
//   FormFieldState<T> createState() => _BeFormFieldState<T>();
// }

// // 4. The form field state - now properly extending FormFieldState
// class _BeFormFieldState<T> extends FormFieldState<T> {
//   late _BeFormState? _form;
//   bool _registered = false;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_registered) {
//       _form = _BeFormInherited.of(context);
//       if (_form != null) {
//         _form!._registerField((widget as BeFormField<T>).name, this);
//         _registered = true;
//       }
//     }
//   }

//   @override
//   void dispose() {
//     if (_registered && _form != null) {
//       _form!._unregisterField((widget as BeFormField<T>).name);
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formField = widget as BeFormField<T>;

//     return BeEnabled(
//       enabled: formField.enabled,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (formField.title != null ||
//               formField.trailingTitleWidgets.isNotEmpty)
//             _BeFormHeader(
//               title: formField.title,
//               titleStyle: formField.titleStyle,
//               trailingWidgets: formField.trailingTitleWidgets,
//             ),

//           formField.builder(this),

//           if (formField.helperText != null ||
//               formField.trailingHelperWidgets.isNotEmpty)
//             _BeFormHelper(
//               helperText: formField.helperText,
//               helperStyle: formField.helperStyle,
//               trailingWidgets: formField.trailingHelperWidgets,
//             ),

//           if (formField.shouldValidate && hasError)
//             Padding(
//               padding: EdgeInsets.only(top: formField.spacing),
//               child: Text(
//                 errorText!,
//                 style:
//                     formField.errorStyle ??
//                     TextStyle(
//                       color: Theme.of(context).colorScheme.error,
//                       fontSize: 12,
//                     ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// // 5. Supporting widgets
// class BeEnabled extends StatelessWidget {
//   const BeEnabled({super.key, this.enabled = true, required this.child});
//   final bool enabled;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: enabled ? 1.0 : 0.5,
//       child: IgnorePointer(ignoring: !enabled, child: child),
//     );
//   }
// }

// class _BeFormHeader extends StatelessWidget {
//   const _BeFormHeader({
//     this.title,
//     this.titleStyle,
//     this.trailingWidgets = const [],
//   });
//   final String? title;
//   final TextStyle? titleStyle;
//   final List<Widget> trailingWidgets;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (title != null)
//           Expanded(
//             child: Text(
//               title!,
//               style:
//                   titleStyle ??
//                   const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//             ),
//           ),
//         ...trailingWidgets,
//       ],
//     );
//   }
// }

// class _BeFormHelper extends StatelessWidget {
//   const _BeFormHelper({
//     this.helperText,
//     this.helperStyle,
//     this.trailingWidgets = const [],
//   });
//   final String? helperText;
//   final TextStyle? helperStyle;
//   final List<Widget> trailingWidgets;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (helperText != null)
//           Expanded(
//             child: Text(
//               helperText!,
//               style:
//                   helperStyle ??
//                   const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//             ),
//           ),
//         ...trailingWidgets,
//       ],
//     );
//   }
// }

// // ==================== USAGE EXAMPLE ====================
// class FormExample extends StatelessWidget {
//   final _formKey = GlobalKey<_BeFormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BeForm(
//         key: _formKey,
//         onSubmit: print,
//         child: Column(
//           children: [
//             BeFormField<String>(
//               name: 'username',
//               title: 'Username',
//               builder: (field) => TextFormField(onChanged: field.didChange),
//             ),
//             BeFormField<String>(
//               name: 'email',
//               title: 'Email',
//               builder: (field) => TextFormField(onChanged: field.didChange),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final values = _formKey.currentState?.submit();
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
