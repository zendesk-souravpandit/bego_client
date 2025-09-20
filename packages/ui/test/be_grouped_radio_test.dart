import 'package:beui/src/widgets/form/be_form_builder_field_option.dart';
import 'package:beui/src/widgets/form/group/be_grouped_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BeGroupedRadio renders and selects', (final WidgetTester tester) async {
    int? selected;
    final options = [
      const BeFormBuilderFieldOption<int>(value: 1, child: Text('One')),
      const BeFormBuilderFieldOption<int>(value: 2, child: Text('Two')),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BeGroupedRadio<int>(options: options, value: selected, onChanged: (final v) => selected = v),
        ),
      ),
    );
    expect(find.text('One'), findsOneWidget);
    expect(find.text('Two'), findsOneWidget);
    await tester.tap(find.text('Two'));
    await tester.pump();
    expect(selected, 2);
  });
}
