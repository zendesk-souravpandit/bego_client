import 'package:beui/utils.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'CustomColor - Theme Integration', path: 'widget/utils', type: CustomColor)
Widget customColorUseCase(final BuildContext context) {
  final sourceColor = context.knobs.color(label: 'Source/Brand Color', initialValue: Colors.blue);
  final customColorValue = context.knobs.color(label: 'Custom Color', initialValue: Colors.red);
  final shouldBlend = context.knobs.boolean(label: 'Enable Harmonization', initialValue: true);

  return Scaffold(
    appBar: AppBar(
      title: const Text('CustomColor Class'),
      backgroundColor: sourceColor,
      foregroundColor:
          ThemeData.estimateBrightnessForColor(sourceColor) == Brightness.dark ? Colors.white : Colors.black,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CustomColor for Theme Systems',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'A class designed for theme systems that need optional color harmonization',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          _buildCustomColorDemo(sourceColor, customColorValue, shouldBlend),

          const SizedBox(height: 24),

          _buildThemeSystemExample(sourceColor),

          const SizedBox(height: 24),

          _buildCustomColorPalette(sourceColor),

          const SizedBox(height: 24),

          _buildCodeExamples(),
        ],
      ),
    ),
  );
}

Widget _buildCustomColorDemo(final Color sourceColor, final Color customColorValue, final bool shouldBlend) {
  final customColor = CustomColor(name: 'Accent Color', color: customColorValue, blend: shouldBlend);

  final resultColor = customColor.value(sourceColor);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette, color: sourceColor),
              const SizedBox(width: 8),
              const Text('CustomColor Configuration', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          // Configuration display
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Name: ', style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('"${customColor.name}"'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Blend: ', style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(customColor.blend.toString()),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Color: ', style: TextStyle(fontWeight: FontWeight.w500)),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: customColor.color,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('#${customColor.color.toARGB32().toRadixString(16).substring(2).toUpperCase()}'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Visual result
          Row(
            children: [
              Expanded(child: _buildColorCard('Source Color\n(Brand)', sourceColor)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: shouldBlend ? Colors.green.shade100 : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  shouldBlend ? 'BLEND' : 'NO BLEND',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: shouldBlend ? Colors.green.shade700 : Colors.orange.shade700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: _buildColorCard('Custom Color\n(Input)', customColorValue)),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 12),
              Expanded(child: _buildColorCard('Result Color\n(Output)', resultColor)),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: shouldBlend ? Colors.green.shade50 : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: shouldBlend ? Colors.green.shade200 : Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shouldBlend ? 'Harmonization Enabled' : 'Harmonization Disabled',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  shouldBlend
                      ? 'The custom color is harmonized with the source color for better brand consistency.'
                      : 'The custom color is used as-is without any harmonization.',
                  style: TextStyle(color: shouldBlend ? Colors.green.shade700 : Colors.blue.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildThemeSystemExample(final Color sourceColor) {
  return Builder(
    builder: (final context) {
      final customColors = [
        const CustomColor(name: 'Success', color: Colors.green, blend: true),
        const CustomColor(name: 'Warning', color: Colors.orange, blend: true),
        const CustomColor(name: 'Error', color: Colors.red, blend: true),
        const CustomColor(name: 'Info', color: Colors.blue, blend: false),
        const CustomColor(name: 'Brand Accent', color: Colors.purple, blend: true),
        const CustomColor(name: 'Neutral', color: Colors.grey, blend: false),
      ];

      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.color_lens, color: sourceColor),
                  const SizedBox(width: 8),
                  const Text('Theme System Integration', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                'Example: Building a Design System',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                'CustomColor helps create consistent color palettes that optionally harmonize with your brand colors.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 16),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                itemCount: customColors.length,
                itemBuilder: (final context, final index) {
                  final customColor = customColors[index];
                  final resultColor = customColor.value(sourceColor);

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: resultColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                customColor.name,
                                style: TextStyle(
                                  color:
                                      ThemeData.estimateBrightnessForColor(resultColor) == Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: customColor.blend ? Colors.green : Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                customColor.blend ? 'BLEND' : 'PURE',
                                style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '#${resultColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                          style: TextStyle(
                            color:
                                ThemeData.estimateBrightnessForColor(resultColor) == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black54,
                            fontSize: 10,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCustomColorPalette(final Color sourceColor) {
  const baseCustomColor = CustomColor(name: 'Accent', color: Colors.purple, blend: true);
  final resultColor = baseCustomColor.value(sourceColor);

  // Generate variations using the result color
  final variations = [
    ('Lightest', resultColor.blend(Colors.white, 70)),
    ('Light', resultColor.blend(Colors.white, 40)),
    ('Base', resultColor),
    ('Dark', resultColor.blend(Colors.black, 30)),
    ('Darkest', resultColor.blend(Colors.black, 60)),
  ];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.gradient, color: sourceColor),
              const SizedBox(width: 8),
              const Text('Custom Color Variations', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          const Text('Create color variations from a harmonized CustomColor', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          Row(
            children:
                variations.map((final variation) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: variation.$2,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              variation.$1,
                              style: TextStyle(
                                color:
                                    ThemeData.estimateBrightnessForColor(variation.$2) == Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '#${variation.$2.toARGB32().toRadixString(16).substring(2, 8).toUpperCase()}',
                              style: TextStyle(
                                color:
                                    ThemeData.estimateBrightnessForColor(variation.$2) == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black54,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.indigo.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pro Tip:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  'Once you have a harmonized CustomColor, you can create variations using the Color extension methods (blend, blendAlpha) to build complete color systems.',
                  style: TextStyle(color: Colors.indigo.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCodeExamples() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.code, color: Colors.blue),
              SizedBox(width: 8),
              Text('Code Examples', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          _buildCodeBlock('Basic Usage', '''// Create a custom color
final accentColor = CustomColor(
  name: 'Brand Accent',
  color: Colors.purple,
  blend: true, // Will harmonize with brand color
);

// Use in theme system
final harmonizedColor = accentColor.value(brandColor);'''),

          const SizedBox(height: 16),

          _buildCodeBlock('Theme System Integration', '''// Define your custom colors
final List<CustomColor> customColors = [
  CustomColor(name: 'Success', color: Colors.green, blend: true),
  CustomColor(name: 'Warning', color: Colors.orange, blend: true),
  CustomColor(name: 'Error', color: Colors.red, blend: false),
];

// Apply them with your brand color
final Map<String, Color> themeColors = {
  for (final custom in customColors)
    custom.name.toLowerCase(): custom.value(brandColor),
};'''),

          const SizedBox(height: 16),

          _buildCodeBlock('Utility Methods', '''// Alternative ways to use
final result1 = BeColorUtils.customColor(customColor, brandColor);
final result2 = BeColorUtils.customColor(customColor, brandColor, forceBlend: true);

// Conditional blending
final smartColor = BeColorUtils.sourceOrBlend(brandColor, customColor.color);'''),
        ],
      ),
    ),
  );
}

Widget _buildCodeBlock(final String title, final String code) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
        child: Text(code, style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 11)),
      ),
    ],
  );
}

Widget _buildColorCard(final String label, final Color color) {
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
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
          style: TextStyle(color: textColor, fontSize: 9),
        ),
      ],
    ),
  );
}
