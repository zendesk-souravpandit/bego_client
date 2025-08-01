import 'package:beui/be_icons.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeMultiLabel', path: 'widget/multichild', type: BeMultiLabel)
Widget useCaseBeMultiLabel(final BuildContext context) {
  final labelCount = context.knobs.int.slider(label: 'Label Count', initialValue: 3, min: 1, max: 6);

  // Create a list of labels based on the count
  final labels = List.generate(labelCount, (final index) {
    const positions = BeMultiLabelPosition.values;
    return BeLabelChild(
      position: positions[index % positions.length],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _getLabelColor(index),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 2, offset: const Offset(0, 1)),
          ],
        ),
        child: _getLabelContent(index),
      ),
    );
  });

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeMultiLabel Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main customizable example
          Center(child: BeMultiLabel(labels: labels, child: _buildExampleCard('Dynamic Multi-Label', Colors.blue))),

          const SizedBox(height: 32),

          // Practical examples grid
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              // Image with multiple labels
              BeMultiLabel(
                labels: [
                  BeLabelChild(position: BeMultiLabelPosition.topLeft, child: _buildLabel('Featured', Colors.orange)),
                  BeLabelChild(position: BeMultiLabelPosition.topRight, child: _buildLabel('4.9★', Colors.amber)),
                  BeLabelChild(position: BeMultiLabelPosition.bottomLeft, child: _buildLabel('Premium', Colors.purple)),
                  BeLabelChild(position: BeMultiLabelPosition.bottomRight, child: _buildPriceLabel('\$29.99')),
                ],
                child: _buildImageCard(),
              ),

              // Product card with status indicators
              BeMultiLabel(
                labels: [
                  BeLabelChild(
                    position: BeMultiLabelPosition.topCenter,
                    child: _buildLabel('Limited Edition', Colors.red),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.rightCenter,
                    child: _buildVerticalLabel('Best Seller', Colors.green),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.bottomCenter,
                    child: _buildLabel('Free Shipping', Colors.blue),
                  ),
                ],
                child: _buildProductCard(),
              ),

              // Profile card with achievements
              BeMultiLabel(
                labels: [
                  BeLabelChild(
                    position: BeMultiLabelPosition.topRight,
                    child: _buildIconLabel(Icons.verified, Colors.blue, 'Verified'),
                  ),
                  BeLabelChild(position: BeMultiLabelPosition.rightTop, child: _buildLabel('PRO', Colors.purple)),
                  BeLabelChild(
                    position: BeMultiLabelPosition.rightBottom,
                    child: _buildIconLabel(Icons.star, Colors.amber, 'Top Rated'),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.bottomLeft,
                    child: _buildLabel('10+ Years', Colors.green),
                  ),
                ],
                child: _buildProfileCard(),
              ),

              // Document with multiple statuses
              BeMultiLabel(
                labels: [
                  BeLabelChild(position: BeMultiLabelPosition.topLeft, child: _buildLabel('Confidential', Colors.red)),
                  BeLabelChild(
                    position: BeMultiLabelPosition.leftTop,
                    child: _buildVerticalLabel('Draft', Colors.orange),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.leftBottom,
                    child: _buildVerticalLabel('V2.1', Colors.blue),
                  ),
                  BeLabelChild(position: BeMultiLabelPosition.bottomRight, child: _buildLabel('Due Today', Colors.red)),
                  BeLabelChild(position: BeMultiLabelPosition.center, child: _buildWatermark('COPY')),
                ],
                child: _buildDocumentCard(),
              ),

              // Event card with multiple info labels
              BeMultiLabel(
                labels: [
                  BeLabelChild(position: BeMultiLabelPosition.topLeft, child: _buildLabel('Live', Colors.red)),
                  BeLabelChild(position: BeMultiLabelPosition.topRight, child: _buildLabel('Popular', Colors.orange)),
                  BeLabelChild(
                    position: BeMultiLabelPosition.leftCenter,
                    child: _buildVerticalLabel('Online', Colors.green),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.rightCenter,
                    child: _buildVerticalLabel('Free', Colors.blue),
                  ),
                  BeLabelChild(
                    position: BeMultiLabelPosition.bottomCenter,
                    child: _buildLabel('500+ Attending', Colors.purple),
                  ),
                ],
                child: _buildEventCard(),
              ),

              // App icon with notifications
              BeMultiLabel(
                labels: [
                  BeLabelChild(position: BeMultiLabelPosition.topRight, child: _buildNotificationBadge('12')),
                  BeLabelChild(position: BeMultiLabelPosition.bottomRight, child: _buildUpdateBadge()),
                  BeLabelChild(position: BeMultiLabelPosition.bottomLeft, child: _buildLabel('v2.0', Colors.grey)),
                ],
                child: _buildAppIcon(),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Position demonstration
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('All Position Examples:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  Center(
                    child: BeMultiLabel(
                      labels:
                          BeMultiLabelPosition.values.map((final position) {
                            return BeLabelChild(
                              position: position,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: _getPositionColor(position),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Text(
                                  _getPositionAbbreviation(position),
                                  style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }).toList(),
                      child: Container(
                        width: 120,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Position\nDemo',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• E-commerce products with multiple promotional labels\n'
            '• Image galleries with watermarks and metadata\n'
            '• User profiles with multiple achievement badges\n'
            '• Document management with status and version labels\n'
            '• Event cards with multiple information indicators\n'
            '• App icons with notifications and update badges\n'
            '• Content cards with rating, status, and category labels\n'
            '• Interactive elements with contextual information',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Rich information display without cluttering the main content\n'
            '• Flexible positioning around all sides of widgets\n'
            '• Support for both horizontal and vertical label orientations\n'
            '• Perfect for complex UI elements requiring multiple indicators\n'
            '• Maintains clean separation between content and metadata\n'
            '• Enables creative and informative user interfaces',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Color _getLabelColor(final int index) {
  final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];
  return colors[index % colors.length];
}

Widget _getLabelContent(final int index) {
  final contents = [
    const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.white, size: 10),
        SizedBox(width: 2),
        Text('HOT', style: TextStyle(color: Colors.white, fontSize: 8)),
      ],
    ),
    const Text('SALE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    const Icon(Icons.flash_on, color: Colors.white, size: 12),
    const Text('TOP', style: TextStyle(color: Colors.white, fontSize: 10)),
    const Text('99+', style: TextStyle(color: Colors.white, fontSize: 10)),
  ];
  return contents[index % contents.length];
}

Widget _buildExampleCard(final String title, final Color color) {
  return Container(
    width: 140,
    height: 90,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1 * 255),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ),
  );
}

Widget _buildLabel(final String text, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.2 * 255), blurRadius: 2, offset: const Offset(0, 1)),
      ],
    ),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
  );
}

Widget _buildVerticalLabel(final String text, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
    child: RotatedBox(
      quarterTurns: 3,
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildIconLabel(final IconData icon, final Color color, final String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 8),
        const SizedBox(width: 2),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _buildPriceLabel(final String price) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
    child: Text(price, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
  );
}

Widget _buildWatermark(final String text) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Text(
      text,
      style: TextStyle(color: Colors.black.withValues(alpha: 0.1 * 255), fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildNotificationBadge(final String count) {
  return Container(
    width: 16,
    height: 16,
    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
    child: Center(
      child: Text(count, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildUpdateBadge() {
  return Container(
    width: 12,
    height: 12,
    decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
    child: const Center(child: Icon(Icons.download, color: Colors.white, size: 8)),
  );
}

Widget _buildImageCard() {
  return Container(
    width: 120,
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: const DecorationImage(image: NetworkImage('https://picsum.photos/120/80?random=2'), fit: BoxFit.cover),
    ),
  );
}

Widget _buildProductCard() {
  return Container(
    width: 100,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Center(child: Icon(Icons.headphones, color: Colors.grey, size: 32)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Headphones', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              Text('\$199.99', style: TextStyle(fontSize: 8, color: Colors.grey)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildProfileCard() {
  return Container(
    width: 80,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 20, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white)),
        SizedBox(height: 8),
        Text('John Doe', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        Text('Expert', style: TextStyle(fontSize: 8, color: Colors.grey)),
      ],
    ),
  );
}

Widget _buildDocumentCard() {
  return Container(
    width: 80,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.description, color: Colors.grey, size: 32),
        SizedBox(height: 8),
        Text('Report.pdf', style: TextStyle(fontSize: 8)),
      ],
    ),
  );
}

Widget _buildEventCard() {
  return Container(
    width: 120,
    height: 80,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple.shade300, Colors.blue.shade300],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text('Conference', style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    ),
  );
}

Widget _buildAppIcon() {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue.shade400, Colors.blue.shade600],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(child: Icon(BeIcons.icon_add, color: Colors.white, size: 24)),
  );
}

Color _getPositionColor(final BeMultiLabelPosition position) {
  final colors = {
    BeMultiLabelPosition.topLeft: Colors.red,
    BeMultiLabelPosition.topCenter: Colors.orange,
    BeMultiLabelPosition.topRight: Colors.yellow,
    BeMultiLabelPosition.rightTop: Colors.green,
    BeMultiLabelPosition.rightCenter: Colors.teal,
    BeMultiLabelPosition.rightBottom: Colors.blue,
    BeMultiLabelPosition.bottomRight: Colors.indigo,
    BeMultiLabelPosition.bottomCenter: Colors.purple,
    BeMultiLabelPosition.bottomLeft: Colors.pink,
    BeMultiLabelPosition.leftBottom: Colors.brown,
    BeMultiLabelPosition.leftCenter: Colors.grey,
    BeMultiLabelPosition.leftTop: Colors.blueGrey,
    BeMultiLabelPosition.center: Colors.black,
  };
  return colors[position] ?? Colors.grey;
}

String _getPositionAbbreviation(final BeMultiLabelPosition position) {
  final abbreviations = {
    BeMultiLabelPosition.topLeft: 'TL',
    BeMultiLabelPosition.topCenter: 'TC',
    BeMultiLabelPosition.topRight: 'TR',
    BeMultiLabelPosition.rightTop: 'RT',
    BeMultiLabelPosition.rightCenter: 'RC',
    BeMultiLabelPosition.rightBottom: 'RB',
    BeMultiLabelPosition.bottomRight: 'BR',
    BeMultiLabelPosition.bottomCenter: 'BC',
    BeMultiLabelPosition.bottomLeft: 'BL',
    BeMultiLabelPosition.leftBottom: 'LB',
    BeMultiLabelPosition.leftCenter: 'LC',
    BeMultiLabelPosition.leftTop: 'LT',
    BeMultiLabelPosition.center: 'C',
  };
  return abbreviations[position] ?? '??';
}
