import 'package:beui/be_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:uibook/widgets/icons/icons_list.dart';
import 'package:widgetbook/widgetbook.dart';

final List<IconDetails> exampleIcons = begoIcons.take(10).toList();
final List<AlignmentGeometry> alignments = [
  Alignment.center,
  Alignment.centerLeft,
  Alignment.centerRight,
  Alignment.topLeft,
  Alignment.topRight,
  Alignment.bottomLeft,
  Alignment.bottomRight,
];

const longText = '''
Nascetur nec convallis tempor sagittis ligula. Mauris aenean curae vestibulum 
aenean fames posuere consequat turpis. Cursus lectus rutrum dolor condimentum 
rhoncus tincidunt rutrum. Hac amet class vivamus rhoncus condimentum; penatibus 
risus magnis. Penatibus nulla venenatis nulla praesent mauris. Morbi feugiat 
rhoncus ridiculus varius faucibus commodo tincidunt ipsum molestie. Volutpat 
semper aptent viverra facilisi nam nibh suscipit purus himenaeos. Himenaeos 
quisque ultrices condimentum mauris a diam.''';

final stubDate = DateTime(2012, 4, 3);

extension KnobsBuilderExt on KnobsBuilder {
  int get widgetSizeKnob => object.dropdown(
    label: 'Size',
    options: [12, 16, 24, 32, 48, 64, 96, 128],
    labelBuilder: (final value) => value.toString(),
  );

  IconDetails beIconKnob({final String label = 'Icon'}) => object.dropdown(
    label: label,
    options: exampleIcons,
    initialOption: const IconDetails(BeIcons.icon_ychee, 'icon_ychee'),
    labelBuilder: (final value) => value.name,
  );

  IconDetails? beIconOrNullKnob({final String label = 'Icon'}) => objectOrNull.dropdown(
    label: label,
    options: exampleIcons,
    initialOption: const IconDetails(BeIcons.icon_ychee, 'icon_ychee'),
    labelBuilder: (final value) => value.name,
  );

  AlignmentGeometry alignmentKnob({final String label = 'Alignment'}) =>
      object.dropdown(label: label, options: alignments);

  bool get isEnabledKnob => boolean(label: 'Enabled', initialValue: true);
}

extension WidgetbookContext on BuildContext {
  bool get isInWidgetbookCloud => WidgetbookState.of(this).previewMode;
}
