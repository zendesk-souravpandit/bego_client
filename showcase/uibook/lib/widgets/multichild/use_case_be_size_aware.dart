import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeSizeAware', path: 'widget/multichild', type: BeSizeAware)
Widget useCaseBeSizeAware(final BuildContext context) {
  final maxWidth = context.knobs.double.slider(label: 'Max Width', initialValue: 300, min: 100, max: 500);
  final maxHeight = context.knobs.double.slider(label: 'Max Height', initialValue: 200, min: 100, max: 300);
  final enableConstraints = context.knobs.boolean(label: 'Enable Custom Constraints', initialValue: true);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeSizeAware Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main customizable example
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Interactive Example:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BeSizeAware(
                      constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
                      builder:
                          (final size) => Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue.shade100, Colors.blue.shade300],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.dashboard, color: Colors.blue, size: 32),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Available Size:',
                                    style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${size.width.toInt()} × ${size.height.toInt()}',
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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

          // Practical examples
          const Text('Practical Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Responsive grid
          _buildExampleCard(
            'Responsive Grid',
            'Grid adapts column count based on available width',
            Colors.green,
            SizedBox(
              height: 120,
              child: BeSizeAware(
                builder: (final size) {
                  final columns = (size.width / 80).floor().clamp(1, 6);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: columns * 2,
                    itemBuilder:
                        (final context, final index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  );
                },
              ),
            ),
          ),

          // Adaptive text
          _buildExampleCard(
            'Adaptive Text',
            'Font size adjusts based on container size',
            Colors.purple,
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(
                builder: (final size) {
                  final fontSize = (size.width / 10).clamp(12.0, 24.0);
                  return Center(
                    child: Text(
                      'Responsive Text',
                      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  );
                },
              ),
            ),
          ),

          // Chart that scales
          _buildExampleCard(
            'Scalable Chart',
            'Chart elements scale with container size',
            Colors.orange,
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(builder: (final Size size) => CustomPaint(painter: _ChartPainter(size), size: size)),
            ),
          ),

          // Responsive button layout
          _buildExampleCard(
            'Responsive Buttons',
            'Button layout changes based on available space',
            Colors.red,
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(
                builder: (final Size size) {
                  final isWide = size.width > 200;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        isWide
                            ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _buildButtons())
                            : Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _buildButtons()),
                  );
                },
              ),
            ),
          ),

          // Image with responsive overlay
          _buildExampleCard(
            'Responsive Image Overlay',
            'Overlay content adapts to image size',
            Colors.teal,
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/${300}/${200}?random=1'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BeSizeAware(
                builder: (final Size size) {
                  final showFullInfo = size.width > 150;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            showFullInfo
                                ? const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Beautiful Landscape',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    Text('Nature photography', style: TextStyle(color: Colors.white70, fontSize: 10)),
                                  ],
                                )
                                : const Text(
                                  'Photo',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Card layout that adapts
          _buildExampleCard(
            'Adaptive Card Layout',
            'Card content reflows based on dimensions',
            Colors.indigo,
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(
                builder: (final Size size) {
                  final isCompact = size.width < 180;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        isCompact
                            ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person, color: Colors.indigo),
                                Text('User', style: TextStyle(fontSize: 10)),
                              ],
                            )
                            : const Row(
                              children: [
                                Icon(Icons.person, color: Colors.indigo),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                      Text('Software Engineer', style: TextStyle(color: Colors.grey, fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                  );
                },
              ),
            ),
          ),

          // Progress visualization
          _buildExampleCard(
            'Responsive Progress',
            'Progress indicator adapts to container size',
            Colors.amber,
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(
                builder: (final Size size) {
                  const progress = 0.7; // 70% progress
                  final showPercentage = size.width > 100;

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (showPercentage) ...[
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                        ],
                        Container(
                          height: showPercentage ? 8 : 16,
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            widthFactor: progress,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Responsive grid layouts that adapt column count\n'
            '• Charts and graphs that scale with container size\n'
            '• Text that adjusts font size based on available space\n'
            '• Button layouts that switch between horizontal/vertical\n'
            '• Image overlays that show different content based on size\n'
            '• Card layouts that adapt their information density\n'
            '• Progress indicators that change presentation style\n'
            '• Navigation elements that collapse/expand based on space',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Creates truly responsive components\n'
            '• Eliminates the need for MediaQuery in many cases\n'
            '• Enables container-query-like behavior\n'
            '• Perfect for reusable components\n'
            '• Simplifies responsive design implementation\n'
            '• Provides fine-grained control over layout adaptation',
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
                    Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    ),
  );
}

List<Widget> _buildButtons() {
  return [
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        minimumSize: const Size(60, 32),
      ),
      child: const Text('Save', style: TextStyle(fontSize: 10)),
    ),
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        minimumSize: const Size(60, 32),
      ),
      child: const Text('Cancel', style: TextStyle(fontSize: 10)),
    ),
  ];
}

class _ChartPainter extends CustomPainter {
  _ChartPainter(this.containerSize);
  final Size containerSize;

  @override
  void paint(final Canvas canvas, final Size size) {
    final paint =
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final fillPaint =
        Paint()
          ..color = Colors.orange.withOpacity(0.3)
          ..style = PaintingStyle.fill;

    // Create a simple area chart that scales with container size
    final data = [0.2, 0.5, 0.3, 0.8, 0.4, 0.7, 0.6];
    final stepX = size.width / (data.length - 1);

    final path = Path();
    final fillPath = Path();

    // Start from bottom left for fill
    fillPath.moveTo(0, size.height);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    // Complete the fill path
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // Draw fill first, then stroke
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint =
        Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height);
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
