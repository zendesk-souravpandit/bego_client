import 'package:flutter/material.dart';

class ColorSchemeDisplay extends StatelessWidget {
  const ColorSchemeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final colorEntries = <MapEntry<String, Color>>[
      MapEntry('Primary', scheme.primary),
      MapEntry('onPrimary', scheme.onPrimary),
      MapEntry('Primary Container', scheme.primaryContainer),
      MapEntry('onPrimary Container', scheme.onPrimaryContainer),

      MapEntry('Secondary', scheme.secondary),
      MapEntry('onSecondary', scheme.onSecondary),
      MapEntry('Secondary Container', scheme.secondaryContainer),
      MapEntry('onSecondary Container', scheme.onSecondaryContainer),

      MapEntry('Tertiary', scheme.tertiary),
      MapEntry('onTertiary', scheme.onTertiary),
      MapEntry('Tertiary Container', scheme.tertiaryContainer),
      MapEntry('onTertiary Container', scheme.onTertiaryContainer),

      MapEntry('Error', scheme.error),
      MapEntry('onError', scheme.onError),
      MapEntry('Error Container', scheme.errorContainer),
      MapEntry('onError Container', scheme.onErrorContainer),

      MapEntry('Background', scheme.surface),
      MapEntry('onBackground', scheme.onSurface),

      MapEntry('Surface', scheme.surface),
      MapEntry('onSurface', scheme.onSurface),
      MapEntry('Surface Variant', scheme.surfaceContainerHighest),
      MapEntry('onSurface Variant', scheme.onSurfaceVariant),

      MapEntry('Outline', scheme.outline),
      MapEntry('Shadow', scheme.shadow),

      MapEntry('Inverse Surface', scheme.inverseSurface),
      MapEntry('onInverse Surface', scheme.onInverseSurface),
      MapEntry('Inverse Primary', scheme.inversePrimary),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('ColorScheme Viewer')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: colorEntries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final entry = colorEntries[index];
          final textColor =
              ThemeData.estimateBrightnessForColor(entry.value) ==
                      Brightness.dark
                  ? Colors.white
                  : Colors.black;

          return Container(
            decoration: BoxDecoration(
              color: entry.value,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                entry.key,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
