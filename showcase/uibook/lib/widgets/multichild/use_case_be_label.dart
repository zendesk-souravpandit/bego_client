import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeLabel', path: 'widget/multichild', type: BeLabel)
Widget useCaseBeLabel(final BuildContext context) {
  final labelText = context.knobs.string(label: 'Label Text', initialValue: 'NEW');
  final position = context.knobs.list<BeLabelPosition>(label: 'Position', options: BeLabelPosition.values);
  final labelColor = context.knobs.color(label: 'Label Color', initialValue: Colors.white);
  final backgroundColor = context.knobs.color(label: 'Background Color', initialValue: Colors.red);
  final childSized = context.knobs.boolean(label: 'Child Sized');
  final innerLabel = context.knobs.boolean(label: 'Inner Label');

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeLabel Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Main example with customizable properties
          Center(
            child: BeLabel(
              position: position,
              childSized: childSized,
              innerLabel: innerLabel,
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(12)),
                child: Text(labelText, style: TextStyle(color: labelColor, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade300),
                ),
                child: const Center(child: Text('Main Content', style: TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
          ),

          const SizedBox(height: 32),
          const Text('All Positions:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0,
            children:
                BeLabelPosition.values
                    .map(
                      (final pos) => BeLabel(
                        position: pos,
                        label: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getColorForPosition(pos),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            pos.name.substring(0, 3).toUpperCase(),
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image, size: 24, color: Colors.grey.shade600),
                                const SizedBox(height: 2),
                                Text(
                                  pos.name,
                                  style: TextStyle(fontSize: 8, color: Colors.grey.shade600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 32),
          const Text('Different Content Types:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // Card with text label
              BeLabel(
                position: BeLabelPosition.topRight,
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'PRO',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 32, color: Colors.amber),
                        SizedBox(height: 8),
                        Text('Premium Feature'),
                      ],
                    ),
                  ),
                ),
              ),

              // Image with count label
              BeLabel(
                position: BeLabelPosition.topLeft,
                label: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Text(
                    '12',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.photo_library, size: 40, color: Colors.blue),
                ),
              ),

              // Inner label example
              BeLabel(
                position: BeLabelPosition.bottomRight,
                innerLabel: true,
                label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
                  child: const Text(
                    'INNER',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.purple.shade300, Colors.purple.shade600]),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('With Inner Label', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

Color _getColorForPosition(final BeLabelPosition position) {
  switch (position) {
    case BeLabelPosition.topLeft:
      return Colors.red;
    case BeLabelPosition.topCenter:
      return Colors.blue;
    case BeLabelPosition.topRight:
      return Colors.green;
    case BeLabelPosition.rightTop:
      return Colors.orange;
    case BeLabelPosition.rightCenter:
      return Colors.purple;
    case BeLabelPosition.rightBottom:
      return Colors.teal;
    case BeLabelPosition.bottomRight:
      return Colors.indigo;
    case BeLabelPosition.bottomCenter:
      return Colors.pink;
    case BeLabelPosition.bottomLeft:
      return Colors.brown;
    case BeLabelPosition.leftBottom:
      return Colors.cyan;
    case BeLabelPosition.leftCenter:
      return Colors.lime;
    case BeLabelPosition.leftTop:
      return Colors.amber;
    case BeLabelPosition.center:
      return Colors.deepOrange;
  }
}
