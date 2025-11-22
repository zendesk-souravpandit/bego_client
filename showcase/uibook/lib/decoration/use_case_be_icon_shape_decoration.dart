import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:uibook/core/widgetbook/modal_option.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeIconShapeBorder Showcase', path: 'decoration', type: BeIconShapeBorder)
Widget useCaseBeIconShapeBorderShowcase(final BuildContext context) {
  final selectedDemo = context.knobs.object.dropdown(
    label: 'Demo Type',
    options: [
      const KnobOption(label: 'Alignment Gallery', value: 'alignment'),
      const KnobOption(label: 'Icon Categories', value: 'categories'),
      const KnobOption(label: 'Interactive Cards', value: 'cards'),
      const KnobOption(label: 'Border Styles', value: 'styles'),
      const KnobOption(label: 'Badge System', value: 'badges'),
      const KnobOption(label: 'Form Fields', value: 'forms'),
      const KnobOption(label: 'Interactive Playground', value: 'playground'),
    ],
    labelBuilder: (final value) => value.label,
  );

  switch (selectedDemo.value) {
    case 'alignment':
      return _buildAlignmentGallery(context);
    case 'categories':
      return _buildIconCategories(context);
    case 'cards':
      return _buildInteractiveCards(context);
    case 'styles':
      return _buildBorderStyles(context);
    case 'badges':
      return _buildBadgeSystem(context);
    case 'forms':
      return _buildFormFields(context);
    case 'playground':
      return _buildInteractivePlayground(context);
    default:
      return _buildAlignmentGallery(context);
  }
}

// Interactive Playground - Full customization
Widget _buildInteractivePlayground(final BuildContext context) {
  final selectedIcon = context.knobs.object.dropdown(
    label: 'Icon',
    options: [
      const KnobOption(label: 'File Add', value: BeIcons.icon_file_add),
      const KnobOption(label: 'Star', value: BeIcons.icon_star),
      const KnobOption(label: 'Heart', value: BeIcons.icon_heart),
      const KnobOption(label: 'Settings', value: BeIcons.icon_settings),
      const KnobOption(label: 'User', value: BeIcons.icon_user),
      const KnobOption(label: 'Bell', value: BeIcons.icon_bell),
      const KnobOption(label: 'Search', value: BeIcons.icon_search),
      const KnobOption(label: 'Edit', value: BeIcons.icon_pen),
    ],
    labelBuilder: (final value) => value.label,
  );

  final alignment = context.knobs.object.dropdown(
    label: 'Icon Alignment',
    options: [
      const KnobOption(label: 'Top Left', value: BeIconAlignment.topLeft),
      const KnobOption(label: 'Top Center', value: BeIconAlignment.topCenter),
      const KnobOption(label: 'Top Right', value: BeIconAlignment.topRight),
      const KnobOption(label: 'Center Left', value: BeIconAlignment.centerLeft),
      const KnobOption(label: 'Center', value: BeIconAlignment.center),
      const KnobOption(label: 'Center Right', value: BeIconAlignment.centerRight),
      const KnobOption(label: 'Bottom Left', value: BeIconAlignment.bottomLeft),
      const KnobOption(label: 'Bottom Center', value: BeIconAlignment.bottomCenter),
      const KnobOption(label: 'Bottom Right', value: BeIconAlignment.bottomRight),
    ],
    labelBuilder: (final value) => value.label,
  );

  final borderColor = context.knobs.object.dropdown(
    label: 'Border Color',
    options: [
      const KnobOption(label: 'Primary', value: BeColors.primary),
      const KnobOption(label: 'Blue', value: BeColors.blue),
      const KnobOption(label: 'Green', value: BeColors.green),
      const KnobOption(label: 'Orange', value: BeColors.orange),
      const KnobOption(label: 'Purple', value: BeColors.purple),
      const KnobOption(label: 'Red', value: BeColors.red),
      const KnobOption(label: 'Gray', value: BeColors.gray500),
    ],
    labelBuilder: (final value) => value.label,
  );

  final iconColor = context.knobs.object.dropdown(
    label: 'Icon Color',
    options: [
      const KnobOption(label: 'Same as Border', value: null),
      const KnobOption(label: 'Primary', value: BeColors.primary),
      const KnobOption(label: 'Blue', value: BeColors.blue),
      const KnobOption(label: 'Green', value: BeColors.green),
      const KnobOption(label: 'Orange', value: BeColors.orange),
      const KnobOption(label: 'Purple', value: BeColors.purple),
      const KnobOption(label: 'Red', value: BeColors.red),
      const KnobOption(label: 'White', value: Colors.white),
    ],
    labelBuilder: (final value) => value.label,
  );

  final iconSize = context.knobs.doubleOrNull.slider(label: 'Icon Size', min: 12, max: 48, initialValue: 24);
  final borderWidth = context.knobs.doubleOrNull.slider(label: 'Border Width', min: 1, max: 8, initialValue: 2);
  final borderRadius = context.knobs.doubleOrNull.slider(label: 'Border Radius', min: 0, max: 32, initialValue: 8);
  final iconInset = context.knobs.doubleOrNull.slider(label: 'Icon Inset', min: 0, max: 24, initialValue: 8);

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Column(
        children: [
          const BeText.headlineMedium('Interactive Playground'),
          const SizedBox(height: 8),
          const BeText.bodyMedium(
            'Experiment with different icon alignments, colors, and border properties',
            color: BeColors.gray600,
            align: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            height: 200,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: BeIconShapeBorder(
                icon: selectedIcon.value,
                size: iconSize ?? 24,
                color: borderColor.value,
                radius: borderRadius ?? 8,
                width: borderWidth ?? 2,
                alignment: alignment.value,
                iconInset: iconInset ?? 8,
                iconStyle: TextStyle(color: iconColor.value ?? borderColor.value, fontSize: iconSize ?? 24),
              ),
              shadows: [
                BoxShadow(
                  color: borderColor.value.withValues(alpha: 0.1 * 255),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(selectedIcon.value, size: 32, color: borderColor.value.withValues(alpha: 0.3 * 255)),
                  const SizedBox(height: 8),
                  const BeText.bodyMedium('Live Preview', color: BeColors.gray600),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: BeColors.gray50, borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: BeColors.blue, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: BeText.bodySmall(
                    'Use the controls above to customize the BeIconShapeBorder properties and see real-time changes',
                    color: BeColors.gray600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Alignment Gallery - Show all 9 alignment positions
Widget _buildAlignmentGallery(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Icon Alignment Gallery'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Explore all 9 alignment positions for icons on borders',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.8,
          children: [
            _buildAlignmentCard('Top Left', BeIconAlignment.topLeft, BeIcons.icon_arrow_top_left, BeColors.blue),
            _buildAlignmentCard('Top Center', BeIconAlignment.topCenter, BeIcons.icon_arrow_up, BeColors.green),
            _buildAlignmentCard('Top Right', BeIconAlignment.topRight, BeIcons.icon_arrow_top_right, BeColors.orange),
            _buildAlignmentCard('Center Left', BeIconAlignment.centerLeft, BeIcons.icon_arrow_left, BeColors.purple),
            _buildAlignmentCard('Center', BeIconAlignment.center, BeIcons.icon_circleci, BeColors.red),
            _buildAlignmentCard('Center Right', BeIconAlignment.centerRight, BeIcons.icon_arrow_right, BeColors.teal),
            _buildAlignmentCard(
              'Bottom Left',
              BeIconAlignment.bottomLeft,
              BeIcons.icon_arrow_bottom_left,
              BeColors.indigo,
            ),
            _buildAlignmentCard('Bottom Center', BeIconAlignment.bottomCenter, BeIcons.icon_arrow_down, BeColors.pink),
            _buildAlignmentCard(
              'Bottom Right',
              BeIconAlignment.bottomRight,
              BeIcons.icon_arrow_bottom_right,
              BeColors.amber,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAlignmentCard(
  final String title,
  final BeIconAlignment alignment,
  final IconData icon,
  final Color color,
) {
  return Container(
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: BeIconShapeBorder(
        icon: icon,
        size: 20,
        color: color,
        radius: 16,
        width: 2,
        alignment: alignment,
        iconInset: 12,
        iconStyle: TextStyle(color: color, fontSize: 20),
      ),
      shadows: [
        BoxShadow(
          color: color.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 4),
          blurRadius: 12,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color.withValues(alpha: 0.3 * 255), size: 32),
        const SizedBox(height: 8),
        BeText.labelMedium(title, align: TextAlign.center),
      ],
    ),
  );
}

// Icon Categories - Different icon types
Widget _buildIconCategories(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Icon Categories'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Different icon types showcased with BeIconShapeBorder',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildCategorySection('Communication', [
          const _CategoryIcon(BeIcons.icon_message, 'Message', BeColors.blue),
          const _CategoryIcon(BeIcons.icon_phone, 'Phone', BeColors.green),
          const _CategoryIcon(BeIcons.icon_mail, 'Email', BeColors.orange),
          const _CategoryIcon(BeIcons.icon_play_button_r, 'Video', BeColors.purple),
        ]),
        const SizedBox(height: 24),
        _buildCategorySection('Actions', [
          const _CategoryIcon(BeIcons.icon_pen, 'Edit', BeColors.blue),
          const _CategoryIcon(BeIcons.icon_trash, 'Delete', BeColors.red),
          const _CategoryIcon(BeIcons.icon_software_download, 'Download', BeColors.green),
          const _CategoryIcon(BeIcons.icon_share, 'Share', BeColors.purple),
        ]),
        const SizedBox(height: 24),
        _buildCategorySection('Navigation', [
          const _CategoryIcon(BeIcons.icon_home, 'Home', BeColors.blue),
          const _CategoryIcon(BeIcons.icon_search, 'Search', BeColors.green),
          const _CategoryIcon(BeIcons.icon_menu, 'Menu', BeColors.orange),
          const _CategoryIcon(BeIcons.icon_arrow_left, 'Back', BeColors.purple),
        ]),
      ],
    ),
  );
}

Widget _buildCategorySection(final String title, final List<_CategoryIcon> icons) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BeText.titleMedium(title),
      const SizedBox(height: 16),
      Row(
        children: icons
            .map(
              (final categoryIcon) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: BeIconShapeBorder(
                      icon: categoryIcon.icon,
                      size: 18,
                      color: categoryIcon.color,
                      radius: 12,
                      width: 2,
                      alignment: BeIconAlignment.topRight,
                      iconInset: 8,
                      iconStyle: TextStyle(color: categoryIcon.color, fontSize: 18),
                    ),
                    shadows: [
                      BoxShadow(
                        color: categoryIcon.color.withValues(alpha: 0.1 * 255),
                        offset: const Offset(0, 2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(categoryIcon.icon, color: categoryIcon.color.withValues(alpha: 0.6 * 255), size: 24),
                      const SizedBox(height: 8),
                      BeText.labelSmall(categoryIcon.label, align: TextAlign.center),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}

class _CategoryIcon {
  const _CategoryIcon(this.icon, this.label, this.color);
  final IconData icon;
  final String label;
  final Color color;
}

// Interactive Cards - Real-world use cases
Widget _buildInteractiveCards(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Interactive Cards'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Real-world card designs using BeIconShapeBorder',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [_buildNotificationCard(), _buildStatusCard(), _buildFeatureCard(), _buildPromotionCard()],
        ),
      ],
    ),
  );
}

Widget _buildNotificationCard() {
  return Container(
    width: 280,
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: const BeIconShapeBorder(
        icon: BeIcons.icon_bell,
        size: 20,
        color: BeColors.blue,
        radius: 16,
        width: 2,
        alignment: BeIconAlignment.topRight,
        iconInset: 12,
        iconStyle: TextStyle(color: BeColors.blue, fontSize: 20),
      ),
      shadows: [
        BoxShadow(
          color: BeColors.blue.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(color: BeColors.blue, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              const BeText.labelMedium('New Notification'),
            ],
          ),
          const SizedBox(height: 12),
          const BeText.bodyMedium('You have 3 new messages waiting for your attention.', maxLine: 2),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BeText.labelSmall('2 min ago', color: BeColors.gray500),
              Icon(Icons.arrow_forward_ios, size: 12, color: BeColors.gray400),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatusCard() {
  return Container(
    width: 280,
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: const BeIconShapeBorder(
        icon: BeIcons.icon_check_filled,
        size: 20,
        color: BeColors.green,
        radius: 16,
        width: 2,
        alignment: BeIconAlignment.topLeft,
        iconInset: 12,
        iconStyle: TextStyle(color: BeColors.green, fontSize: 20),
      ),
      shadows: [
        BoxShadow(
          color: BeColors.green.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BeText.titleMedium('Task Completed'),
          const SizedBox(height: 8),
          const BeText.bodyMedium('Your project has been successfully deployed to production.', maxLine: 2),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: BeColors.green.withValues(alpha: 0.1 * 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const BeText.labelSmall('Success', color: BeColors.green),
          ),
        ],
      ),
    ),
  );
}

Widget _buildFeatureCard() {
  return Container(
    width: 280,
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: const BeIconShapeBorder(
        icon: BeIcons.icon_star,
        size: 20,
        color: BeColors.orange,
        radius: 16,
        width: 2,
        alignment: BeIconAlignment.bottomRight,
        iconInset: 12,
        iconStyle: TextStyle(color: BeColors.orange, fontSize: 20),
      ),
      shadows: [
        BoxShadow(
          color: BeColors.orange.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BeText.titleMedium('Premium Feature'),
          const SizedBox(height: 8),
          const BeText.bodyMedium('Unlock advanced analytics and detailed reporting for your team.', maxLine: 2),
          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: BeColors.orange.withValues(alpha: 0.1 * 255),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const BeText.labelSmall('Premium', color: BeColors.orange),
              ),
              const Spacer(),
              const BeText.labelSmall('\$9.99/mo', color: BeColors.gray600),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildPromotionCard() {
  return Container(
    width: 280,
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: const BeIconShapeBorder(
        icon: BeIcons.icon_gift,
        size: 20,
        color: BeColors.purple,
        radius: 16,
        width: 2,
        alignment: BeIconAlignment.centerLeft,
        iconInset: 12,
        iconStyle: TextStyle(color: BeColors.purple, fontSize: 20),
      ),
      shadows: [
        BoxShadow(
          color: BeColors.purple.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BeText.titleMedium('Special Offer'),
          const SizedBox(height: 8),
          const BeText.bodyMedium('Get 50% off on your first month of premium subscription.', maxLine: 2),
          const Spacer(),
          Row(
            children: [
              const BeText.labelSmall('Expires in 3 days', color: BeColors.gray500),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: BeColors.purple, borderRadius: BorderRadius.circular(12)),
                child: const BeText.labelSmall('50% OFF', color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Border Styles - Different border configurations
Widget _buildBorderStyles(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Border Styles'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Various border width, radius, and color combinations',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.1,
          children: [
            _buildStyleCard('Thin Border', 1, 8, BeColors.blue, BeIcons.icon_format_line_height),
            _buildStyleCard('Medium Border', 3, 12, BeColors.green, BeIcons.icon_border_style_solid),
            _buildStyleCard('Thick Border', 6, 16, BeColors.orange, BeIcons.icon_square),
            _buildStyleCard('Rounded', 2, 24, BeColors.purple, BeIcons.icon_corner_up_right),
          ],
        ),
      ],
    ),
  );
}

Widget _buildStyleCard(
  final String title,
  final double width,
  final double radius,
  final Color color,
  final IconData icon,
) {
  return Container(
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: BeIconShapeBorder(
        icon: icon,
        size: 18,
        color: color,
        radius: radius,
        width: width,
        alignment: BeIconAlignment.topCenter,
        iconInset: 10,
        iconStyle: TextStyle(color: color, fontSize: 18),
      ),
      shadows: [
        BoxShadow(
          color: color.withValues(alpha: 0.1 * 255),
          offset: const Offset(0, 4),
          blurRadius: 12,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color.withValues(alpha: 0.6 * 255), size: 32),
        const SizedBox(height: 12),
        BeText.labelMedium(title, align: TextAlign.center),
        const SizedBox(height: 4),
        BeText.labelSmall(
          'Width: ${width.toInt()}px\nRadius: ${radius.toInt()}px',
          align: TextAlign.center,
          color: BeColors.gray500,
        ),
      ],
    ),
  );
}

// Badge System - Icon as badges
Widget _buildBadgeSystem(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Badge System'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Using icons as visual badges and indicators',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildBadgeCard('Security', BeIcons.icon_shield, BeColors.green, 'Verified & Secure'),
            _buildBadgeCard('Premium', BeIcons.icon_star, BeColors.orange, 'Premium Member'),
            _buildBadgeCard('Expert', BeIcons.icon_trophy, BeColors.blue, 'Expert Level'),
            _buildBadgeCard('Hot Deal', BeIcons.icon_star, BeColors.red, 'Limited Time'),
          ],
        ),
      ],
    ),
  );
}

Widget _buildBadgeCard(final String title, final IconData icon, final Color color, final String description) {
  return Container(
    width: 160,
    height: 120,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: BeIconShapeBorder(
        icon: icon,
        size: 16,
        color: color,
        radius: 20,
        width: 2,
        alignment: BeIconAlignment.topRight,
        iconInset: 8,
        iconStyle: TextStyle(color: color, fontSize: 16),
      ),
      shadows: [
        BoxShadow(
          color: color.withValues(alpha: 0.15 * 255),
          offset: const Offset(0, 6),
          blurRadius: 16,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1 * 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 12),
          BeText.titleSmall(title),
          const SizedBox(height: 4),
          BeText.bodySmall(description, color: BeColors.gray600, maxLine: 2),
        ],
      ),
    ),
  );
}

// Form Fields - Icons on input borders
Widget _buildFormFields(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Form Field Borders'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Enhanced form fields with contextual icons',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              _buildFormField('Enter your email', BeIcons.icon_mail, BeColors.blue),
              const SizedBox(height: 20),
              _buildFormField('Password', BeIcons.icon_lock, BeColors.green),
              const SizedBox(height: 20),
              _buildFormField('Phone number', BeIcons.icon_phone, BeColors.orange),
              const SizedBox(height: 20),
              _buildFormField('Search...', BeIcons.icon_search, BeColors.purple),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildFormField(final String hint, final IconData icon, final Color color) {
  return Container(
    height: 56,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: BeIconShapeBorder(
        icon: icon,
        size: 18,
        color: color,
        radius: 12,
        width: 2,
        alignment: BeIconAlignment.centerRight,
        iconInset: 16,
        iconStyle: TextStyle(color: color, fontSize: 18),
      ),
      shadows: [
        BoxShadow(
          color: color.withValues(alpha: 0.1 * 255),
          offset: const Offset(0, 2),
          blurRadius: 8,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // child: Align(alignment: Alignment.centerLeft, child: BeText.bodyMedium(hint, color: BeColors.gray400)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: false,
          focusedBorder: InputBorder.none,
          hint: BeText.bodySmall(hint, color: Colors.grey.shade300),
        ),
      ),
    ),
  );
}
