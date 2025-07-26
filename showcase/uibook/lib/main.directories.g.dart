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
import 'package:uibook/widgets/animations/use_case_open_container.dart' as _i11;
import 'package:uibook/widgets/buttons/use_case_button.dart' as _i9;
import 'package:uibook/widgets/buttons/use_case_icon_text_button.dart' as _i7;
import 'package:uibook/widgets/common/use_case_be_disable_wrapper.dart' as _i12;
import 'package:uibook/widgets/common/use_case_tappable.dart' as _i6;
import 'package:uibook/widgets/form/use_case_be_form_field.dart' as _i13;
import 'package:uibook/widgets/form/use_case_be_item_selector.dart' as _i14;
import 'package:uibook/widgets/foundation/use_case_be_bounce_tap.dart' as _i15;
import 'package:uibook/widgets/foundation/use_case_be_tappable.dart' as _i16;
import 'package:uibook/widgets/icons/use_case_be_icons.dart' as _i17;
import 'package:uibook/widgets/icons/use_case_icons.dart' as _i8;
import 'package:uibook/widgets/layout/use_case_be_grid_view.dart' as _i18;
import 'package:uibook/widgets/layout/use_case_be_responsive_widget.dart'
    as _i19;
import 'package:uibook/widgets/loading/use_case_be_skeleton.dart' as _i20;
import 'package:uibook/widgets/multichild/use_case_be_badge.dart' as _i4;
import 'package:uibook/widgets/multichild/use_case_be_label.dart' as _i21;
import 'package:uibook/widgets/overlay/use_case_be_popover.dart' as _i23;
import 'package:uibook/widgets/overlay/use_case_be_responsive_dialog.dart'
    as _i25;
import 'package:uibook/widgets/overlay/use_case_notification.dart' as _i22;
import 'package:uibook/widgets/overlay/use_case_popover.dart' as _i24;
import 'package:uibook/widgets/text/use_case_be_text.dart' as _i27;
import 'package:uibook/widgets/text/use_case_be_text_comprehensive.dart'
    as _i26;
import 'package:uibook/widgets/text/use_case_be_text_tagged.dart' as _i29;
import 'package:uibook/widgets/text/use_case_text_input.dart' as _i10;
import 'package:uibook/widgets/text/use_case_typography.dart' as _i28;
import 'package:uibook/widgets/use_case_theme.dart' as _i5;
import 'package:uibook/widgets/utils/use_case_be_color_utils.dart' as _i30;
import 'package:uibook/widgets/utils/use_case_be_responsive_visibility.dart'
    as _i31;
import 'package:uibook/widgets/utils/use_case_color_extension.dart' as _i32;
import 'package:uibook/widgets/utils/use_case_custom_color.dart' as _i33;
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
          name: 'BeTappable',
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
        name: 'animations',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'OpenContainer',
            useCase: _i1.WidgetbookUseCase(
              name: 'OpenContainer',
              builder: _i11.useCaseOpenContainer,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'common',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeDisableWrapper',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeDisableWrapper',
              builder: _i12.useCaseBeDisableWrapper,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'form',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeFormField',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeFormField',
              builder: _i13.useCaseBeFormField,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BeItemSelector',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeItemSelector',
              builder: _i14.useCaseBeItemSelector,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'foundation',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeBounceTap',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeBounceTap',
              builder: _i15.useCaseBeBounceTap,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BeTappable',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeTappable',
              builder: _i16.useCaseBeTappable,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'icons',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'Widget',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeIcons',
              builder: _i17.useCaseBeIcons,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'layout',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeGridView',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeGridView',
              builder: _i18.useCaseBeGridView,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BeResponsiveWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeResponsiveWidget',
              builder: _i19.useCaseBeResponsiveWidget,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'loading',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeSkeleton',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeSkeleton',
              builder: _i20.useCaseBeSkeleton,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'multichild',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeLabel',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeLabel',
              builder: _i21.useCaseBeLabel,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'overlay',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeNotificationsProvider',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeNotificationProvider',
              builder: _i22.useCaseBeNotificationProvider,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'BePopover',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'BePopover',
                builder: _i23.useCaseBePopover,
              ),
              _i1.WidgetbookUseCase(
                name: 'BePopover UI',
                builder: _i24.useCasePopover,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Widget',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeResponsiveDialog',
              builder: _i25.useCaseBeResponsiveDialog,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'text',
        children: [
          _i1.WidgetbookComponent(
            name: 'BeText',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'BeText - Custom Styling',
                builder: _i26.beTextCustomStylingUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'BeText - Practical Examples',
                builder: _i26.beTextPracticalUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'BeText - Typography Showcase',
                builder: _i26.beTextTypographyUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'BeText Variants',
                builder: _i27.useCaseBeText,
              ),
              _i1.WidgetbookUseCase(
                name: 'Typography',
                builder: _i28.displayTypographyUseCase,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BeTextTagged',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeTextTagged',
              builder: _i29.useCaseBeTextTagged,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'utils',
        children: [
          _i1.WidgetbookComponent(
            name: 'BeColorUtils',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'BeColorUtils - Color Harmonization & Blending',
                builder: _i30.colorHarmonizationUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'BeColorUtils - Color Swatch Generation',
                builder: _i30.colorSwatchUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'BeColorUtils - Random Colors & Utilities',
                builder: _i30.colorUtilitiesUseCase,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'BeResponsiveVisibility',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeResponsiveVisibility',
              builder: _i31.useCaseBeResponsiveVisibility,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'Color',
            useCase: _i1.WidgetbookUseCase(
              name: 'Color Extensions - Blend Methods',
              builder: _i32.colorExtensionUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'CustomColor',
            useCase: _i1.WidgetbookUseCase(
              name: 'CustomColor - Theme Integration',
              builder: _i33.customColorUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
