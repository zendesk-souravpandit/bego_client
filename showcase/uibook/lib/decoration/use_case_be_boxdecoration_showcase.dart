import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgetbook/modal_option.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeBoxDecoration', path: 'decoration', type: BeBoxDecoration)
Widget useCaseBeBoxDecorationShowcase(final BuildContext context) {
  final selectedDemo = context.knobs.object.dropdown(
    label: 'Demo Type',
    options: [
      const KnobOption(label: 'Feature Cards Grid', value: 'grid'),
      const KnobOption(label: 'Elegant Profile Card', value: 'profile'),
      const KnobOption(label: 'Glass Morphism Panel', value: 'glass'),
      const KnobOption(label: 'Floating Action Cards', value: 'floating'),
      const KnobOption(label: 'Inset Shadows Gallery', value: 'inset'),
      const KnobOption(label: 'Gradient Showcase', value: 'gradient'),
      const KnobOption(label: 'Interactive Playground', value: 'playground'),
    ],
    labelBuilder: (final value) => value.label,
  );

  switch (selectedDemo.value) {
    case 'grid':
      return _buildFeatureCardsGrid(context);
    case 'profile':
      return _buildElegantProfileCard(context);
    case 'glass':
      return _buildGlassMorphismPanel(context);
    case 'floating':
      return _buildFloatingActionCards(context);
    case 'inset':
      return _buildInsetShadowsGallery(context);
    case 'gradient':
      return _buildGradientShowcase(context);
    case 'playground':
      return _buildInteractivePlayground(context);
    default:
      return _buildFeatureCardsGrid(context);
  }
}

// Interactive Playground - Original functionality enhanced
Widget _buildInteractivePlayground(final BuildContext context) {
  final cardColor = context.knobs.object.dropdown(
    label: 'Card Color',
    options: [
      const KnobOption(label: 'White', value: Colors.white),
      const KnobOption(label: 'Light Grey', value: Color(0xFFF5F5F5)),
      KnobOption(label: 'Blue Tint', value: Colors.blue[50]!),
      KnobOption(label: 'Purple Tint', value: Colors.purple[50]!),
      KnobOption(label: 'Green Tint', value: Colors.green[50]!),
    ],
    labelBuilder: (final value) => value.label,
  );

  final shadowColor = context.knobs.object.dropdown(
    label: 'Shadow Color',
    options: [
      const KnobOption(label: 'Grey', value: Colors.grey),
      const KnobOption(label: 'Blue', value: Colors.blue),
      const KnobOption(label: 'Purple', value: Colors.purple),
      const KnobOption(label: 'Black', value: Colors.black26),
      const KnobOption(label: 'Primary', value: BeColors.primary),
    ],
    labelBuilder: (final value) => value.label,
  );

  final borderRadius = context.knobs.doubleOrNull.slider(label: 'Border Radius', min: 0, max: 40, initialValue: 16);
  final blurRadius = context.knobs.doubleOrNull.slider(label: 'Shadow Blur', min: 0, max: 40, initialValue: 12);
  final yOffset = context.knobs.doubleOrNull.slider(label: 'Shadow Y Offset', min: -20, max: 40, initialValue: 6);
  final xOffset = context.knobs.doubleOrNull.slider(label: 'Shadow X Offset', min: -20, max: 20, initialValue: 0);
  final spreadRadius = context.knobs.doubleOrNull.slider(label: 'Spread Radius', min: -10, max: 20, initialValue: 0);
  final insetShadow = context.knobs.boolean(label: 'Inset Shadow', initialValue: false);

  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(32),
        decoration: BeBoxDecoration(
          color: cardColor.value,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          boxShadow: [
            BeBoxShadow(
              color: shadowColor.value.withValues(alpha: 0.3 * 255),
              offset: Offset(xOffset ?? 0, yOffset ?? 6),
              blurRadius: blurRadius ?? 12,
              spreadRadius: spreadRadius ?? 0,
              inset: insetShadow,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BeBoxDecoration(
                color: BeColors.primary.withValues(alpha: 0.1 * 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: BeColors.primary.withValues(alpha: 0.2 * 255),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.palette, size: 40, color: BeColors.primary),
            ),
            const SizedBox(height: 24),
            const BeText.titleLarge('Interactive Playground'),
            const SizedBox(height: 8),
            const BeText.bodyMedium(
              'Experiment with different shadow properties, colors, and border radius to see how BeBoxDecoration can transform your UI components.',
              align: TextAlign.center,
              maxLine: 4,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BeBoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BeBoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1 * 255),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          inset: true,
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.brush, color: BeColors.secondary, size: 24),
                        SizedBox(height: 8),
                        BeText.labelMedium('Customizable'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BeBoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BeBoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1 * 255),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          inset: true,
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.flash_on, color: BeColors.orange, size: 24),
                        SizedBox(height: 8),
                        BeText.labelMedium('Performant'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// Feature Cards Grid - Modern design system showcase
Widget _buildFeatureCardsGrid(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('BeBoxDecoration Features'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Explore the powerful capabilities of BeBoxDecoration',
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
          childAspectRatio: 0.85,
          children: [
            _buildFeatureCard(
              title: 'Outer Shadows',
              description: 'Beautiful elevation effects that make components float above the surface',
              icon: Icons.layers,
              color: BeColors.blue,
              decoration: BeBoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: BeColors.blue.withValues(alpha: 0.15 * 255),
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                  BeBoxShadow(
                    color: BeColors.blue.withValues(alpha: 0.08 * 255),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            _buildFeatureCard(
              title: 'Inset Shadows',
              description: 'Inner shadows that create depth and pressed-in effects',
              icon: Icons.radio_button_checked,
              color: BeColors.purple,
              decoration: BeBoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: BeColors.purple.withValues(alpha: 0.2 * 255),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 0,
                    inset: true,
                  ),
                ],
              ),
            ),
            _buildFeatureCard(
              title: 'Multiple Shadows',
              description: 'Combine multiple shadows for complex lighting effects',
              icon: Icons.auto_awesome,
              color: BeColors.orange,
              decoration: BeBoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: BeColors.orange.withValues(alpha: 0.3 * 255),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                  BeBoxShadow(
                    color: BeColors.orange.withValues(alpha: 0.2 * 255),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            _buildFeatureCard(
              title: 'Color Blending',
              description: 'Advanced color blending modes and gradient effects',
              icon: Icons.gradient,
              color: BeColors.green,
              decoration: BeBoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: BeColors.green.withValues(alpha: 0.25 * 255),
                    offset: const Offset(0, 6),
                    blurRadius: 20,
                    spreadRadius: -2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildFeatureCard({
  required final String title,
  required final String description,
  required final IconData icon,
  required final Color color,
  required final BeBoxDecoration decoration,
}) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: decoration,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BeBoxDecoration(
            color: color.withValues(alpha: 0.1 * 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 16),
        BeText.titleMedium(title),
        const SizedBox(height: 8),
        BeText.bodySmall(description, color: BeColors.gray600, maxLine: 3),
      ],
    ),
  );
}

// Elegant Profile Card - Premium design
Widget _buildElegantProfileCard(final BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 380),
        decoration: BeBoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BeBoxShadow(
              color: BeColors.primary.withValues(alpha: 0.08 * 255),
              offset: const Offset(0, 20),
              blurRadius: 40,
              spreadRadius: 0,
            ),
            BeBoxShadow(
              color: BeColors.primary.withValues(alpha: 0.04 * 255),
              offset: const Offset(0, 8),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with gradient background
            Container(
              height: 120,
              decoration: BeBoxDecoration(
                gradient: LinearGradient(
                  colors: [BeColors.primary, BeColors.primary.withValues(alpha: 0.8 * 255)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
            ),

            // Avatar overlapping header
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: 100,
                height: 100,
                decoration: BeBoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BeBoxShadow(
                      color: BeColors.primary.withValues(alpha: 0.2 * 255),
                      offset: const Offset(0, 8),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network('https://randomuser.me/api/portraits/women/44.jpg', fit: BoxFit.cover),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  const BeText.titleLarge('Sarah Johnson'),
                  const SizedBox(height: 4),
                  const BeText.bodyMedium('Senior Product Designer', color: BeColors.gray600),
                  const SizedBox(height: 24),

                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('124', 'Projects'),
                      Container(width: 1, height: 40, color: BeColors.gray200),
                      _buildStatItem('1.2k', 'Followers'),
                      Container(width: 1, height: 40, color: BeColors.gray200),
                      _buildStatItem('4.8', 'Rating'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BeBoxDecoration(
                            gradient: LinearGradient(
                              colors: [BeColors.primary, BeColors.primary.withValues(alpha: 0.8 * 255)],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BeBoxShadow(
                                color: BeColors.primary.withValues(alpha: 0.3 * 255),
                                offset: const Offset(0, 4),
                                blurRadius: 12,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: const Center(child: BeText.labelLarge('Connect', color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BeBoxDecoration(
                          color: BeColors.gray100,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BeBoxShadow(
                              color: BeColors.gray300.withValues(alpha: 0.3 * 255),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              inset: true,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.message, color: BeColors.gray600, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildStatItem(final String value, final String label) {
  return Column(
    children: [BeText.titleMedium(value), const SizedBox(height: 4), BeText.labelSmall(label, color: BeColors.gray500)],
  );
}

// Glass Morphism Panel
Widget _buildGlassMorphismPanel(final BuildContext context) {
  return Container(
    decoration: BeBoxDecoration(
      gradient: LinearGradient(
        colors: [BeColors.blue.withValues(alpha: 0.3 * 255), BeColors.purple.withValues(alpha: 0.3 * 255)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BeBoxDecoration(
          color: Colors.white.withValues(alpha: 0.25 * 255),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BeBoxShadow(
              color: Colors.white.withValues(alpha: 0.2 * 255),
              offset: const Offset(0, 1),
              blurRadius: 0,
              inset: true,
            ),
            BeBoxShadow(
              color: Colors.black.withValues(alpha: 0.1 * 255),
              offset: const Offset(0, 8),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BeBoxDecoration(
                color: Colors.white.withValues(alpha: 0.3 * 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BeBoxShadow(
                    color: Colors.white.withValues(alpha: 0.3 * 255),
                    offset: const Offset(0, 1),
                    blurRadius: 0,
                    inset: true,
                  ),
                ],
              ),
              child: const Icon(Icons.auto_awesome, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const BeText.titleLarge('Glass Morphism', color: Colors.white),
            const SizedBox(height: 8),
            const BeText.bodyMedium(
              'Modern glass-like effects with transparency, blur, and subtle shadows',
              color: Colors.white,
              align: TextAlign.center,
              maxLine: 3,
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BeBoxDecoration(
                color: Colors.white.withValues(alpha: 0.2 * 255),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BeBoxShadow(
                    color: Colors.black.withValues(alpha: 0.1 * 255),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                    inset: true,
                  ),
                ],
              ),
              child: const BeText.labelMedium(
                'Achieve modern glass effects with BeBoxDecoration\'s inset shadows and transparency',
                color: Colors.white,
                align: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Floating Action Cards
Widget _buildFloatingActionCards(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Floating Actions'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Cards that appear to float with dynamic shadows',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildFloatingCard(icon: Icons.camera_alt, title: 'Capture', color: BeColors.blue, elevation: 8),
            _buildFloatingCard(icon: Icons.edit, title: 'Edit', color: BeColors.orange, elevation: 12),
            _buildFloatingCard(icon: Icons.share, title: 'Share', color: BeColors.green, elevation: 16),
            _buildFloatingCard(icon: Icons.download, title: 'Download', color: BeColors.purple, elevation: 20),
          ],
        ),
      ],
    ),
  );
}

Widget _buildFloatingCard({
  required final IconData icon,
  required final String title,
  required final Color color,
  required final double elevation,
}) {
  return Container(
    width: 140,
    height: 140,
    decoration: BeBoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BeBoxShadow(
          color: color.withValues(alpha: 0.3 * 255),
          offset: Offset(0, elevation / 2),
          blurRadius: elevation * 1.5,
          spreadRadius: -elevation / 4,
        ),
        BeBoxShadow(
          color: color.withValues(alpha: 0.1 * 255),
          offset: Offset(0, elevation / 4),
          blurRadius: elevation,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BeBoxDecoration(
            color: color.withValues(alpha: 0.1 * 255),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 12),
        BeText.labelLarge(title),
      ],
    ),
  );
}

// Inset Shadows Gallery
Widget _buildInsetShadowsGallery(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Inset Shadow Effects'),
        const SizedBox(height: 8),
        const BeText.bodyMedium('Create depth with inner shadows', color: BeColors.gray600, align: TextAlign.center),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.1,
          children: [
            _buildInsetCard('Pressed Button', Icons.radio_button_checked, BeColors.blue, [
              BeBoxShadow(
                color: BeColors.blue.withValues(alpha: 0.3 * 255),
                offset: const Offset(0, 2),
                blurRadius: 4,
                inset: true,
              ),
            ]),
            _buildInsetCard('Input Field', Icons.edit, BeColors.gray400, [
              BeBoxShadow(
                color: BeColors.gray400.withValues(alpha: 0.2 * 255),
                offset: const Offset(0, 1),
                blurRadius: 2,
                inset: true,
              ),
              BeBoxShadow(
                color: BeColors.gray400.withValues(alpha: 0.1 * 255),
                offset: const Offset(0, -1),
                blurRadius: 1,
                inset: true,
              ),
            ]),
            _buildInsetCard('Deep Well', Icons.water_drop, BeColors.purple, [
              BeBoxShadow(
                color: BeColors.purple.withValues(alpha: 0.4 * 255),
                offset: const Offset(0, 4),
                blurRadius: 8,
                inset: true,
              ),
              BeBoxShadow(
                color: BeColors.purple.withValues(alpha: 0.2 * 255),
                offset: const Offset(0, -2),
                blurRadius: 4,
                inset: true,
              ),
            ]),
            _buildInsetCard('Carved Text', Icons.text_fields, BeColors.orange, [
              BeBoxShadow(
                color: BeColors.orange.withValues(alpha: 0.3 * 255),
                offset: const Offset(1, 1),
                blurRadius: 2,
                inset: true,
              ),
              BeBoxShadow(
                color: Colors.white.withValues(alpha: 0.8 * 255),
                offset: const Offset(-1, -1),
                blurRadius: 2,
                inset: true,
              ),
            ]),
          ],
        ),
      ],
    ),
  );
}

Widget _buildInsetCard(final String title, final IconData icon, final Color color, final List<BeBoxShadow> shadows) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BeBoxDecoration(
      color: color.withValues(alpha: 0.1 * 255),
      borderRadius: BorderRadius.circular(16),
      boxShadow: shadows,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 12),
        BeText.labelMedium(title, align: TextAlign.center),
      ],
    ),
  );
}

// Gradient Showcase
Widget _buildGradientShowcase(final BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const BeText.headlineMedium('Gradient Effects'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'Beautiful gradients combined with shadows',
          color: BeColors.gray600,
          align: TextAlign.center,
        ),
        const SizedBox(height: 32),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 1,
          mainAxisSpacing: 24,
          childAspectRatio: 2.5,
          children: [
            _buildGradientCard(
              'Sunset Vibes',
              const LinearGradient(
                colors: [BeColors.orange, BeColors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              BeColors.orange,
            ),
            _buildGradientCard(
              'Ocean Breeze',
              const LinearGradient(
                colors: [BeColors.blue, BeColors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              BeColors.blue,
            ),
            _buildGradientCard(
              'Royal Purple',
              const LinearGradient(
                colors: [BeColors.purple, BeColors.voilet],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              BeColors.purple,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildGradientCard(final String title, final Gradient gradient, final Color shadowColor) {
  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BeBoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BeBoxShadow(
          color: shadowColor.withValues(alpha: 0.4 * 255),
          offset: const Offset(0, 8),
          blurRadius: 24,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BeText.titleLarge(title, color: Colors.white),
              const SizedBox(height: 8),
              const BeText.bodyMedium(
                'Beautiful gradient effects with perfectly matched shadows',
                color: Colors.white,
                maxLine: 2,
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BeBoxDecoration(
            color: Colors.white.withValues(alpha: 0.2 * 255),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BeBoxShadow(
                color: Colors.black.withValues(alpha: 0.1 * 255),
                offset: const Offset(0, 4),
                blurRadius: 8,
                inset: true,
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
        ),
      ],
    ),
  );
}
