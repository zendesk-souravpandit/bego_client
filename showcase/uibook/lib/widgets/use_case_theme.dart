// import 'package:flutter/material.dart';

// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/common.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Theme', path: 'theme', type: MaterialApp)
Widget redContainerUseCase(BuildContext context) => const ThemeDemoPage();

class ThemeDemoPage extends StatefulWidget {
  const ThemeDemoPage({super.key});

  @override
  State<ThemeDemoPage> createState() => _ThemeDemoPageState();
}

class _ThemeDemoPageState extends State<ThemeDemoPage> with SingleTickerProviderStateMixin {
  bool _switchValue = false;
  bool _checkboxValue = false;
  int _radioValue = 0;
  double _sliderValue = 0.5;
  final List<bool> _toggleButtonsSelection = [true, false, false];
  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) => BeDisableWrapper(
    disabled: false,

    child: Scaffold(
      appBar: AppBar(
        title: const Text('Bego UI Components Demo'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'settings', child: Text('Settings')),
                  const PopupMenuItem(value: 'about', child: Text('About')),
                ],
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: const [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Drawer Header')),
            ListTile(title: const Text('Item 1'), onTap: () {}),
            ListTile(title: const Text('Item 2'), onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Buttons'),
            _buildButtonsSection(),

            _buildSectionTitle('Selection Controls'),
            _buildSelectionControls(),

            _buildSectionTitle('Progress Indicators'),
            _buildProgressIndicators(),

            _buildSectionTitle('Chips'),
            _buildChipsSection(),

            _buildSectionTitle('Cards'),
            _buildCardsSection(),

            _buildSectionTitle('Dialogs & Alerts'),
            _buildDialogSection(),

            // _buildSectionTitle('Navigation'),
            // _buildNavigationSection(),
            _buildSectionTitle('Menus & Dropdowns'),
            _buildMenusSection(),

            _buildSectionTitle('Inputs'),
            _buildInputsSection(),

            _buildSectionTitle('Data Display'),
            _buildDataDisplaySection(),

            _buildSectionTitle('Other Components'),
            _buildOtherComponents(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    ),
  );

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
  );

  Widget _buildButtonsSection() => Wrap(
    spacing: 8,
    children: [
      ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
      FilledButton(onPressed: () {}, child: const Text('Filled')),
      OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
      TextButton(onPressed: () {}, child: const Text('Text')),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
    ],
  );

  Widget _buildSelectionControls() => Column(
    children: [
      Row(
        children: [
          Switch(value: _switchValue, onChanged: (v) => setState(() => _switchValue = v)),
          Checkbox(value: _checkboxValue, onChanged: (v) => setState(() => _checkboxValue = v ?? false)),
          ...List.generate(
            2,
            (index) => Radio<int>(
              value: index,
              groupValue: _radioValue,
              onChanged: (v) => setState(() => _radioValue = v ?? 0),
            ),
          ),
        ],
      ),
      Slider(value: _sliderValue, onChanged: (v) => setState(() => _sliderValue = v)),
      ToggleButtons(
        isSelected: _toggleButtonsSelection,
        onPressed: (i) => setState(() => _toggleButtonsSelection[i] = !_toggleButtonsSelection[i]),
        children: const [Icon(Icons.format_bold), Icon(Icons.format_italic), Icon(Icons.format_underline)],
      ),
    ],
  );

  Widget _buildProgressIndicators() => const Row(
    children: [Expanded(child: LinearProgressIndicator(value: 0.5)), SizedBox(width: 16), CircularProgressIndicator()],
  );

  Widget _buildChipsSection() => Wrap(
    spacing: 8,
    children: [
      ActionChip(label: const Text('Action'), onPressed: () {}),
      FilterChip(label: const Text('Filter'), selected: _checkboxValue, onSelected: (v) {}),
      const InputChip(label: Text('Input')),
      ChoiceChip(label: const Text('Choice'), selected: _radioValue == 0, onSelected: (v) {}),
    ],
  );

  Widget _buildCardsSection() => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('Sample Card'),
          const SizedBox(height: 8),
          Text('Card content demonstrating text styles and spacing', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    ),
  );

  Widget _buildDialogSection() => Column(
    children: [
      ElevatedButton(
        onPressed:
            () => showDialog<void>(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('Dialog content'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                  ),
            ),
        child: const Text('Show Dialog'),
      ),
      ElevatedButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sample SnackBar'))),
        child: const Text('Show SnackBar'),
      ),
    ],
  );

  // Widget _buildNavigationSection() => SizedBox(
  //   width: double.infinity,
  //   height: 500,
  //   child: Column(
  //     children: [
  //       NavigationRail(
  //         selectedIndex: _currentIndex,
  //         onDestinationSelected: (i) => setState(() => _currentIndex = i),
  //         destinations: const [
  //           NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
  //           NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
  //         ],
  //       ),
  //     ],
  //   ),
  // );

  Widget _buildMenusSection() => Column(
    children: [
      const DropdownMenu<String>(
        initialSelection: 'Option 1',
        dropdownMenuEntries: [
          DropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
          DropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
        ],
      ),
      MenuBar(
        children: [
          SubmenuButton(
            menuChildren: [
              MenuItemButton(onPressed: () {}, child: const Text('Item 1')),
              MenuItemButton(onPressed: () {}, child: const Text('Item 2')),
            ],
            child: const Text('Menu'),
          ),
        ],
      ),
    ],
  );

  Widget _buildInputsSection() => Column(
    children: [
      const TextField(decoration: InputDecoration(labelText: 'Text Field', hintText: 'Enter text...')),
      const SizedBox(height: 16),
      const SearchBar(hintText: 'Search...', leading: Icon(Icons.search)),
      const SizedBox(height: 16),
      Row(
        children: [
          ElevatedButton(
            onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              setState(() => {});
            },
            child: const Text('Pick Date'),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () async {
              await showTimePicker(context: context, initialTime: TimeOfDay.now());
              setState(() => {});
            },
            child: const Text('Pick Time'),
          ),
        ],
      ),
    ],
  );

  Widget _buildDataDisplaySection() => Column(
    children: [
      const Divider(),
      DataTable(
        columns: const [DataColumn(label: Text('Name')), DataColumn(label: Text('Age'))],
        rows: const [
          DataRow(cells: [DataCell(Text('Alice')), DataCell(Text('30'))]),
          DataRow(cells: [DataCell(Text('Bob')), DataCell(Text('25'))]),
        ],
      ),
      const ListTile(
        leading: Icon(Icons.person),
        title: Text('List Tile Title'),
        subtitle: Text('Subtitle content'),
        trailing: Icon(Icons.more_vert),
      ),
      const ExpansionTile(title: Text('Expansion Tile'), children: [Text('Expanded content')]),
    ],
  );

  Widget _buildOtherComponents() => Wrap(
    spacing: 8,
    children: [
      const Badge(label: Text('3'), child: Icon(Icons.notifications)),
      const Tooltip(message: 'Sample tooltip', child: Icon(Icons.info_outline)),
      IconButton(
        icon: const Icon(Icons.help),
        onPressed:
            () => showModalBottomSheet<void>(
              context: context,
              builder: (context) => const Padding(padding: EdgeInsets.all(16), child: Text('Bottom Sheet Content')),
            ),
      ),
    ],
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
