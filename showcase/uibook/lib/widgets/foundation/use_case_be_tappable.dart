import 'package:beui/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeTappable', path: 'widget/foundation', type: BeTappable)
Widget useCaseBeTappable(final BuildContext context) {
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
          const Text('Different Shapes and Sizes:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              BeTappable.animated(
                onPress: disabled ? null : () {},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: disabled ? Colors.grey.shade300 : Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
              ),
              BeTappable.animated(
                onPress: disabled ? null : () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: disabled ? Colors.grey.shade300 : Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Pill Button',
                    style: TextStyle(
                      color: disabled ? Colors.grey.shade600 : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              BeTappable.animated(
                onPress: disabled ? null : () {},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: disabled ? Colors.grey.shade300 : Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: disabled ? Colors.grey.shade600 : Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Add Item',
                        style: TextStyle(
                          color: disabled ? Colors.grey.shade600 : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
