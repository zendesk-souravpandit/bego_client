import 'package:beui/be_icons.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeLabel', path: 'widget/multichild', type: BeLabel)
Widget useCaseBeLabel(final BuildContext context) {
  final labelText = context.knobs.string(label: 'Label Text', initialValue: 'NEW');
  final position = context.knobs.object.dropdown<BeLabelPosition>(label: 'Position', options: BeLabelPosition.values);
  final labelColor = context.knobs.color(label: 'Label Color', initialValue: Colors.white);
  final backgroundColor = context.knobs.color(label: 'Background Color', initialValue: Colors.red);
  final childSized = context.knobs.boolean(label: 'Child Sized');
  final innerLabel = context.knobs.boolean(label: 'Inner Label');
  final offsetX = context.knobs.double.slider(label: 'Offset X', initialValue: 0, min: -20, max: 20);
  final offsetY = context.knobs.double.slider(label: 'Offset Y', initialValue: 0, min: -20, max: 20);

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeLabel Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main interactive example
          Center(
            child: BeLabel(
              position: position,
              childSized: childSized,
              innerLabel: innerLabel,
              offset: Offset(offsetX, offsetY),
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: backgroundColor.withValues(alpha: 0.3 * 255),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(labelText, style: TextStyle(color: labelColor, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              child: Container(
                width: 140,
                height: 90,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.blue.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.1 * 255),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.widgets, color: Colors.blue, size: 24),
                      SizedBox(height: 4),
                      Text('Interactive Demo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Practical examples section
          const Text('Practical Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // Product with promotion label
              _buildExampleCard(
                'E-commerce Product',
                'Promotional labels on products',
                Colors.orange,
                BeLabel(
                  position: BeLabelPosition.topLeft,
                  label: _buildPromotionLabel('50% OFF', Colors.red),
                  child: _buildProductCard(),
                ),
              ),

              // User profile with status
              _buildExampleCard(
                'User Profile',
                'Status indicators on profiles',
                Colors.green,
                BeLabel(
                  position: BeLabelPosition.topRight,
                  label: _buildStatusLabel('VERIFIED', Colors.green),
                  child: _buildProfileCard(),
                ),
              ),

              // Document with watermark
              _buildExampleCard(
                'Document Watermark',
                'Inner labels for watermarks',
                Colors.blue,
                BeLabel(
                  position: BeLabelPosition.center,
                  innerLabel: true,
                  label: _buildWatermarkLabel('CONFIDENTIAL'),
                  child: _buildDocumentCard(),
                ),
              ),

              // Image with count badge
              _buildExampleCard(
                'Photo Gallery',
                'Count indicators on images',
                Colors.purple,
                BeLabel(
                  position: BeLabelPosition.bottomRight,
                  label: _buildCountLabel('12 Photos'),
                  child: _buildImageCard(),
                ),
              ),

              // Video with duration
              _buildExampleCard(
                'Video Player',
                'Duration labels on videos',
                Colors.red,
                BeLabel(
                  position: BeLabelPosition.bottomRight,
                  innerLabel: true,
                  label: _buildDurationLabel('4:32'),
                  child: _buildVideoCard(),
                ),
              ),

              // App with update badge
              _buildExampleCard(
                'App Update',
                'Update notifications',
                Colors.teal,
                BeLabel(position: BeLabelPosition.topRight, label: _buildUpdateLabel('UPDATE'), child: _buildAppIcon()),
              ),

              // Event with live indicator
              _buildExampleCard(
                'Live Event',
                'Live status indicators',
                Colors.red,
                BeLabel(position: BeLabelPosition.topLeft, label: _buildLiveLabel(), child: _buildEventCard()),
              ),

              // Article with reading time
              _buildExampleCard(
                'Article Preview',
                'Reading time estimation',
                Colors.indigo,
                BeLabel(
                  position: BeLabelPosition.rightTop,
                  label: _buildReadingTimeLabel('5 min read'),
                  child: _buildArticleCard(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // All positions demonstration
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('All Label Positions:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8,
                    children:
                        BeLabelPosition.values.map((final position) {
                          return BeLabel(
                            position: position,
                            label: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: _getColorForPosition(position),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                _getPositionAbbreviation(position),
                                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.grey.shade100, Colors.grey.shade200],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.label_outline, size: 20, color: Colors.grey.shade600),
                                    const SizedBox(height: 4),
                                    Text(
                                      position.name,
                                      style: TextStyle(
                                        fontSize: 7,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Product promotional labels and discount badges\n'
            '• User status indicators and verification badges\n'
            '• Document watermarks and classification labels\n'
            '• Image and video metadata overlays\n'
            '• App update and notification indicators\n'
            '• Live event and streaming status badges\n'
            '• Content categorization and tagging\n'
            '• Reading time and duration indicators',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Clean information hierarchy without cluttering content\n'
            '• Flexible positioning around widget edges and center\n'
            '• Support for both overlay and inner label modes\n'
            '• Perfect for adding contextual metadata\n'
            '• Maintains content focus while providing additional info\n'
            '• Customizable appearance for brand consistency',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Widget _buildExampleCard(final String title, final String subtitle, final Color accentColor, final Widget example) {
  return SizedBox(
    width: 200,
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 3,
                  height: 16,
                  decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(2)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: accentColor)),
                      Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Center(child: example),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPromotionLabel(final String text, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3 * 255), blurRadius: 4, offset: const Offset(0, 2))],
    ),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
  );
}

Widget _buildStatusLabel(final String text, final Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.verified, color: Colors.white, size: 10),
        const SizedBox(width: 2),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _buildWatermarkLabel(final String text) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.red.withValues(alpha: 0.3 * 255),
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    ),
  );
}

Widget _buildCountLabel(final String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(8)),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w500)),
  );
}

Widget _buildDurationLabel(final String duration) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.7 * 255), borderRadius: BorderRadius.circular(4)),
    child: Text(duration, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w500)),
  );
}

Widget _buildUpdateLabel(final String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(8)),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
  );
}

Widget _buildLiveLabel() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, color: Colors.white, size: 6),
        SizedBox(width: 3),
        Text('LIVE', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _buildReadingTimeLabel(final String time) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
    decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(8)),
    child: RotatedBox(
      quarterTurns: 3,
      child: Text(time, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w500)),
    ),
  );
}

Widget _buildProductCard() {
  return Container(
    width: 80,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 6, offset: const Offset(0, 3)),
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
            child: const Center(child: Icon(Icons.shopping_bag, color: Colors.grey, size: 28)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Column(
            children: [
              Text('Backpack', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              Text('\$89.99', style: TextStyle(fontSize: 8, color: Colors.grey)),
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
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white, size: 20),
        ),
        SizedBox(height: 6),
        Text('Sarah Chen', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        Text('Expert', style: TextStyle(fontSize: 7, color: Colors.grey)),
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
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.description, color: Colors.blue, size: 32),
        SizedBox(height: 8),
        Text('Report.pdf', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
        Text('2.4 MB', style: TextStyle(fontSize: 7, color: Colors.grey)),
      ],
    ),
  );
}

Widget _buildImageCard() {
  return Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: const DecorationImage(image: NetworkImage('https://picsum.photos/80/80?random=3'), fit: BoxFit.cover),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
  );
}

Widget _buildVideoCard() {
  return Container(
    width: 100,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.2 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
    child: const Center(child: Icon(Icons.play_arrow, color: Colors.white, size: 32)),
  );
}

Widget _buildAppIcon() {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.teal.shade400, Colors.teal.shade600],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.teal.withValues(alpha: 0.3 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
    child: const Center(child: Icon(BeIcons.icon_add, color: Colors.white, size: 24)),
  );
}

Widget _buildEventCard() {
  return Container(
    width: 100,
    height: 70,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.red.shade400, Colors.pink.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.red.withValues(alpha: 0.3 * 255), blurRadius: 6, offset: const Offset(0, 3))],
    ),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text('Conference', style: TextStyle(color: Colors.white, fontSize: 9)),
        ],
      ),
    ),
  );
}

Widget _buildArticleCard() {
  return Container(
    width: 100,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 6, offset: const Offset(0, 3)),
      ],
    ),
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.article, color: Colors.indigo, size: 20),
          SizedBox(height: 4),
          Text(
            'How to Build Better UIs',
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Text('by John Doe', style: TextStyle(fontSize: 7, color: Colors.grey)),
        ],
      ),
    ),
  );
}

String _getPositionAbbreviation(final BeLabelPosition position) {
  final abbreviations = {
    BeLabelPosition.topLeft: 'TL',
    BeLabelPosition.topCenter: 'TC',
    BeLabelPosition.topRight: 'TR',
    BeLabelPosition.rightTop: 'RT',
    BeLabelPosition.rightCenter: 'RC',
    BeLabelPosition.rightBottom: 'RB',
    BeLabelPosition.bottomRight: 'BR',
    BeLabelPosition.bottomCenter: 'BC',
    BeLabelPosition.bottomLeft: 'BL',
    BeLabelPosition.leftBottom: 'LB',
    BeLabelPosition.leftCenter: 'LC',
    BeLabelPosition.leftTop: 'LT',
    BeLabelPosition.center: 'C',
  };
  return abbreviations[position] ?? '??';
}

Color _getColorForPosition(final BeLabelPosition position) {
  switch (position) {
    case BeLabelPosition.topLeft:
      return Colors.red;
    case BeLabelPosition.topCenter:
      return Colors.blue;
    case BeLabelPosition.topRight:
      return Colors.green;
    case BeLabelPosition.rightTop:
      return Colors.orange;
    case BeLabelPosition.rightCenter:
      return Colors.purple;
    case BeLabelPosition.rightBottom:
      return Colors.teal;
    case BeLabelPosition.bottomRight:
      return Colors.indigo;
    case BeLabelPosition.bottomCenter:
      return Colors.pink;
    case BeLabelPosition.bottomLeft:
      return Colors.brown;
    case BeLabelPosition.leftBottom:
      return Colors.cyan;
    case BeLabelPosition.leftCenter:
      return Colors.lime;
    case BeLabelPosition.leftTop:
      return Colors.amber;
    case BeLabelPosition.center:
      return Colors.deepOrange;
  }
}
