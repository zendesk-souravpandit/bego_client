import 'package:beui/animations.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'OpenContainer', path: 'widget/animations', type: OpenContainer)
Widget useCaseOpenContainer(final BuildContext context) {
  final closedColor = context.knobs.colorOrNull(label: 'Closed Color') ?? Colors.white;
  final openColor = context.knobs.colorOrNull(label: 'Open Color') ?? Colors.white;
  final middleColor = context.knobs.colorOrNull(label: 'Middle Color');

  final closedElevation = context.knobs.double.slider(
    label: 'Closed Elevation',
    initialValue: 1.0,
    min: 0.0,
    max: 24.0,
  );

  final openElevation = context.knobs.double.slider(label: 'Open Elevation', initialValue: 4.0, min: 0.0, max: 24.0);

  final tappable = context.knobs.boolean(label: 'Tappable', initialValue: true);

  final transitionType = context.knobs.object.dropdown(
    label: 'Transition Type',
    options: ContainerTransitionType.values,
    initialOption: ContainerTransitionType.fade,
  );

  final transitionDuration = context.knobs.double.slider(
    label: 'Transition Duration (ms)',
    initialValue: 300.0,
    min: 100.0,
    max: 1000.0,
  );

  final closedBorderRadius = context.knobs.double.slider(
    label: 'Closed Border Radius',
    initialValue: 4.0,
    min: 0.0,
    max: 32.0,
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text('OpenContainer Examples'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('OpenContainer Animation Widget:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Tap containers to see smooth opening animations', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),

          const Text('Card Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Simple Card Example
          OpenContainer<String>(
            closedColor: closedColor,
            openColor: openColor,
            middleColor: middleColor,
            closedElevation: closedElevation,
            openElevation: openElevation,
            tappable: tappable,
            transitionType: transitionType,
            transitionDuration: Duration(milliseconds: transitionDuration.round()),
            closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(closedBorderRadius))),
            onClosed: (final result) {
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Returned: $result')));
              }
            },
            closedBuilder: (final context, final action) {
              return Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.article, color: Colors.blue.shade600, size: 32),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Simple Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text('Tap to expand', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('This is a basic example of an expanding container with content.'),
                  ],
                ),
              );
            },
            openBuilder: (final context, final action) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Simple Card Details'),
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => action(returnValue: 'simple_card_closed'),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.article, color: Colors.blue.shade600, size: 64),
                      const SizedBox(height: 24),
                      const Text('Simple Card Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      const Text(
                        'This is the expanded view of the simple card. The OpenContainer widget provides '
                        'smooth animations between the closed and open states.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      const Text('Features:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      const Text('• Smooth shape morphing animation'),
                      const Text('• Configurable colors and elevation'),
                      const Text('• Fade or fade-through transitions'),
                      const Text('• Customizable duration'),
                      const Text('• Return value support'),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => action(returnValue: 'button_pressed'),
                          child: const Text('Close with Return Value'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Product Card Example
          OpenContainer<Map<String, dynamic>>(
            closedColor: closedColor,
            openColor: openColor,
            middleColor: middleColor,
            closedElevation: closedElevation,
            openElevation: openElevation,
            tappable: tappable,
            transitionType: transitionType,
            transitionDuration: Duration(milliseconds: transitionDuration.round()),
            closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(closedBorderRadius))),
            onClosed: (final result) {
              if (result != null && result['action'] != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Action: ${result['action']}')));
              }
            },
            closedBuilder: (final context, final action) {
              return Container(
                width: double.infinity,
                height: 140,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.purple.shade100, borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.headphones, size: 40, color: Colors.purple.shade700),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Wireless Headphones', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Premium Audio Quality', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 8),
                          Text(
                            '\$199.99',
                            style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          Text('⭐ 4.8 (320 reviews)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
                  ],
                ),
              );
            },
            openBuilder: (final context, final action) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Product Details'),
                  leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: action),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () => action(returnValue: {'action': 'favorite_added'}),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () => action(returnValue: {'action': 'shared'}),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Icons.headphones, size: 100, color: Colors.purple.shade700),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text('Wireless Headphones', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Premium Audio Quality', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text(
                            '\$199.99',
                            style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '20% OFF',
                              style: TextStyle(color: Colors.red.shade700, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('⭐ 4.8 (320 reviews)', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 24),
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      const Text(
                        'Experience premium audio quality with these wireless headphones. '
                        'Featuring active noise cancellation, 30-hour battery life, and '
                        'comfortable over-ear design perfect for long listening sessions.',
                      ),
                      const SizedBox(height: 24),
                      const Text('Features', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      const Text('🎵 Premium Audio Drivers'),
                      const Text('🔇 Active Noise Cancellation'),
                      const Text('🔋 30-hour Battery Life'),
                      const Text('📱 Bluetooth 5.0'),
                      const Text('🎙️ Built-in Microphone'),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => action(returnValue: {'action': 'added_to_cart'}),
                              icon: const Icon(Icons.shopping_cart),
                              label: const Text('Add to Cart'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => action(returnValue: {'action': 'buy_now'}),
                              child: const Text('Buy Now'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Photo Grid Example
          const Text('Grid Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: 4,
            itemBuilder: (final context, final index) {
              final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
              final icons = [Icons.photo, Icons.video_library, Icons.music_note, Icons.folder];
              final titles = ['Photos', 'Videos', 'Music', 'Documents'];

              return OpenContainer<int>(
                closedColor: colors[index].shade50,
                openColor: openColor,
                middleColor: middleColor,
                closedElevation: closedElevation,
                openElevation: openElevation,
                tappable: tappable,
                transitionType: transitionType,
                transitionDuration: Duration(milliseconds: transitionDuration.round()),
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(closedBorderRadius)),
                ),
                onClosed: (final result) {
                  if (result != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('${titles[index]} item $result selected')));
                  }
                },
                closedBuilder: (final context, final action) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index], size: 48, color: colors[index].shade700),
                        const SizedBox(height: 12),
                        Text(
                          titles[index],
                          style: TextStyle(fontWeight: FontWeight.bold, color: colors[index].shade700),
                        ),
                        Text('${(index + 1) * 42} items', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  );
                },
                openBuilder: (final context, final action) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(titles[index]),
                      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: action),
                    ),
                    body: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: (index + 1) * 42,
                      itemBuilder: (final context, final itemIndex) {
                        return GestureDetector(
                          onTap: () => action(returnValue: itemIndex + 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colors[index].shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(icons[index], color: colors[index].shade600),
                                const SizedBox(height: 4),
                                Text('${itemIndex + 1}', style: TextStyle(fontSize: 12, color: colors[index].shade700)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue.shade600),
                    const SizedBox(width: 8),
                    const Text('OpenContainer Features', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('• Smooth container-to-page transitions'),
                const Text('• Configurable colors, elevation, and shapes'),
                const Text('• Fade and fade-through transition types'),
                const Text('• Return value support for closed callback'),
                const Text('• Customizable animation duration'),
                const Text('• Optional tap-to-open functionality'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
