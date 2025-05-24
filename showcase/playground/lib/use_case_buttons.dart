import 'package:beui/helper_ext.dart';
import 'package:flutter/material.dart';

class ButtonShowcase extends StatelessWidget {
  const ButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Button Showcase')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Elevated Buttons'),
            _buildButtonGrid(
              children: [
                _buildButtonVariant('Enabled', ElevatedButton(onPressed: () {}, child: const Text('Button'))),
                _buildButtonVariant('Disabled', const ElevatedButton(onPressed: null, child: Text('Button'))),
                _buildButtonVariant(
                  'Pressed',
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary.withAlpha(0.8.toAlpha()),
                      elevation: 8,
                    ),
                    onPressed: () {},
                    child: const Text('Button'),
                  ),
                ),
                _buildButtonVariant(
                  'With Icon',
                  ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Button')),
                ),
              ],
            ),

            _buildSectionTitle('Filled Buttons'),
            _buildButtonGrid(
              children: [
                _buildButtonVariant('Enabled', FilledButton(onPressed: () {}, child: const Text('Button'))),
                _buildButtonVariant('Disabled', const FilledButton(onPressed: null, child: Text('Button'))),
                _buildButtonVariant('Tonal', FilledButton.tonal(onPressed: () {}, child: const Text('Button'))),
              ],
            ),

            _buildSectionTitle('Outlined Buttons'),
            _buildButtonGrid(
              children: [
                _buildButtonVariant('Enabled', OutlinedButton(onPressed: () {}, child: const Text('Button'))),
                _buildButtonVariant('Disabled', const OutlinedButton(onPressed: null, child: Text('Button'))),
                _buildButtonVariant(
                  'Pressed',
                  OutlinedButton(
                    // style: OutlinedButton.styleFrom(
                    //   side: BorderSide(color: colors.primary, width: 2),
                    // ),
                    onPressed: () {},
                    child: const Text('Button'),
                  ),
                ),
              ],
            ),

            _buildSectionTitle('Text Buttons'),
            _buildButtonGrid(
              children: [
                _buildButtonVariant('Enabled', TextButton(onPressed: () {}, child: const Text('Button'))),
                _buildButtonVariant('Disabled', const TextButton(onPressed: null, child: Text('Button'))),
              ],
            ),

            _buildSectionTitle('Icon Buttons'),
            _buildButtonGrid(
              crossAxisCount: 4,
              children: [
                _buildButtonVariant('Enabled', IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))),
                _buildButtonVariant('Disabled', const IconButton(onPressed: null, icon: Icon(Icons.favorite))),
                _buildButtonVariant('Filled', IconButton.filled(onPressed: () {}, icon: const Icon(Icons.star))),
                _buildButtonVariant('Outlined', IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.share))),
                _buildButtonVariant('Small', IconButton(iconSize: 20, onPressed: () {}, icon: const Icon(Icons.add))),
                _buildButtonVariant(
                  'Large',
                  IconButton(iconSize: 36, onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                ),
              ],
            ),

            _buildSectionTitle('Special Buttons'),
            _buildButtonGrid(
              children: [
                _buildButtonVariant(
                  'Floating Action',
                  FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
                ),
                _buildButtonVariant(
                  'Extended FAB',
                  FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Create'),
                  ),
                ),
                _buildButtonVariant(
                  'Segmented',
                  SegmentedButton(
                    segments: const [
                      ButtonSegment(value: 1, label: Text('Option 1')),
                      ButtonSegment(value: 2, label: Text('Option 2')),
                    ],
                    selected: const {1},
                    onSelectionChanged: (_) {},
                  ),
                ),
              ],
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

  Widget _buildButtonGrid({required List<Widget> children, int crossAxisCount = 2}) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2,
      children: children,
    );
  }

  Widget _buildButtonVariant(String label, Widget button) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 48, child: Center(child: button)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }
}
