import 'package:beui/overlay.dart';
import 'package:beui/src/decoration/be_breakpoint_radius.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeResponsiveDialog', path: 'widget/overlay', type: Widget)
Widget useCaseBeResponsiveDialog(final BuildContext context) {
  final barrierDismissible = context.knobs.boolean(label: 'Barrier Dismissible', initialValue: true);
  final showShadow = context.knobs.boolean(label: 'Show Shadow', initialValue: true);
  final radiusXs = context.knobs.double.slider(label: 'Radius XS', initialValue: 12.0, min: 0.0, max: 50.0);
  final radiusSm = context.knobs.double.slider(label: 'Radius SM', initialValue: 16.0, min: 0.0, max: 50.0);
  final radiusMd = context.knobs.double.slider(label: 'Radius MD', initialValue: 20.0, min: 0.0, max: 50.0);
  final radiusLg = context.knobs.double.slider(label: 'Radius LG', initialValue: 24.0, min: 0.0, max: 50.0);
  final radiusXl = context.knobs.double.slider(label: 'Radius XL', initialValue: 28.0, min: 0.0, max: 50.0);
  final radiusXl2 = context.knobs.double.slider(label: 'Radius XL2', initialValue: 32.0, min: 0.0, max: 50.0);

  final dialogRadius = DialogRadius(
    xs: radiusXs,
    sm: radiusSm,
    md: radiusMd,
    lg: radiusLg,
    xl: radiusXl,
    xl2: radiusXl2,
  );

  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          const Text('BeResponsiveDialog Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => _showSimpleDialog(context, barrierDismissible, showShadow, dialogRadius),
            child: const Text('Simple Dialog'),
          ),

          ElevatedButton(
            onPressed: () => _showFormDialog(context, barrierDismissible, showShadow, dialogRadius),
            child: const Text('Form Dialog'),
          ),

          ElevatedButton(
            onPressed: () => _showContentDialog(context, barrierDismissible, showShadow, dialogRadius),
            child: const Text('Content Dialog'),
          ),

          ElevatedButton(
            onPressed: () => _showCustomStyledDialog(context, barrierDismissible, showShadow, dialogRadius),
            child: const Text('Custom Styled Dialog'),
          ),

          ElevatedButton(
            onPressed: () => _showLongContentDialog(context, barrierDismissible, showShadow, dialogRadius),
            child: const Text('Long Content Dialog'),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Dialogs adapt their size and padding based on screen breakpoints',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

void _showSimpleDialog(
  final BuildContext context,
  final bool barrierDismissible,
  final bool showShadow,
  final DialogRadius dialogRadius,
) {
  showBeResponsiveDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    showShadow: showShadow,
    dialogRadius: dialogRadius,
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info, size: 48, color: Colors.blue),
          const SizedBox(height: 16),
          const Text('Simple Dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('This is a simple responsive dialog that adapts to different screen sizes.'),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
              const SizedBox(width: 8),
              ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
            ],
          ),
        ],
      ),
    ),
  );
}

void _showFormDialog(
  final BuildContext context,
  final bool barrierDismissible,
  final bool showShadow,
  final DialogRadius dialogRadius,
) {
  showBeResponsiveDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    showShadow: showShadow,
    dialogRadius: dialogRadius,
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('User Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextFormField(decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextFormField(decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextFormField(decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
              const SizedBox(width: 8),
              ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save')),
            ],
          ),
        ],
      ),
    ),
  );
}

void _showContentDialog(
  final BuildContext context,
  final bool barrierDismissible,
  final bool showShadow,
  final DialogRadius dialogRadius,
) {
  showBeResponsiveDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    showShadow: showShadow,
    dialogRadius: dialogRadius,
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.warning, color: Colors.orange, size: 28),
              SizedBox(width: 12),
              Text('Important Notice', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('This dialog demonstrates responsive behavior across different screen sizes:'),
          const SizedBox(height: 12),
          const Text('• Mobile (XS/SM): Takes 90%/80% of screen width'),
          const Text('• Tablet (MD): Fixed 500px width'),
          const Text('• Desktop (LG+): Fixed 600px width'),
          const SizedBox(height: 12),
          const Text('Padding and border radius also adapt to the breakpoints.'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Got it')),
          ),
        ],
      ),
    ),
  );
}

void _showCustomStyledDialog(
  final BuildContext context,
  final bool barrierDismissible,
  final bool showShadow,
  final DialogRadius dialogRadius,
) {
  showBeResponsiveDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    showShadow: showShadow,
    dialogRadius: dialogRadius,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple.shade50, Colors.blue.shade50],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.purple.shade200, width: 2),
    ),
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 16),
          const Text('Custom Styled Dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(
            'This dialog uses custom decoration with gradient background and border.',
            style: TextStyle(color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Later'))),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

void _showLongContentDialog(
  final BuildContext context,
  final bool barrierDismissible,
  final bool showShadow,
  final DialogRadius dialogRadius,
) {
  showBeResponsiveDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    showShadow: showShadow,
    dialogRadius: dialogRadius,
    child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.blue.shade50,
            child: const Row(
              children: [
                Icon(Icons.article, color: Colors.blue),
                SizedBox(width: 12),
                Text('Terms and Conditions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    '1. Introduction',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                  _buildSection(
                    '2. User Responsibilities',
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  ),
                  _buildSection(
                    '3. Privacy Policy',
                    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  ),
                  _buildSection(
                    '4. Data Collection',
                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  _buildSection(
                    '5. Limitations',
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Decline')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Accept')),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSection(final String title, final String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(content, style: TextStyle(color: Colors.grey.shade700)),
      ],
    ),
  );
}
