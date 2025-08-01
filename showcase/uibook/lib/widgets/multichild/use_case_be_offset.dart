import 'package:beui/be_icons.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeOffset', path: 'widget/multichild', type: BeOffset)
Widget useCaseBeOffset(final BuildContext context) {
  final offsetX = context.knobs.double.slider(label: 'Offset X', initialValue: 0, min: -100, max: 100);
  final offsetY = context.knobs.double.slider(label: 'Offset Y', initialValue: 0, min: -100, max: 100);
  final claimPosition = context.knobs.boolean(label: 'Claim Position', initialValue: false);

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeOffset Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main customizable example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Interactive Example:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        // Reference position
                        Positioned(
                          left: 50,
                          top: 40,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(child: Text('REF', style: TextStyle(fontSize: 10, color: Colors.grey))),
                          ),
                        ),
                        // Offset widget
                        Positioned(
                          left: 50,
                          top: 40,
                          child: BeOffset(
                            offset: Offset(offsetX, offsetY),
                            claimPosition: claimPosition,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2 * 255),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(child: Icon(Icons.control_camera, color: Colors.white, size: 20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Offset: (${offsetX.toStringAsFixed(1)}, ${offsetY.toStringAsFixed(1)})',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Practical examples
          const Text('Practical Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Floating Action Button positioning
          _buildExampleCard(
            'Floating Action Button',
            'Custom FAB positioning',
            Colors.blue,
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: const Center(child: Text('Main Content', style: TextStyle(color: Colors.blue))),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: BeOffset(
                    offset: const Offset(8, 8),
                    child: FloatingActionButton.small(
                      heroTag: 'fab1',
                      onPressed: () {},
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tooltip positioning
          _buildExampleCard(
            'Custom Tooltip',
            'Offset tooltip for better visibility',
            Colors.green,
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                  child: const Center(child: Text('Button', style: TextStyle(color: Colors.white, fontSize: 12))),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: BeOffset(
                    offset: const Offset(0, -25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                      child: const Text('Tooltip', style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Shadow effect
          _buildExampleCard(
            'Drop Shadow Effect',
            'Create custom shadow with offset',
            Colors.purple,
            Stack(
              children: [
                // Shadow
                BeOffset(
                  offset: const Offset(4, 4),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2 * 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                // Main element
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.star, color: Colors.white),
                ),
              ],
            ),
          ),

          // Drag indicator
          _buildExampleCard(
            'Drag Indicator',
            'Visual feedback during drag operations',
            Colors.orange,
            Stack(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.shade300),
                  ),
                  child: const Center(child: Text('Draggable', style: TextStyle(fontSize: 10))),
                ),
                BeOffset(
                  offset: const Offset(5, 5),
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.5 * 255),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange, style: BorderStyle.solid),
                    ),
                    child: const Center(child: Text('Preview', style: TextStyle(fontSize: 10, color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),

          // Menu positioning
          _buildExampleCard(
            'Context Menu',
            'Precisely positioned menus',
            Colors.red,
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.more_vert, color: Colors.white),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  child: BeOffset(
                    offset: const Offset(10, 5),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1 * 255),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [_MenuItem('Edit'), _MenuItem('Copy'), _MenuItem('Delete')],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notification positioning
          _buildExampleCard(
            'Notification Badge',
            'Offset notification for better visibility',
            Colors.teal,
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(BeIcons.icon_notifications, color: Colors.white),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: BeOffset(
                    offset: const Offset(4, -4),
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      child: const Center(child: Text('3', style: TextStyle(color: Colors.white, fontSize: 10))),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Image overlay
          _buildExampleCard(
            'Image Overlay',
            'Watermark or logo positioning',
            Colors.indigo,
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.indigo.shade300, Colors.indigo.shade600]),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Image', style: TextStyle(color: Colors.white))),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: BeOffset(
                    offset: const Offset(-2, -2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7 * 255),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Text('© Logo', style: TextStyle(color: Colors.white, fontSize: 8)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Fine-tuning position of floating action buttons\n'
            '• Custom tooltip and popover positioning\n'
            '• Creating drop shadow effects\n'
            '• Drag and drop visual feedback\n'
            '• Context menu and dropdown positioning\n'
            '• Notification badge adjustments\n'
            '• Image watermarks and overlays\n'
            '• Animation starting/ending positions',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Precise pixel-level positioning control\n'
            '• Maintains layout structure while adjusting visuals\n'
            '• Perfect for micro-interactions and polish\n'
            '• Essential for responsive design adjustments\n'
            '• Enables creative layout solutions\n'
            '• Improves accessibility by better positioning',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget _buildExampleCard(final String title, final String subtitle, final Color color, final Widget content) {
  return Card(
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(child: content),
        ],
      ),
    ),
  );
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(this.text);
  final String text;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
