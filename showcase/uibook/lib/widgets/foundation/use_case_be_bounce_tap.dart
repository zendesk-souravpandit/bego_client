import 'package:beui/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeBounceTap', path: 'widget/foundation', type: BeBounceTap)
Widget useCaseBeBounceTap(final BuildContext context) {
  final tapIntensity = context.knobs.object.dropdown<BounceTapIntensity>(
    label: 'Tap Intensity',
    options: BounceTapIntensity.values,
    initialOption: BounceTapIntensity.weak,
  );

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeBounceTap Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Basic bounce button
          BeBounceTap(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('BeBounceTap pressed!')));
            },
            tapIntensity: tapIntensity,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withValues(alpha: 0.3 * 255), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: const Text(
                'Bounce Button',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text('Different Intensities:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Column(
            children:
                BounceTapIntensity.values
                    .map(
                      (final intensity) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: BeBounceTap(
                          onTap: () {},
                          tapIntensity: intensity,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _getColorForIntensity(intensity),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${intensity.name.toUpperCase()} Intensity',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Different Shapes:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // Circular button
              BeBounceTap(
                onTap: () {},
                tapIntensity: tapIntensity,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Icon(Icons.favorite, color: Colors.white, size: 24),
                ),
              ),

              // Card-like button
              BeBounceTap(
                onTap: () {},
                tapIntensity: tapIntensity,
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(alpha: 0.2 * 255),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.green, size: 32),
                      SizedBox(height: 4),
                      Text('Add', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

              // Pill-shaped button
              BeBounceTap(
                onTap: () {},
                tapIntensity: tapIntensity,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(25)),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'Favorite',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Color _getColorForIntensity(final BounceTapIntensity intensity) {
  switch (intensity) {
    case BounceTapIntensity.weak:
      return Colors.blue.shade300;
    case BounceTapIntensity.mid:
      return Colors.blue.shade500;
    case BounceTapIntensity.strong:
      return Colors.blue.shade700;
    case BounceTapIntensity.superStrong:
      return Colors.blue.shade900;
  }
}
