import 'package:becore/hooks.dart';
import 'package:becore/modal.dart';
import 'package:beui/from.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class DropdownExample extends HookWidget {
  DropdownExample({super.key});

  final items = [
    User(key: 1, value: 'Item 1'),
    User(key: 2, value: 'Item 2'),
    User(key: 3, value: 'Item 3'),
    User(key: 4, value: 'Item 4'),
  ];

  @override
  Widget build(final BuildContext context) {
    final selectedFruit = useState<User?>(null);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Generic Dropdown Example')),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Example 1: Using enum with custom display strings
              BeItemSelector<User>(
                id: 'user_selector',
                value: selectedFruit.value,
                items: items,
                itemToString: (final user) => user.display,
                hint: 'Select a Item',
                label: 'Fruits',
                startEndAxisAlignment: CrossAxisAlignment.center,
                onSaved: (final newValue) {
                  print('Save Dropdown value');
                },
                validator: (final value) => 'Error Form',
                onChanged: (final value) {
                  // selectedFruit.value = value;
                  // print(selectedFruit.value?.display.toString());
                  print(value?.display.toString());
                },
              ),
              BeFormField<String>(
                id: 'email',
                title: 'Email Address',
                helperText: 'We\'ll never share your email',
                valueTransformer: (final value) => value?.toLowerCase(),
                validator: (final value) => value?.isEmpty ?? true ? 'Required' : null,
                onChanged: (final value) => print('Email: $value'),
                fieldBuilder:
                    (final field) => TextFormField(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      onChanged: field.didChange,
                      initialValue: field.value,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.validate();
                    },
                    child: const BeText('Validate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.reset();
                    },
                    child: const BeText('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.save();
                    },
                    child: const BeText('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// enum Fruit { apple, banana, orange }

// extension FruitExtension on Fruit {
//   String get displayName {
//     switch (this) {
//       case Fruit.apple:
//         return '🍎 Apple';
//       case Fruit.banana:
//         return '🍌 Banana';
//       case Fruit.orange:
//         return '🍊 Orange';
//     }
//   }
// }

class User extends KeyValueIS {
  User({required super.key, required super.value});
}
