import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeSizeAware', path: 'widget/multichild', type: BeSizeAware)
Widget useCaseBeSizeAware(final BuildContext context) {
  final maxWidth = context.knobs.double.slider(label: 'Max Width', initialValue: 300, min: 100, max: 500);
  final maxHeight = context.knobs.double.slider(label: 'Max Height', initialValue: 200, min: 100, max: 300);
  final enableConstraints = context.knobs.boolean(label: 'Enable Custom Constraints', initialValue: true);
  final selectedScenario = context.knobs.list(
    label: 'Real-World Scenario',
    options: [
      'E-commerce Product Card',
      'Social Media Post',
      'Dashboard Widget',
      'Chat Message',
      'Media Player Controls',
    ],
    initialOption: 'E-commerce Product Card',
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Real-World BeSizeAware: $selectedScenario',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Selected real-world scenario
          _buildRealWorldScenario(selectedScenario, enableConstraints, maxWidth, maxHeight),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),

          const Text('Additional Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

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
                          (final data) => Container(
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
                                    '${data.width.toInt()} × ${data.height.toInt()}',
                                    style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Aspect: ${data.aspectRatio.toStringAsFixed(2)} ${data.isLandscape ? '🌄' : '📱'}',
                                    style: TextStyle(color: Colors.blue.shade800, fontSize: 12),
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
                builder: (final data) {
                  final columns = (data.width / 80).floor().clamp(1, 6);
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
                builder: (final data) {
                  final fontSize = data.responsiveMin(0.15).clamp(12.0, 24.0);
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
              child: BeSizeAware(
                builder: (final data) => CustomPaint(painter: _ChartPainter(data.size), size: data.size),
              ),
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
                builder: (final data) {
                  final isWide = data.isWiderThan(200);
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
                  image: NetworkImage('https://picsum.photos/300/200?random=1'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BeSizeAware(
                builder: (final data) {
                  final showFullInfo = data.isWiderThan(150);
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
                builder: (final data) {
                  final isCompact = data.isWiderThan(180);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        isCompact
                            ? const Row(
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
                            )
                            : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person, color: Colors.indigo),
                                Text('User', style: TextStyle(fontSize: 10)),
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
                builder: (final data) {
                  const progress = 0.7; // 70% progress
                  final showPercentage = data.isWiderThan(100);

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

          // New example using aspect ratio
          _buildExampleCard(
            'Aspect Ratio Aware',
            'Layout changes based on container aspect ratio',
            Colors.pink,
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: BeSizeAware(
                builder: (final data) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.isSquare
                              ? 'Square!'
                              : data.isLandscape
                              ? 'Landscape'
                              : 'Portrait',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontSize: data.responsiveMin(0.1),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ratio: ${data.aspectRatio.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.pink.shade700, fontSize: data.responsiveMin(0.06)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Real-World Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• E-commerce product cards that adapt content density based on space\n'
            '• Social media posts that intelligently truncate content on smaller screens\n'
            '• Dashboard widgets that switch between detailed and summary views\n'
            '• Chat interfaces with responsive message bubbles and timestamps\n'
            '• Media player controls that hide/show features based on container size\n'
            '• Responsive grid layouts that automatically adjust column count\n'
            '• Cards that reorganize content between horizontal and vertical layouts\n'
            '• Navigation bars that switch between full and compact modes\n'
            '• Data visualizations that adapt detail level to available space\n'
            '• Form layouts that stack/unstack fields based on container width',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Text('Key Benefits:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Eliminates the need for MediaQuery in component-level responsive design\n'
            '• Enables true container queries in Flutter (like CSS container queries)\n'
            '• Perfect for building reusable, truly responsive components\n'
            '• Automatically adapts to parent constraints without hard-coded breakpoints\n'
            '• Provides rich responsive utilities (responsiveWidth, isWiderThan, etc.)\n'
            '• Simplifies complex responsive layout implementations\n'
            '• Works seamlessly in any container size or device orientation\n'
            '• Improves code maintainability by keeping responsive logic in components',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

// MARK: - Real-World Scenarios
Widget _buildRealWorldScenario(
  final String scenario,
  final bool enableConstraints,
  final double maxWidth,
  final double maxHeight,
) {
  switch (scenario) {
    case 'E-commerce Product Card':
      return _buildProductCard(enableConstraints, maxWidth, maxHeight);
    case 'Social Media Post':
      return _buildSocialMediaPost(enableConstraints, maxWidth, maxHeight);
    case 'Dashboard Widget':
      return _buildDashboardWidget(enableConstraints, maxWidth, maxHeight);
    case 'Chat Message':
      return _buildChatMessage(enableConstraints, maxWidth, maxHeight);
    case 'Media Player Controls':
      return _buildMediaPlayerControls(enableConstraints, maxWidth, maxHeight);
    default:
      return _buildProductCard(enableConstraints, maxWidth, maxHeight);
  }
}

Widget _buildProductCard(final bool enableConstraints, final double maxWidth, final double maxHeight) {
  return Card(
    elevation: 4,
    child: BeSizeAware(
      constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
      builder: (final data) {
        final isCompact = data.width < 200;
        final showFullDetails = data.width > 250 && data.height > 180;

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    width: data.responsiveWidth(isCompact ? 0.35 : 0.25),
                    height: data.responsiveWidth(isCompact ? 0.35 : 0.25),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage('https://picsum.photos/200/200?random=2'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wireless Bluetooth Headphones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.responsiveMin(0.08).clamp(12.0, 16.0),
                          ),
                          maxLines: isCompact ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        if (!isCompact) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Premium quality sound with noise cancellation',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: data.responsiveMin(0.05).clamp(10.0, 12.0),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],

                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$129.99',
                              style: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: data.responsiveMin(0.07).clamp(14.0, 18.0),
                              ),
                            ),
                            if (showFullDetails) ...[
                              const SizedBox(width: 8),
                              Text(
                                '\$149.99',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: data.responsiveMin(0.05),
                                ),
                              ),
                            ],
                          ],
                        ),

                        if (showFullDetails) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (final index) =>
                                    Icon(Icons.star, size: 14, color: index < 4 ? Colors.orange : Colors.grey.shade300),
                              ),
                              const SizedBox(width: 4),
                              Text('4.0', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              if (showFullDetails) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ] else if (!isCompact) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('View', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade600),
                        child: const Text('Buy', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildSocialMediaPost(final bool enableConstraints, final double maxWidth, final double maxHeight) {
  return Card(
    elevation: 2,
    child: BeSizeAware(
      constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
      builder: (final data) {
        final isNarrow = data.width < 250;
        final showFullContent = data.height > 150;

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User header
              Row(
                children: [
                  CircleAvatar(
                    radius: data.responsiveMin(0.08).clamp(16.0, 24.0),
                    backgroundColor: Colors.purple.shade200,
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: data.responsiveMin(0.05),
                        color: Colors.purple.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jane Developer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: data.responsiveMin(0.06).clamp(12.0, 14.0),
                          ),
                        ),
                        if (!isNarrow)
                          Text(
                            '2 hours ago',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: data.responsiveMin(0.04).clamp(10.0, 12.0),
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    iconSize: data.responsiveMin(0.06).clamp(16.0, 20.0),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Post content
              Text(
                showFullContent
                    ? 'Just shipped a new feature using BeSizeAware! This widget makes responsive design so much easier. No more MediaQuery everywhere 🚀'
                    : 'Just shipped a new feature using BeSizeAware! 🚀',
                style: TextStyle(fontSize: data.responsiveMin(0.05).clamp(12.0, 14.0), height: 1.4),
                maxLines: showFullContent ? null : 2,
                overflow: showFullContent ? null : TextOverflow.ellipsis,
              ),

              if (showFullContent) ...[
                const SizedBox(height: 16),
                // Engagement row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildEngagementButton(Icons.favorite_border, '24', Colors.red, data),
                    _buildEngagementButton(Icons.comment_outlined, '5', Colors.blue, data),
                    _buildEngagementButton(Icons.share_outlined, '3', Colors.green, data),
                  ],
                ),
              ] else if (data.width > 200) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text('24', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    const Spacer(),
                    Text('5 comments', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildDashboardWidget(final bool enableConstraints, final double maxWidth, final double maxHeight) {
  return Card(
    elevation: 3,
    child: BeSizeAware(
      constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
      builder: (final data) {
        final showChart = data.width > 200 && data.height > 120;
        final showDetails = data.width > 250;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [Colors.indigo.shade50, Colors.indigo.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Revenue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: data.responsiveMin(0.06).clamp(14.0, 16.0),
                      color: Colors.indigo.shade700,
                    ),
                  ),
                  if (showDetails)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.trending_up, size: 12, color: Colors.green.shade700),
                          const SizedBox(width: 4),
                          Text(
                            '+12.5%',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                '\$24,568',
                style: TextStyle(
                  fontSize: data.responsiveMin(0.12).clamp(20.0, 28.0),
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade800,
                ),
              ),

              if (showDetails) ...[
                Text(
                  'This month',
                  style: TextStyle(color: Colors.indigo.shade600, fontSize: data.responsiveMin(0.04).clamp(10.0, 12.0)),
                ),
              ],

              if (showChart) ...[
                const SizedBox(height: 16),
                Expanded(child: CustomPaint(painter: _DashboardChartPainter(), size: Size.infinite)),
              ],
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildChatMessage(final bool enableConstraints, final double maxWidth, final double maxHeight) {
  return BeSizeAware(
    constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
    builder: (final data) {
      final isNarrow = data.width < 200;
      final maxBubbleWidth = data.width * 0.7;

      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Received message
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: isNarrow ? 12 : 16,
                  backgroundColor: Colors.orange.shade200,
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isNarrow ? 12 : 14,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: maxBubbleWidth),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey! How\'s the new BeSizeAware widget working for you?',
                          style: TextStyle(fontSize: data.responsiveMin(0.06).clamp(12.0, 14.0)),
                        ),
                        if (!isNarrow) ...[
                          const SizedBox(height: 4),
                          Text('2:34 PM', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Sent message
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: maxBubbleWidth),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'It\'s amazing! Perfect for responsive cards and layouts 🎉',
                          style: TextStyle(color: Colors.white, fontSize: data.responsiveMin(0.06).clamp(12.0, 14.0)),
                        ),
                        if (!isNarrow) ...[
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('2:35 PM', style: TextStyle(fontSize: 10, color: Colors.blue.shade200)),
                              const SizedBox(width: 4),
                              Icon(Icons.done_all, size: 12, color: Colors.blue.shade200),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: isNarrow ? 12 : 16,
                  backgroundColor: Colors.blue.shade200,
                  child: Text(
                    'Y',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isNarrow ? 12 : 14,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildMediaPlayerControls(final bool enableConstraints, final double maxWidth, final double maxHeight) {
  return Card(
    elevation: 4,
    child: BeSizeAware(
      constraints: enableConstraints ? BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight) : null,
      builder: (final data) {
        final isCompact = data.width < 300;
        final showProgress = data.height > 100;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [Colors.grey.shade900, Colors.grey.shade800],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              if (!isCompact) ...[
                // Track info
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: const DecorationImage(
                          image: NetworkImage('https://picsum.photos/100/100?random=3'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Development Beats',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: data.responsiveMin(0.05).clamp(12.0, 14.0),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Code Music Studio',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: data.responsiveMin(0.04).clamp(10.0, 12.0),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                      iconSize: data.responsiveMin(0.06).clamp(16.0, 20.0),
                    ),
                  ],
                ),

                if (showProgress) ...[
                  const SizedBox(height: 16),
                  // Progress bar
                  Column(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(2)),
                        child: FractionallySizedBox(
                          widthFactor: 0.35,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1:23', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                          Text('3:45', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 16),
              ],

              // Control buttons
              Row(
                mainAxisAlignment: isCompact ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                children: [
                  if (!isCompact) ...[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shuffle, color: Colors.white),
                      iconSize: data.responsiveMin(0.08).clamp(20.0, 24.0),
                    ),
                    const SizedBox(width: 20),
                  ],

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    iconSize: data.responsiveMin(0.1).clamp(24.0, 32.0),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      iconSize: data.responsiveMin(0.12).clamp(28.0, 36.0),
                    ),
                  ),

                  const SizedBox(width: 12),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    iconSize: data.responsiveMin(0.1).clamp(24.0, 32.0),
                  ),

                  if (!isCompact) ...[
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.repeat, color: Colors.white),
                      iconSize: data.responsiveMin(0.08).clamp(20.0, 24.0),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildEngagementButton(final IconData icon, final String count, final Color color, final dynamic data) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: (data.responsiveMin(0.06) as double).clamp(16.0, 20.0), color: color),
          const SizedBox(width: 4),
          Text(
            count,
            style: TextStyle(
              color: color,
              fontSize: (data.responsiveMin(0.05) as double).clamp(12.0, 14.0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

class _DashboardChartPainter extends CustomPainter {
  @override
  void paint(final Canvas canvas, final Size size) {
    final paint =
        Paint()
          ..color = Colors.indigo.shade400
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final fillPaint =
        Paint()
          ..color = Colors.indigo.withOpacity(0.1)
          ..style = PaintingStyle.fill;

    final data = [0.3, 0.6, 0.4, 0.8, 0.5, 0.9, 0.7];
    final stepX = size.width / (data.length - 1);

    final path = Path();
    final fillPath = Path()..moveTo(0, size.height);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height * 0.8);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath
      ..lineTo(size.width, size.height)
      ..close();

    canvas
      ..drawPath(fillPath, fillPaint)
      ..drawPath(path, paint);

    // Draw data points
    final pointPaint =
        Paint()
          ..color = Colors.indigo.shade600
          ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = size.height - (data[i] * size.height * 0.8);
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
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
    final fillPath =
        Path()
          // Start from bottom left for fill
          ..moveTo(0, size.height);

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
    fillPath
      ..lineTo(size.width, size.height)
      ..close();

    // Draw fill first, then stroke
    canvas
      ..drawPath(fillPath, fillPaint)
      ..drawPath(path, paint);

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
