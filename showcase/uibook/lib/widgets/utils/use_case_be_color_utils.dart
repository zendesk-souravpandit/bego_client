import 'package:beui/utils.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeColorUtils - Color Swatch Generation', path: 'widget/utils', type: BeColorUtils)
Widget colorSwatchUseCase(final BuildContext context) {
  final baseColor = context.knobs.color(label: 'Base Color', initialValue: Colors.blue);
  final isDarkMode = context.knobs.boolean(label: 'Dark Mode', initialValue: false);

  return Scaffold(
    appBar: AppBar(
      title: const Text('Color Swatch Generation'),
      backgroundColor: baseColor,
      foregroundColor: ThemeData.estimateBrightnessForColor(baseColor) == Brightness.dark ? Colors.white : Colors.black,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Material Color Swatch',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Generated MaterialColor from base color with different shade levels',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          // Material Color Swatch
          _buildMaterialColorSwatchDemo(baseColor, isDarkMode),

          const SizedBox(height: 32),

          Text(
            'Individual Color Swatch Levels',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Create specific shade levels using ColorSwatchLevel enum',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          // Individual Color Levels
          _buildColorSwatchLevelsDemo(baseColor, isDarkMode),

          const SizedBox(height: 32),

          Text(
            'Tonal Palette',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Material Design 3 tonal palette with numbered stops',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          // Tonal Palette
          _buildTonalPaletteDemo(baseColor, isDarkMode),
        ],
      ),
    ),
  );
}

Widget _buildMaterialColorSwatchDemo(final Color baseColor, final bool isDarkMode) {
  final materialColor = BeColorUtils.createColorSwatch(baseColor, isDarkMode: isDarkMode);
  final shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette, color: baseColor),
              const SizedBox(width: 8),
              const Text('MaterialColor Shades', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                shades.map((final shade) {
                  final color = materialColor[shade]!;
                  final textColor =
                      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

                  return Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$shade', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(
                          '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                          style: TextStyle(color: textColor, fontSize: 8),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    ),
  );
}

Widget _buildColorSwatchLevelsDemo(final Color baseColor, final bool isDarkMode) {
  const levels = ColorSwatchLevel.values;

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune, color: baseColor),
              const SizedBox(width: 8),
              const Text('ColorSwatchLevel Examples', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                levels.map((final level) {
                  final color = BeColorUtils.createColorSwatchLevel(baseColor, level: level, isDarkMode: isDarkMode);
                  final textColor =
                      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

                  return Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(level.name, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 10)),
                        Text(
                          '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                          style: TextStyle(color: textColor, fontSize: 8),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTonalPaletteDemo(final Color baseColor, final bool isDarkMode) {
  final tonalPalette = BeColorUtils.tonalPalette(baseColor, isDark: isDarkMode);
  final keys = tonalPalette.keys.toList()..sort();

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.gradient, color: baseColor),
              const SizedBox(width: 8),
              const Text('Tonal Palette (Material Design 3)', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children:
                keys.map((final key) {
                  final color = tonalPalette[key]!;
                  final textColor =
                      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

                  return Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$key', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 11)),
                        Text(
                          '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}',
                          style: TextStyle(color: textColor, fontSize: 7),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'BeColorUtils - Color Harmonization & Blending', path: 'widget/utils', type: BeColorUtils)
Widget colorHarmonizationUseCase(final BuildContext context) {
  final sourceColor = context.knobs.color(label: 'Source Color', initialValue: Colors.blue);
  final targetColor = context.knobs.color(label: 'Target Color', initialValue: Colors.red);
  final blendAmount = context.knobs.double.slider(label: 'Blend Amount %', initialValue: 10, max: 100, min: 0).round();
  final alphaBlend = context.knobs.double.slider(label: 'Alpha Blend', initialValue: 26, max: 255, min: 0).round();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Color Harmonization & Blending'),
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
            'Color Harmonization',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Harmonize colors using Material Design 3 color harmonization algorithm',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildHarmonizationDemo(sourceColor, targetColor),

          const SizedBox(height: 32),

          Text(
            'Color Blending',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Blend colors with different amounts and alpha values',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildBlendingDemo(sourceColor, targetColor, blendAmount, alphaBlend),

          const SizedBox(height: 32),

          Text(
            'Custom Color with Harmonization',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstrate CustomColor class with optional harmonization',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildCustomColorDemo(sourceColor, targetColor),
        ],
      ),
    ),
  );
}

Widget _buildHarmonizationDemo(final Color sourceColor, final Color targetColor) {
  final harmonizedColor = BeColorUtils.harmonize(targetColor, sourceColor);

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
              const Text('Harmonization Result', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildColorCard('Source Color', sourceColor)),
              const SizedBox(width: 8),
              const Icon(Icons.add),
              const SizedBox(width: 8),
              Expanded(child: _buildColorCard('Target Color', targetColor)),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 8),
              Expanded(child: _buildColorCard('Harmonized', harmonizedColor)),
            ],
          ),
          const SizedBox(height: 16),
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
                const Text('Code Example:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  'BeColorUtils.harmonize(targetColor, sourceColor)',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.blue.shade700, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBlendingDemo(
  final Color sourceColor,
  final Color targetColor,
  final int blendAmount,
  final int alphaBlend,
) {
  final percentBlended = sourceColor.blend(targetColor, blendAmount);
  final alphaBlended = sourceColor.blendAlpha(targetColor, alphaBlend);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.blender, color: sourceColor),
              const SizedBox(width: 8),
              const Text('Color Blending Results', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          // Percent Blending
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Percent Blending ($blendAmount%)', style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _buildColorCard('Original', sourceColor)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildColorCard('$blendAmount% Blended', percentBlended)),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'sourceColor.blend(targetColor, $blendAmount)',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.blue.shade700, fontSize: 11),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Alpha Blending
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alpha Blending (α=$alphaBlend)', style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _buildColorCard('Original', sourceColor)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildColorCard('Alpha Blended', alphaBlended)),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'sourceColor.blendAlpha(targetColor, $alphaBlend)',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.green.shade700, fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildCustomColorDemo(final Color sourceColor, final Color targetColor) {
  final customColorWithBlend = CustomColor(name: 'Primary Accent', color: targetColor, blend: true);
  final customColorWithoutBlend = CustomColor(name: 'Primary Accent', color: targetColor, blend: false);

  final resultWithBlend = customColorWithBlend.value(sourceColor);
  final resultWithoutBlend = customColorWithoutBlend.value(sourceColor);

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.format_paint, color: sourceColor),
              const SizedBox(width: 8),
              const Text('CustomColor Class', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('With Blend = true', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    _buildColorCard('Harmonized Result', resultWithBlend),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const Text('With Blend = false', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    _buildColorCard('Original Color', resultWithoutBlend),
                  ],
                ),
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
                const Text('Usage:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  'final custom = CustomColor(\n'
                  '  name: "Primary Accent",\n'
                  '  color: Colors.red,\n'
                  '  blend: true, // Will harmonize with source\n'
                  ');\n'
                  'final result = custom.value(sourceColor);',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.amber.shade800, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
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

@widgetbook.UseCase(name: 'BeColorUtils - Random Colors & Utilities', path: 'widget/utils', type: BeColorUtils)
Widget colorUtilitiesUseCase(final BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Color Utilities'),
      backgroundColor: BeColorUtils.randomColor(),
      foregroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Random Color Generation',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Generate truly random opaque colors',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildRandomColorDemo(),

          const SizedBox(height: 32),

          Text(
            'Color Scheme Generation',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Generate ColorScheme from seed colors',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildColorSchemeDemo(),

          const SizedBox(height: 32),

          Text(
            'Utility Functions',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of various utility functions',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          _buildUtilityFunctionsDemo(),
        ],
      ),
    ),
  );
}

Widget _buildRandomColorDemo() {
  return StatefulBuilder(
    builder: (final context, final setState) {
      List<Color> randomColors = List.generate(12, (final index) => BeColorUtils.randomColor());

      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shuffle, color: randomColors.first),
                      const SizedBox(width: 8),
                      const Text('Random Colors', style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        randomColors = List.generate(12, (final index) => BeColorUtils.randomColor());
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Generate New'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: randomColors.length,
                itemBuilder: (final context, final index) {
                  final color = randomColors[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}',
                        style: TextStyle(
                          color:
                              ThemeData.estimateBrightnessForColor(color) == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'BeColorUtils.randomColor()',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.blue.shade700, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildColorSchemeDemo() {
  final sourceColors = [Colors.blue, Colors.red, Colors.green, Colors.purple, Colors.orange];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.color_lens, color: Colors.blue),
              SizedBox(width: 8),
              Text('ColorScheme Generation', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          ...sourceColors.map((final sourceColor) {
            final lightScheme = BeColorUtils.colorScheme(Brightness.light, sourceColor);
            final darkScheme = BeColorUtils.colorScheme(Brightness.dark, sourceColor);

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Source: ${_getColorName(sourceColor)}', style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: _buildColorSchemePreview('Light', lightScheme)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildColorSchemePreview('Dark', darkScheme)),
                    ],
                  ),
                ],
              ),
            );
          }),

          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(6)),
            child: Text(
              'BeColorUtils.colorScheme(Brightness.light, sourceColor)',
              style: TextStyle(fontFamily: 'monospace', color: Colors.indigo.shade700, fontSize: 11),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildColorSchemePreview(final String label, final ColorScheme scheme) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: scheme.surface,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 20,
                decoration: BoxDecoration(color: scheme.primary, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Container(
                height: 20,
                decoration: BoxDecoration(color: scheme.secondary, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Container(
                height: 20,
                decoration: BoxDecoration(color: scheme.tertiary, borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildUtilityFunctionsDemo() {
  final testColors = [
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.red.shade900,
    Colors.green.shade100,
  ];

  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.functions, color: Colors.blue),
              SizedBox(width: 8),
              Text('Utility Functions', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          ...testColors.map((final color) {
            final isLight = ThemeData.estimateBrightnessForColor(color) == Brightness.light;
            final isDark = ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
            final brightness = ThemeData.estimateBrightnessForColor(color);

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
                      style: TextStyle(
                        color: brightness == Brightness.dark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'isLight: $isLight | isDark: $isDark',
                      style: TextStyle(
                        color: brightness == Brightness.dark ? Colors.white : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.teal.shade50, borderRadius: BorderRadius.circular(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Available Methods:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(
                  '• ThemeData.estimateBrightnessForColor(color) - Get brightness\n'
                  '• BeColorUtils.sourceOrBlend(source, target) - Conditional blending',
                  style: TextStyle(fontFamily: 'monospace', color: Colors.teal.shade700, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

String _getColorName(final Color color) {
  if (color == Colors.blue) return 'Blue';
  if (color == Colors.red) return 'Red';
  if (color == Colors.green) return 'Green';
  if (color == Colors.purple) return 'Purple';
  if (color == Colors.orange) return 'Orange';
  return 'Custom';
}
