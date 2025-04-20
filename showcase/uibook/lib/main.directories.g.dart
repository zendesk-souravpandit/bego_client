// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:uibook/decoration/use_case_be_boxdecoration.dart' as _i2;
import 'package:uibook/decoration/use_case_be_icon_shape_decoration.dart'
    as _i3;
import 'package:uibook/widgets/buttons/use_case_button.dart' as _i9;
import 'package:uibook/widgets/buttons/use_case_icon_text_button.dart' as _i7;
import 'package:uibook/widgets/common/use_case_tappable.dart' as _i6;
import 'package:uibook/widgets/icons/use_case_icons.dart' as _i8;
import 'package:uibook/widgets/multichild/use_case_be_badge.dart' as _i4;
import 'package:uibook/widgets/overlay/use_case_notification.dart' as _i11;
import 'package:uibook/widgets/overlay/use_case_popover.dart' as _i12;
import 'package:uibook/widgets/text/use_case_text_input.dart' as _i10;
import 'package:uibook/widgets/text/use_case_typography.dart' as _i13;
import 'package:uibook/widgets/use_case_theme.dart' as _i5;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'decoration',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BeBoxDecoration',
        useCase: _i1.WidgetbookUseCase(
          name: 'Decoration',
          builder: _i2.useCaseBeBoxDecoration,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'BeIconShapeBorder',
        useCase: _i1.WidgetbookUseCase(
          name: 'BeIconShapeBorder',
          builder: _i3.useCaseBeIcon,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'multi-child',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BeBadge',
        useCase: _i1.WidgetbookUseCase(
          name: 'Multi Child',
          builder: _i4.renderBeBadgeWidget,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'theme',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'MaterialApp',
        useCase: _i1.WidgetbookUseCase(
          name: 'Theme',
          builder: _i5.redContainerUseCase,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'utils',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BeTappable',
        useCase: _i1.WidgetbookUseCase(
          name: 'BeTapable',
          builder: _i6.useCaseTappableAnimation,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widget',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'BeIconTextButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icon button',
          builder: _i7.createDefaultStyle,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'BeIcons',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icons',
          builder: _i8.useCaseBeIconsList,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ElevatedButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Buttons',
          builder: _i9.useCaseButtons,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TextField',
        useCase: _i1.WidgetbookUseCase(
          name: 'App Theme',
          builder: _i10.textFieldUseCase,
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'overlay',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeNotificationsProvider',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeNotificationProvider',
              builder: _i11.useCaseBeNotificationProvider,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BePopover',
            useCase: _i1.WidgetbookUseCase(
              name: 'BePopover',
              builder: _i12.useCasePopover,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'text',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeText',
            useCase: _i1.WidgetbookUseCase(
              name: 'Typography',
              builder: _i13.displayTypographyUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
