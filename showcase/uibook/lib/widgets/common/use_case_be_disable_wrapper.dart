import 'package:beui/common.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeDisableWrapper', path: 'widget/common', type: BeDisableWrapper)
Widget useCaseBeDisableWrapper(final BuildContext context) {
  final disabled = context.knobs.boolean(label: 'Disabled', initialValue: false);
  final lightModeOpacity = context.knobs.double.slider(
    label: 'Light Mode Opacity',
    initialValue: 0.6,
    min: 0.1,
    max: 1.0,
  );
  final darkModeOpacity = context.knobs.double.slider(
    label: 'Dark Mode Opacity',
    initialValue: 0.8,
    min: 0.1,
    max: 1.0,
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeDisableWrapper Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          const Text('Button Examples:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          Row(
            children: [
              BeDisableWrapper(
                disabled: disabled,
                lightModeOpacity: lightModeOpacity,
                darkModeOpacity: darkModeOpacity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Elevated Button Pressed!')));
                  },
                  child: const Text('Elevated Button'),
                ),
              ),
              const SizedBox(width: 12),
              BeDisableWrapper(
                disabled: disabled,
                lightModeOpacity: lightModeOpacity,
                darkModeOpacity: darkModeOpacity,
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Outlined Button Pressed!')));
                  },
                  child: const Text('Outlined Button'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text('Form Controls:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeDisableWrapper(
            disabled: disabled,
            lightModeOpacity: lightModeOpacity,
            darkModeOpacity: darkModeOpacity,
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(labelText: 'Username', border: OutlineInputBorder())),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text('Interactive Widgets:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeDisableWrapper(
            disabled: disabled,
            lightModeOpacity: lightModeOpacity,
            darkModeOpacity: darkModeOpacity,
            child: RadioGroup<int>(
              groupValue: 1,
              onChanged: (_) {},
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text('Checkbox'),
                  const SizedBox(width: 20),
                  Switch(value: true, onChanged: (_) {}),
                  const Text('Switch'),
                  const SizedBox(width: 20),
                  const Radio<int>(value: 1),
                  const Text('Radio'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Card with Content:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeDisableWrapper(
            disabled: disabled,
            lightModeOpacity: lightModeOpacity,
            darkModeOpacity: darkModeOpacity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Software Developer', style: TextStyle(color: Colors.grey.shade600)),
                            ],
                          ),
                        ),
                        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This is a sample card with various interactive elements to demonstrate the disable wrapper functionality.',
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('CANCEL')),
                        const SizedBox(width: 8),
                        ElevatedButton(onPressed: () {}, child: const Text('SAVE')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('List with Actions:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeDisableWrapper(
            disabled: disabled,
            lightModeOpacity: lightModeOpacity,
            darkModeOpacity: darkModeOpacity,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildListItem(Icons.inbox, 'Inbox', '12 new messages'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildListItem(Icons.star, 'Starred', '3 starred items'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildListItem(Icons.send, 'Sent', 'Last sent 2 hours ago'),
                  Divider(height: 1, color: Colors.grey.shade300),
                  _buildListItem(Icons.drafts, 'Drafts', '5 draft messages'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Complex Widget Tree:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          BeDisableWrapper(
            disabled: disabled,
            lightModeOpacity: lightModeOpacity,
            darkModeOpacity: darkModeOpacity,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade100, Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade300),
              ),
              child: Column(
                children: [
                  const Icon(Icons.shopping_cart, size: 48, color: Colors.purple),
                  const SizedBox(height: 12),
                  const Text('Shopping Cart', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Manage your items and checkout'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(icon: const Icon(Icons.add_shopping_cart), onPressed: () {}),
                          const Text('Add Item'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(icon: const Icon(Icons.remove_shopping_cart), onPressed: () {}),
                          const Text('Remove Item'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(icon: const Icon(Icons.payment), onPressed: () {}),
                          const Text('Checkout'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Toggle the disabled state to see how all child widgets are affected',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget _buildListItem(final IconData icon, final String title, final String subtitle) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: const Icon(Icons.chevron_right),
    onTap: () {},
  );
}
