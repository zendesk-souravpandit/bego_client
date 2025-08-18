import 'package:beui/text.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeText - Typography Showcase', path: 'widget/text', type: BeText)
Widget beTextTypographyUseCase(final BuildContext context) {
  final sampleText = context.knobs.string(
    label: 'Sample Text',
    initialValue: 'The quick brown fox jumps over the lazy dog',
  );
  final color = context.knobs.colorOrNull(label: 'Text Color');
  final maxLines = context.knobs.intOrNull.input(label: 'Max Lines');
  final alignment = context.knobs.listOrNull<TextAlign>(label: 'Text Alignment', options: TextAlign.values);
  final showPadding = context.knobs.boolean(label: 'Show Padding', initialValue: false);
  final overflow = context.knobs.list<TextOverflow>(
    label: 'Text Overflow',
    options: TextOverflow.values,
    initialOption: TextOverflow.ellipsis,
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text('BeText Typography Showcase'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Material Design 3 Typography Scale'),
          const SizedBox(height: 16),

          _buildTypographySection('Display Styles', 'Large, expressive text for marketing or brand communications', [
            _buildTextExample(
              'Display Large',
              BeText.displayLarge(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Display Medium',
              BeText.displayMedium(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Display Small',
              BeText.displaySmall(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
          ]),

          const SizedBox(height: 32),

          _buildTypographySection('Headline Styles', 'High-emphasis text for short, important content', [
            _buildTextExample(
              'Headline Large',
              BeText.headlineLarge(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Headline Medium',
              BeText.headlineMedium(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Headline Small',
              BeText.headlineSmall(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
          ]),

          const SizedBox(height: 32),

          _buildTypographySection('Title Styles', 'Medium-emphasis text for section headers and important content', [
            _buildTextExample(
              'Title Large',
              BeText.titleLarge(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Title Medium',
              BeText.titleMedium(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Title Small',
              BeText.titleSmall(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
          ]),

          const SizedBox(height: 32),

          _buildTypographySection('Body Styles', 'Regular text for paragraphs and body content', [
            _buildTextExample(
              'Body Large',
              BeText.bodyLarge(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Body Medium',
              BeText.bodyMedium(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Body Small',
              BeText.bodySmall(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
          ]),

          const SizedBox(height: 32),

          _buildTypographySection('Label Styles', 'Small text for captions, labels, and auxiliary content', [
            _buildTextExample(
              'Label Large',
              BeText.labelLarge(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Label Medium',
              BeText.labelMedium(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
            _buildTextExample(
              'Label Small',
              BeText.labelSmall(
                sampleText,
                color: color,
                maxLine: maxLines,
                align: alignment,
                padding: showPadding ? const EdgeInsets.all(8) : null,
                overflow: overflow,
              ),
            ),
          ]),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'BeText - Practical Examples', path: 'widget/text', type: BeText)
Widget beTextPracticalUseCase(final BuildContext context) {
  final longText = context.knobs.string(
    label: 'Long Text Content',
    initialValue:
        'This is a very long text that demonstrates how BeText handles text overflow, line breaks, and various formatting options. It should wrap across multiple lines when needed and handle different overflow scenarios gracefully. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  );
  final shortText = context.knobs.string(label: 'Short Text Content', initialValue: 'Short text example');

  return Scaffold(
    appBar: AppBar(
      title: const Text('BeText Practical Examples'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Real-World Usage Examples'),
          const SizedBox(height: 24),

          _buildPracticalSection('App Headers & Navigation', [
            _buildUsageExample(
              'App Bar Title',
              BeText.titleLarge('Dashboard', color: Theme.of(context).colorScheme.onSurface),
              'BeText.titleLarge(\'Dashboard\')',
            ),
            _buildUsageExample(
              'Tab Label',
              BeText.labelLarge('Overview', color: Theme.of(context).colorScheme.primary),
              'BeText.labelLarge(\'Overview\')',
            ),
            _buildUsageExample(
              'Breadcrumb',
              BeText.bodySmall('Home > Settings > Profile', color: Theme.of(context).colorScheme.onSurfaceVariant),
              'BeText.bodySmall(\'Home > Settings > Profile\')',
            ),
          ]),

          const SizedBox(height: 32),

          _buildPracticalSection('Content Display', [
            _buildUsageExample(
              'Article Title',
              const BeText.headlineMedium('Getting Started with Flutter Development'),
              'BeText.headlineMedium(\'Article Title\')',
            ),
            _buildUsageExample(
              'Article Body',
              BeText.bodyMedium(longText, maxLine: 3, overflow: TextOverflow.ellipsis),
              'BeText.bodyMedium(text, maxLine: 3, overflow: TextOverflow.ellipsis)',
            ),
            _buildUsageExample(
              'Metadata',
              BeText.labelSmall('Published on January 15, 2024', color: Theme.of(context).colorScheme.outline),
              'BeText.labelSmall(\'Published on January 15, 2024\')',
            ),
          ]),

          const SizedBox(height: 32),

          _buildPracticalSection('Cards & Lists', [
            _buildCardExample(),
            const SizedBox(height: 16),
            _buildListItemExample(),
          ]),

          const SizedBox(height: 32),

          _buildPracticalSection('Form Elements', [_buildFormExample()]),

          const SizedBox(height: 32),

          _buildPracticalSection('Text Alignment Examples', [
            _buildAlignmentExample('Left Aligned', TextAlign.left, shortText),
            _buildAlignmentExample('Center Aligned', TextAlign.center, shortText),
            _buildAlignmentExample('Right Aligned', TextAlign.right, shortText),
            _buildAlignmentExample('Justified', TextAlign.justify, longText),
          ]),

          const SizedBox(height: 32),

          _buildPracticalSection('Overflow Handling', [
            _buildOverflowExample('Ellipsis', TextOverflow.ellipsis, longText),
            _buildOverflowExample('Fade', TextOverflow.fade, longText),
            _buildOverflowExample('Clip', TextOverflow.clip, longText),
            _buildOverflowExample('Visible', TextOverflow.visible, longText),
          ]),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'BeText - Custom Styling', path: 'widget/text', type: BeText)
Widget beTextCustomStylingUseCase(final BuildContext context) {
  final text = context.knobs.string(label: 'Text Content', initialValue: 'Custom styled text');
  final fontSize = context.knobs.double.slider(label: 'Font Size', initialValue: 16, min: 8, max: 64);
  final fontWeight = context.knobs.list<FontWeight>(
    label: 'Font Weight',
    options: [
      FontWeight.w100,
      FontWeight.w200,
      FontWeight.w300,
      FontWeight.w400,
      FontWeight.w500,
      FontWeight.w600,
      FontWeight.w700,
      FontWeight.w800,
      FontWeight.w900,
    ],
    initialOption: FontWeight.w400,
  );
  final letterSpacing = context.knobs.double.slider(label: 'Letter Spacing', initialValue: 0, min: -2, max: 4);
  final lineHeight = context.knobs.double.slider(label: 'Line Height', initialValue: 1.4, min: 1, max: 3);
  final decoration = context.knobs.object.dropdown(
    label: 'Text Decoration',
    options: [TextDecoration.none, TextDecoration.underline, TextDecoration.overline, TextDecoration.lineThrough],
  );
  final color = context.knobs.color(label: 'Text Color', initialValue: Colors.black);
  final backgroundColor = context.knobs.colorOrNull(label: 'Background Color');

  final customStyle = TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    height: lineHeight,
    decoration: decoration,
    color: color,
    backgroundColor: backgroundColor,
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text('BeText Custom Styling'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Custom Style Application'),
          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BeText(text, style: customStyle),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Generated Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      _generateStyleCode(text, customStyle),
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          _buildStyleOptionsReference(),
        ],
      ),
    ),
  );
}

Widget _buildHeader(final String title) {
  return Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
}

Widget _buildTypographySection(final String title, final String description, final List<Widget> examples) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 16),
          ...examples,
        ],
      ),
    ),
  );
}

Widget _buildTextExample(final String label, final Widget textWidget) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blue)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: textWidget,
        ),
      ],
    ),
  );
}

Widget _buildPracticalSection(final String title, final List<Widget> examples) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...examples,
        ],
      ),
    ),
  );
}

Widget _buildUsageExample(final String label, final Widget textWidget, final String code) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(4)),
              child: Text(code, style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.blue)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: textWidget,
        ),
      ],
    ),
  );
}

Widget _buildCardExample() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4, offset: const Offset(0, 2))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BeText.titleMedium('Product Card Example'),
        const SizedBox(height: 8),
        const BeText.bodyMedium(
          'This is a sample product description that shows how BeText works in a card layout.',
          maxLine: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            BeText.labelLarge('\$99.99', color: Colors.green.shade600),
            const Spacer(),
            BeText.labelSmall('In Stock', color: Colors.grey.shade600),
          ],
        ),
      ],
    ),
  );
}

Widget _buildListItemExample() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(4)),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: BeText.labelLarge('AB', color: Colors.blue.shade700),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BeText.bodyMedium('Alex Brown'),
              BeText.bodySmall('Software Engineer at Tech Corp', color: Colors.grey.shade600),
            ],
          ),
        ),
        BeText.labelSmall('2h ago', color: Colors.grey.shade500),
      ],
    ),
  );
}

Widget _buildFormExample() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BeText.titleSmall('Contact Information'),
        const SizedBox(height: 12),
        const BeText.labelMedium('Full Name *'),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: BeText.bodyMedium('John Doe', color: Colors.grey.shade700),
        ),
        const SizedBox(height: 8),
        BeText.labelSmall('Please enter your full name', color: Colors.grey.shade600),
      ],
    ),
  );
}

Widget _buildAlignmentExample(final String label, final TextAlign alignment, final String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blue)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: BeText.bodyMedium(text, align: alignment, maxLine: 2),
        ),
      ],
    ),
  );
}

Widget _buildOverflowExample(final String label, final TextOverflow overflow, final String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label (${overflow.name})',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: BeText.bodyMedium(text, maxLine: 1, overflow: overflow),
        ),
      ],
    ),
  );
}

Widget _buildStyleOptionsReference() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TextStyle Properties Reference', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildReferenceItem('fontSize', 'Controls the size of the text'),
          _buildReferenceItem('fontWeight', 'Controls the thickness of the font (w100-w900)'),
          _buildReferenceItem('letterSpacing', 'Controls spacing between characters'),
          _buildReferenceItem('height', 'Controls line height (multiplier of font size)'),
          _buildReferenceItem('decoration', 'Adds underline, overline, or strikethrough'),
          _buildReferenceItem('color', 'Sets the text color'),
          _buildReferenceItem('backgroundColor', 'Sets the background color behind text'),
        ],
      ),
    ),
  );
}

Widget _buildReferenceItem(final String property, final String description) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            property,
            style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ),
        Expanded(child: Text(description, style: TextStyle(color: Colors.grey.shade700))),
      ],
    ),
  );
}

String _generateStyleCode(final String text, final TextStyle style) {
  final buffer =
      StringBuffer()
        ..writeln('BeText(')
        ..writeln('  \'$text\',')
        ..writeln('  style: TextStyle(');

  if (style.fontSize != null) {
    buffer.writeln('    fontSize: ${style.fontSize},');
  }
  if (style.fontWeight != null) {
    buffer.writeln('    fontWeight: FontWeight.${style.fontWeight.toString().split('.').last},');
  }
  if (style.letterSpacing != null && style.letterSpacing != 0) {
    buffer.writeln('    letterSpacing: ${style.letterSpacing},');
  }
  if (style.height != null && style.height != 1.4) {
    buffer.writeln('    height: ${style.height},');
  }
  if (style.decoration != null && style.decoration != TextDecoration.none) {
    buffer.writeln('    decoration: TextDecoration.${style.decoration.toString().split('.').last},');
  }
  if (style.color != null) {
    buffer.writeln('    color: ${_colorToString(style.color!)},');
  }
  if (style.backgroundColor != null) {
    buffer.writeln('    backgroundColor: ${_colorToString(style.backgroundColor!)},');
  }

  buffer
    ..writeln('  ),')
    ..writeln(')');

  return buffer.toString();
}

String _colorToString(final Color color) {
  if (color == Colors.black) return 'Colors.black';
  if (color == Colors.white) return 'Colors.white';
  if (color == Colors.red) return 'Colors.red';
  if (color == Colors.blue) return 'Colors.blue';
  if (color == Colors.green) return 'Colors.green';
  return 'Color(0x${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()})';
}
