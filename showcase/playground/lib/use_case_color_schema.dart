import 'package:flutter/material.dart';

class ColorSchemeDisplay extends StatelessWidget {
  const ColorSchemeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colorEntries = <MapEntry<String, Color>>[
      MapEntry(
        'brightness',
        scheme.brightness == Brightness.dark ? Colors.black : Colors.white,
      ),
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
      MapEntry('onBackground', scheme.onSurface),

      MapEntry('surface', scheme.surface),
      MapEntry('onSurface', scheme.onSurface),
      MapEntry('surfaceVariant', scheme.surfaceContainerHighest),
      MapEntry('onSurfaceVariant', scheme.onSurfaceVariant),

      MapEntry('outline', scheme.outline),
      MapEntry('shadow', scheme.shadow),

      MapEntry('inverseSurface', scheme.inverseSurface),
      MapEntry('onInverseSurface', scheme.onInverseSurface),
      MapEntry('inversePrimary', scheme.inversePrimary),

      MapEntry('primaryFixed', scheme.primaryFixed),
      MapEntry('primaryFixedDim', scheme.primaryFixedDim),
      MapEntry('onPrimaryFixed', scheme.onPrimaryFixed),
      MapEntry('onPrimaryFixedVariant', scheme.onPrimaryFixedVariant),

      MapEntry('secondaryFixed', scheme.secondaryFixed),
      MapEntry('secondaryFixedDim', scheme.secondaryFixedDim),
      MapEntry('onSecondaryFixed', scheme.onSecondaryFixed),
      MapEntry('onSecondaryFixedVariant', scheme.onSecondaryFixedVariant),

      MapEntry('tertiaryFixed', scheme.tertiaryFixed),
      MapEntry('tertiaryFixedDim', scheme.tertiaryFixedDim),
      MapEntry('onTertiaryFixed', scheme.onTertiaryFixed),
      MapEntry('onTertiaryFixedVariant', scheme.onTertiaryFixedVariant),

      MapEntry('surfaceDim', scheme.surfaceDim),
      MapEntry('surfaceBright', scheme.surfaceBright),
      MapEntry('surfaceContainerLowest', scheme.surfaceContainerLowest),
      MapEntry('surfaceContainerLow', scheme.surfaceContainerLow),
      MapEntry('surfaceContainer', scheme.surfaceContainer),
      MapEntry('surfaceContainerHigh', scheme.surfaceContainerHigh),
      MapEntry('surfaceContainerHighest', scheme.surfaceContainerHighest),

      MapEntry('outlineVariant', scheme.outlineVariant),
      MapEntry('scrim', scheme.scrim),
      MapEntry('surfaceTint', scheme.surfaceTint),
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
