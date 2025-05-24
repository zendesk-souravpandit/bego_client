import 'package:beui/common.dart';
import 'package:beui/decoration.dart';
import 'package:flutter/material.dart';

class DropdownMenuShowcase extends StatefulWidget {
  const DropdownMenuShowcase({super.key});

  @override
  State<DropdownMenuShowcase> createState() => _DropdownMenuShowcaseState();
}

class _DropdownMenuShowcaseState extends State<DropdownMenuShowcase> {
  String? _simpleDropdownValue;
  String? _outlinedDropdownValue;
  String? _filledDropdownValue;
  String? _customDropdownValue;
  String? _menuAnchorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown & Menu Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Basic DropdownButton
            _buildSectionTitle('1. Basic DropdownButton'),
            _buildExampleCard(
              child: DropdownButton<String>(
                value: _simpleDropdownValue,
                hint: const Text('Select an option'),

                items: const [
                  DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'option2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'option3', child: Text('Option 3')),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                isDense: true,

                underline: emptyWidget,
                padding: px8 + p4,

                onChanged: (value) {
                  setState(() => _simpleDropdownValue = value);
                },
              ),
            ),

            // 2. Outlined DropdownButtonFormField
            _buildSectionTitle('2. Outlined DropdownButtonFormField'),
            _buildExampleCard(
              child: DropdownButtonFormField<String>(
                value: _outlinedDropdownValue,

                decoration: const InputDecoration(
                  // labelText: 'Choose item',
                  // border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                items: [
                  DropdownMenuItem(value: 'item1', child: const Text('Item 1'), onTap: () {}),
                  const DropdownMenuItem(value: 'item2', child: Text('Item 2')),
                  const DropdownMenuItem(value: 'item3', child: Text('Item 3')),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                onChanged: (value) {
                  setState(() => _outlinedDropdownValue = value);
                },
              ),
            ),

            // 3. Filled DropdownButtonFormField
            _buildSectionTitle('3. Filled DropdownButtonFormField'),
            _buildExampleCard(
              child: DropdownButtonFormField<String>(
                value: _filledDropdownValue,
                // decoration: const InputDecoration(
                //   labelText: 'Select option',
                //   filled: true,
                //   border: OutlineInputBorder(borderSide: BorderSide.none),
                // ),
                items: const [
                  DropdownMenuItem(value: 'opt1', child: Text('Option A')),
                  DropdownMenuItem(value: 'opt2', child: Text('Option B')),
                  DropdownMenuItem(value: 'opt3', child: Text('Option C')),
                ],

                borderRadius: const BorderRadius.all(Radius.circular(16)),
                onChanged: (value) {
                  setState(() => _filledDropdownValue = value);
                },
              ),
            ),

            // 4. Custom Styled Dropdown
            _buildSectionTitle('4. Custom Styled Dropdown'),
            _buildExampleCard(
              child: DropdownButton<String>(
                value: _customDropdownValue,
                hint: const Text('Custom dropdown'),
                icon: const Icon(Icons.arrow_drop_down_circle),
                iconSize: 24,
                style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                underline: emptyWidget,
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                items: const [
                  DropdownMenuItem(value: 'custom1', child: Text('Custom Option 1')),
                  DropdownMenuItem(value: 'custom2', child: Text('Custom Option 2')),
                ],
                // selectedItemBuilder: (context) => [const BeText("text")],
                onChanged: (value) {
                  setState(() => _customDropdownValue = value);
                },
              ),
            ),

            // 5. Disabled Dropdown
            _buildSectionTitle('5. Disabled Dropdown'),
            _buildExampleCard(
              child: DropdownButtonFormField<String>(
                value: null,
                hint: const Text('Disabled dropdown'),
                items: const [
                  DropdownMenuItem(value: 'x', child: Text('Option X')),
                  DropdownMenuItem(value: 'y', child: Text('Option Y')),
                ],
                onChanged: null, // Disabled when onChanged is null
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),

            // 6. DropdownMenu (New in Flutter 3.0)
            _buildSectionTitle('6. DropdownMenu (New in Flutter 3.0)'),
            _buildExampleCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownMenu<String>(
                    initialSelection: null,
                    onSelected: (value) {
                      setState(() => _menuAnchorValue = value);
                    },
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'menu1', label: 'Menu Item 1'),
                      DropdownMenuEntry(value: 'menu2', label: 'Menu Item 2'),
                      DropdownMenuEntry(value: 'menu3', label: 'Menu Item 3'),
                    ],
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    width: 200,
                  ),
                  if (_menuAnchorValue != null)
                    Padding(padding: const EdgeInsets.only(top: 8), child: Text('Selected: $_menuAnchorValue')),
                ],
              ),
            ),

            // 7. MenuAnchor (Context Menu)
            _buildSectionTitle('7. MenuAnchor (Context Menu)'),
            _buildExampleCard(
              child: MenuAnchor(
                style: const MenuStyle(padding: WidgetStatePropertyAll(p0)),
                builder: (BuildContext context, MenuController controller, Widget? child) {
                  return FilledButton(
                    onPressed: () {
                      controller.open();
                    },
                    child: const Text('Open Menu'),
                  );
                },
                menuChildren: [
                  MenuItemButton(child: const Text('Copy'), onPressed: () => _showSnackbar(context, 'Copied!')),
                  MenuItemButton(child: const Text('Paste'), onPressed: () => _showSnackbar(context, 'Pasted!')),
                  SubmenuButton(
                    menuStyle: const MenuStyle(padding: WidgetStatePropertyAll(p0)),
                    menuChildren: [
                      MenuItemButton(
                        child: const Text('Option A'),
                        onPressed: () => _showSnackbar(context, 'Option A selected'),
                      ),
                      MenuItemButton(
                        child: const Text('Option B'),
                        onPressed: () => _showSnackbar(context, 'Option B selected'),
                      ),
                    ],
                    child: const Text('More Options'),
                  ),
                ],
              ),
            ),

            // 8. PopupMenuButton
            _buildSectionTitle('8. PopupMenuButton'),
            _buildExampleCard(
              child: Center(
                child: PopupMenuButton<String>(
                  onSelected: (value) => _showSnackbar(context, 'Selected $value'),
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(value: 'edit', child: Text('Edit')),
                        const PopupMenuItem(value: 'delete', child: Text('Delete')),
                        const PopupMenuItem(value: 'share', child: Text('Share')),
                      ],
                  child: const Chip(label: Text('Actions'), avatar: Icon(Icons.arrow_drop_down)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildExampleCard({required Widget child}) {
    return Padding(padding: const EdgeInsets.all(16), child: child);
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
