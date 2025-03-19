// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:uibook/widgets/icons/use_case_icons.dart' as _i2;
import 'package:uibook/widgets/text/use_case_typography.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'icon',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BeIcons',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icons List',
          builder: _i2.redContainerUseCase,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'text',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeText',
            useCase: _i1.WidgetbookUseCase(
              name: 'Typography',
              builder: _i3.displayTypographyUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
