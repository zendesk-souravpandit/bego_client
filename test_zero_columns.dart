import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beui/layout.dart';

void main() {
  testWidgets('BeColumn with zero columns should be hidden', (final WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BeContainer(
            child: BeRow(
              children: [
                BeColumn(
                  xs: 0, // This should be hidden
                  child: Container(
                    height: 100,
                    color: Colors.red,
                    child: const Text('Hidden'),
                  ),
                ),
                BeColumn(
                  xs: 12, // This should be visible
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: const Text('Visible'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // The widget should not crash
    await tester.pumpAndSettle();

    // Check that only the visible text is present
    expect(find.text('Visible'), findsOneWidget);
    expect(find.text('Hidden'), findsNothing);
  });

  testWidgets('BeColumn with responsive zero columns', (final WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BeContainer(
            child: BeRow(
              children: [
                BeColumn(
                  xs: 12, // Visible on mobile
                  md: 0, // Hidden on medium screens
                  child: Container(
                    height: 100,
                    color: Colors.red,
                    child: const Text('Mobile Only'),
                  ),
                ),
                BeColumn(
                  xs: 0, // Hidden on mobile
                  md: 12, // Visible on medium screens
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: const Text('Desktop Only'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Test at mobile size (600px width)
    await tester.binding.setSurfaceSize(const Size(600, 800));
    await tester.pumpAndSettle();

    // On mobile, only mobile content should be visible
    expect(find.text('Mobile Only'), findsOneWidget);
    expect(find.text('Desktop Only'), findsNothing);

    // Test at desktop size (1200px width)
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pumpAndSettle();

    // On desktop, only desktop content should be visible
    expect(find.text('Mobile Only'), findsNothing);
    expect(find.text('Desktop Only'), findsOneWidget);
  });
}
