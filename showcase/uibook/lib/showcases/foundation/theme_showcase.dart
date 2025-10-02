import 'package:beui/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Color Scheme Showcase
@widgetbook.UseCase(name: 'Color Scheme', path: 'Foundation/Colors', type: ColorScheme)
Widget colorSchemeShowcase(final BuildContext context) {
  return const ColorSchemeDisplay();
}

// Tappable Components Showcase
@widgetbook.UseCase(name: 'Tappable Components', path: 'Foundation/Interactions', type: BeTappable)
Widget tappableComponentsShowcase(final BuildContext context) {
  final disabled = context.knobs.boolean(label: 'Disabled');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Regular BeTappable:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          BeTappable(
            onPress:
                disabled
                    ? null
                    : () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Regular BeTappable pressed!')));
                    },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: disabled ? Colors.grey.shade300 : Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Regular Tappable Button',
                style: TextStyle(color: disabled ? Colors.grey.shade600 : Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Animated BeTappable:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          BeTappable.animated(
            onPress:
                disabled
                    ? null
                    : () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Animated BeTappable pressed!')));
                    },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: disabled ? Colors.grey.shade300 : Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Animated Tappable Button',
                style: TextStyle(color: disabled ? Colors.grey.shade600 : Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Bounce Tap Effect:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          if (disabled)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Bounce Tap Button (Disabled)',
                style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              ),
            )
          else
            BeBounceTap(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bounce Tap pressed!')));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Bounce Tap Button',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

// Helper widgets
class ColorSchemeDisplay extends StatelessWidget {
  const ColorSchemeDisplay({super.key});

  @override
  Widget build(final BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colorEntries = <MapEntry<String, Color>>[
      MapEntry('brightness', scheme.brightness == Brightness.dark ? Colors.black : Colors.white),
      MapEntry('primary', scheme.primary),
      MapEntry('onPrimary', scheme.onPrimary),
      MapEntry('primaryContainer', scheme.primaryContainer),
      MapEntry('onPrimaryContainer', scheme.onPrimaryContainer),
      MapEntry('secondary', scheme.secondary),
      MapEntry('onSecondary', scheme.onSecondary),
      MapEntry('secondaryContainer', scheme.secondaryContainer),
      MapEntry('onSecondaryContainer', scheme.onSecondaryContainer),
      MapEntry('tertiary', scheme.tertiary),
      MapEntry('onTertiary', scheme.onTertiary),
      MapEntry('tertiaryContainer', scheme.tertiaryContainer),
      MapEntry('onTertiaryContainer', scheme.onTertiaryContainer),
      MapEntry('error', scheme.error),
      MapEntry('onError', scheme.onError),
      MapEntry('errorContainer', scheme.errorContainer),
      MapEntry('onErrorContainer', scheme.onErrorContainer),
      MapEntry('surface', scheme.surface),
      MapEntry('onSurface', scheme.onSurface),
      MapEntry('surfaceVariant', scheme.surfaceContainerHighest),
      MapEntry('onSurfaceVariant', scheme.onSurfaceVariant),
      MapEntry('outline', scheme.outline),
      MapEntry('shadow', scheme.shadow),
      MapEntry('inverseSurface', scheme.inverseSurface),
      MapEntry('onInverseSurface', scheme.onInverseSurface),
      MapEntry('inversePrimary', scheme.inversePrimary),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Material Design Color Scheme', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3,
                ),
                itemCount: colorEntries.length,
                itemBuilder: (final context, final index) {
                  final entry = colorEntries[index];
                  return _ColorTile(name: entry.key, color: entry.value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  const _ColorTile({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    final luminance = color.computeLuminance();
    final textColor = luminance > 0.5 ? Colors.black : Colors.white;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
          Text(
            '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
            style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
