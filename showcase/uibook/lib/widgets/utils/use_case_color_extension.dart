import 'package:beui/utils.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Color Extensions - Blend Methods', path: 'widget/utils', type: Color)
Widget colorExtensionUseCase(final BuildContext context) {
  final baseColor = context.knobs.color(label: 'Base Color', initialValue: Colors.blue.shade100);
  final blendColor = context.knobs.color(label: 'Blend Color', initialValue: Colors.red);
  final blendPercent =
      context.knobs.double.slider(label: 'Blend Percentage', initialValue: 25, max: 100, min: 0).round();
  final alphaValue = context.knobs.double.slider(label: 'Alpha Value', initialValue: 64, max: 255, min: 0).round();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Color Extension Methods'),
      backgroundColor: baseColor,
      foregroundColor: ThemeData.estimateBrightnessForColor(baseColor) == Brightness.dark ? Colors.white : Colors.black,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color Extension Methods',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Extension methods on Color class for easy blending operations',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          _buildPercentageBlendDemo(baseColor, blendColor, blendPercent),

          const SizedBox(height: 24),

          _buildAlphaBlendDemo(baseColor, blendColor, alphaValue),

          const SizedBox(height: 24),

          _buildBlendComparisonDemo(baseColor, blendColor),

          const SizedBox(height: 24),

          _buildPracticalExamples(baseColor),
        ],
      ),
    ),
  );
}

Widget _buildPercentageBlendDemo(final Color baseColor, final Color blendColor, final int blendPercent) {
  final blendedColor = baseColor.blend(blendColor, blendPercent);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.percent, color: blendColor),
              const SizedBox(width: 8),
              Text('Percentage Blend ($blendPercent%)', style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _buildColorSwatch('Base Color', baseColor)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                child: Text('+$blendPercent%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Expanded(child: _buildColorSwatch('Blend Color', blendColor)),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 8),
              Expanded(child: _buildColorSwatch('Result', blendedColor)),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Usage:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  'baseColor.blend(blendColor, $blendPercent)',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.blue.shade700, fontSize: 12),
                ),
                const SizedBox(height: 8),
                const Text('Perfect for:', style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  '• Creating surface variants\n'
                  '• Theme color variations\n'
                  '• Brand color harmonization',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildAlphaBlendDemo(final Color baseColor, final Color blendColor, final int alphaValue) {
  final alphaBlendedColor = baseColor.blendAlpha(blendColor, alphaValue);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.opacity, color: blendColor),
              const SizedBox(width: 8),
              Text('Alpha Blend (α=$alphaValue)', style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _buildColorSwatch('Base Color', baseColor)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
                child: Text('α$alphaValue', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              Expanded(child: _buildColorSwatch('Blend Color', blendColor)),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 8),
              Expanded(child: _buildColorSwatch('Result', alphaBlendedColor)),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Usage:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  'baseColor.blendAlpha(blendColor, $alphaValue)',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.green.shade700, fontSize: 12),
                ),
                const SizedBox(height: 8),
                const Text('Perfect for:', style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  '• Fine-grained color control\n'
                  '• Subtle color variations\n'
                  '• UI state overlays',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBlendComparisonDemo(final Color baseColor, final Color blendColor) {
  final blendPercentages = [10, 25, 50, 75, 90];
  final alphaValues = [26, 64, 128, 191, 230]; // Roughly equivalent alpha values

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.compare, color: blendColor),
              const SizedBox(width: 8),
              const Text('Blend Comparison', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          // Percentage blending row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Percentage Blending:', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children:
                    blendPercentages.map((final percent) {
                      final blendedColor = baseColor.blend(blendColor, percent);
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: _buildSmallColorSwatch('$percent%', blendedColor),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Alpha blending row
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Alpha Blending:', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children:
                    alphaValues.map((final alpha) {
                      final blendedColor = baseColor.blendAlpha(blendColor, alpha);
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: _buildSmallColorSwatch('α$alpha', blendedColor),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Key Differences:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  '• Percentage blend: Intuitive 0-100% scale\n'
                  '• Alpha blend: Fine control with 0-255 range\n'
                  '• Both use Color.alphaBlend internally\n'
                  '• Choose based on your use case needs',
                  style: TextStyle(color: Colors.amber.shade800, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPracticalExamples(final Color baseColor) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb, color: Colors.orange),
              SizedBox(width: 8),
              Text('Practical Examples', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          // Surface variations
          _buildPracticalExample('Surface Variations', [
            ('Primary Surface', baseColor),
            ('Hover State', baseColor.blend(Colors.white, 10)),
            ('Pressed State', baseColor.blend(Colors.black, 15)),
            ('Disabled State', baseColor.blend(Colors.grey, 40)),
          ]),

          const SizedBox(height: 16),

          // Status indicators
          _buildPracticalExample('Status Indicators', [
            ('Success', baseColor.blend(Colors.green, 30)),
            ('Warning', baseColor.blend(Colors.orange, 40)),
            ('Error', baseColor.blend(Colors.red, 35)),
            ('Info', baseColor.blend(Colors.blue, 25)),
          ]),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Common Use Cases:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  '• UI state management (hover, pressed, disabled)\n'
                  '• Creating themed color palettes\n'
                  '• Brand color harmonization\n'
                  '• Background surface variations\n'
                  '• Status and feedback indicators',
                  style: TextStyle(color: Colors.purple.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPracticalExample(final String title, final List<(String, Color)> examples) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      const SizedBox(height: 8),
      Row(
        children:
            examples.map((final example) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: _buildSmallColorSwatch(example.$1, example.$2),
                ),
              );
            }).toList(),
      ),
    ],
  );
}

Widget _buildColorSwatch(final String label, final Color color) {
  final textColor = ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
          style: TextStyle(color: textColor, fontSize: 10),
        ),
      ],
    ),
  );
}

Widget _buildSmallColorSwatch(final String label, final Color color) {
  final textColor = ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 10),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}',
          style: TextStyle(color: textColor, fontSize: 8),
        ),
      ],
    ),
  );
}
