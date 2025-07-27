import 'package:beui/overlay.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BePopover - Improved', path: 'widget/overlay', type: BePopover)
Widget useCaseBePopoverImproved(final BuildContext context) {
  final popoverAnchor = context.knobs.list(
    label: 'Popover Anchor',
    options: [
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.centerLeft,
      Alignment.center,
      Alignment.centerRight,
      Alignment.bottomLeft,
      Alignment.bottomCenter,
      Alignment.bottomRight,
    ],
    initialOption: Alignment.bottomCenter,
    labelBuilder: (final value) => value.toString().replaceFirst('Alignment.', ''),
  );

  final childAnchor = context.knobs.list(
    label: 'Child Anchor',
    options: [
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.centerLeft,
      Alignment.center,
      Alignment.centerRight,
      Alignment.bottomLeft,
      Alignment.bottomCenter,
      Alignment.bottomRight,
    ],
    initialOption: Alignment.topCenter,
    labelBuilder: (final value) => value.toString().replaceFirst('Alignment.', ''),
  );

  final hideOnTapOutside = context.knobs.list(
    label: 'Hide on Tap Outside',
    options: BeHidePopoverRegion.values,
    initialOption: BeHidePopoverRegion.anywhere,
  );

  final autofocus = context.knobs.boolean(label: 'Auto Focus', initialValue: false);
  final directionPadding = context.knobs.boolean(label: 'Direction Padding', initialValue: false);

  return _BePopoverImprovedWidget(
    popoverAnchor: popoverAnchor,
    childAnchor: childAnchor,
    hideOnTapOutside: hideOnTapOutside,
    autofocus: autofocus,
    directionPadding: directionPadding,
  );
}

class _BePopoverImprovedWidget extends StatefulWidget {
  const _BePopoverImprovedWidget({
    required this.popoverAnchor,
    required this.childAnchor,
    required this.hideOnTapOutside,
    required this.autofocus,
    required this.directionPadding,
  });

  final AlignmentGeometry popoverAnchor;
  final AlignmentGeometry childAnchor;
  final BeHidePopoverRegion hideOnTapOutside;
  final bool autofocus;
  final bool directionPadding;

  @override
  State<_BePopoverImprovedWidget> createState() => _BePopoverImprovedWidgetState();
}

class _BePopoverImprovedWidgetState extends State<_BePopoverImprovedWidget> with TickerProviderStateMixin {
  // Controllers for popovers that need to be closed programmatically
  late BePopoverController _infoPopoverController;
  late BePopoverController _formPopoverController;
  late BePopoverController _closeExamplePopoverController;
  late BePopoverController _cardPopoverController;

  @override
  void initState() {
    super.initState();
    _infoPopoverController = BePopoverController(vsync: this);
    _formPopoverController = BePopoverController(vsync: this);
    _closeExamplePopoverController = BePopoverController(vsync: this);
    _cardPopoverController = BePopoverController(vsync: this);
  }

  @override
  void dispose() {
    _infoPopoverController.dispose();
    _formPopoverController.dispose();
    _closeExamplePopoverController.dispose();
    _cardPopoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BePopover - Improved'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructions Card
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'How to Use BePopover.automatic',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1. Click on any button below to trigger a popover\n'
                      '2. The popover will show automatically on tap\n'
                      '3. Click outside the popover to hide it\n'
                      '4. Adjust knobs on the right to change positioning',
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Basic Examples
            const Text('Basic Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                // Simple tooltip
                BePopover.automatic(
                  popoverAnchor: widget.popoverAnchor,
                  childAnchor: widget.childAnchor,
                  hideOnTapOutside: widget.hideOnTapOutside,
                  autofocus: widget.autofocus,
                  directionPadding: widget.directionPadding,
                  popoverBuilder:
                      (final context, final decoration, final child) => _buildStatusPopover(
                        'Tooltip Active!',
                        'This is a simple tooltip that appears when you click the button.',
                        Icons.check_circle,
                        Colors.green,
                      ),
                  child: _buildDemoButton('Click for Tooltip', Icons.help_outline, Colors.blue),
                ),

                // Menu popover
                BePopover.automatic(
                  popoverAnchor: widget.popoverAnchor,
                  childAnchor: widget.childAnchor,
                  hideOnTapOutside: widget.hideOnTapOutside,
                  autofocus: widget.autofocus,
                  directionPadding: widget.directionPadding,
                  popoverBuilder: (final context, final decoration, final child) => _buildMenuPopover(),
                  child: _buildDemoButton('Show Menu', Icons.menu, Colors.orange),
                ),

                // Form popover - with controller to enable closing from inside
                BePopover.automatic(
                  controller: _formPopoverController,
                  popoverAnchor: widget.popoverAnchor,
                  childAnchor: widget.childAnchor,
                  hideOnTapOutside: widget.hideOnTapOutside,
                  autofocus: widget.autofocus,
                  directionPadding: widget.directionPadding,
                  popoverBuilder:
                      (final context, final decoration, final child) => _buildFormPopover(_formPopoverController),
                  child: _buildDemoButton('Quick Edit', Icons.edit, Colors.green),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Advanced Examples
            const Text('Advanced Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Information card - with controller to enable closing from inside
            BePopover.automatic(
              controller: _infoPopoverController,
              popoverAnchor: widget.popoverAnchor,
              childAnchor: widget.childAnchor,
              hideOnTapOutside: widget.hideOnTapOutside,
              autofocus: widget.autofocus,
              directionPadding: widget.directionPadding,
              popoverBuilder:
                  (final context, final decoration, final child) => _buildInfoPopover(_infoPopoverController),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info, color: Colors.blue.shade600),
                      const SizedBox(width: 12),
                      const Text('Click this card for more info'),
                      const SizedBox(width: 8),
                      Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Status indicator with live updates
            const Text('Close from Inside Example:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'This example shows how to close popovers programmatically from their content',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            BePopover.automatic(
              controller: _closeExamplePopoverController,
              popoverAnchor: widget.popoverAnchor,
              childAnchor: widget.childAnchor,
              hideOnTapOutside: widget.hideOnTapOutside,
              autofocus: widget.autofocus,
              directionPadding: widget.directionPadding,
              popoverBuilder:
                  (final context, final decoration, final child) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: decoration,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'This popover can be closed from inside!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        const Text('Click the close button below to dismiss this popover programmatically.'),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => _closeExamplePopoverController.hide(),
                          icon: const Icon(Icons.close),
                          label: const Text('Close Popover'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.touch_app, color: Colors.purple.shade700),
                    const SizedBox(width: 12),
                    const Text('Tap me for a closable popover', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Debug information
            Card(
              color: Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Current Configuration:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Popover Anchor: ${widget.popoverAnchor.toString().replaceFirst('Alignment.', '')}'),
                    Text('Child Anchor: ${widget.childAnchor.toString().replaceFirst('Alignment.', '')}'),
                    Text('Hide on Tap Outside: ${widget.hideOnTapOutside.name}'),
                    Text('Auto Focus: ${widget.autofocus}'),
                    Text('Direction Padding: ${widget.directionPadding}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoButton(final String text, final IconData icon, final Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3 * 255), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: ElevatedButton.icon(
        onPressed: () {}, // This will be handled by BePopover.automatic
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildStatusPopover(final String title, final String description, final IconData icon, final Color color) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15 * 255),
            blurRadius: 16,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [TextButton(onPressed: () {}, child: const Text('Got it'))],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuPopover() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15 * 255),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMenuItem(Icons.share, 'Share', 'Share this item'),
          _buildMenuItem(Icons.copy, 'Copy', 'Copy to clipboard'),
          _buildMenuItem(Icons.edit, 'Edit', 'Edit properties'),
          const Divider(height: 1),
          _buildMenuItem(Icons.delete, 'Delete', 'Remove item', color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildMenuItem(final IconData icon, final String label, final String tooltip, {final Color? color}) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 12),
              Text(label, style: TextStyle(color: color)),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormPopover(final BePopoverController controller) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15 * 255),
            blurRadius: 16,
            offset: const Offset(0, 6),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Quick Edit Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Display Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: controller.hide, // Close the popover
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: controller.hide,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoPopover(final BePopoverController controller) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.1 * 255),
            blurRadius: 16,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, color: Colors.blue.shade600, size: 28),
              const SizedBox(width: 12),
              const Expanded(
                child: Text('BePopover Features', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildFeatureItem('✓ Automatic positioning', 'Smart placement based on available space'),
          _buildFeatureItem('✓ Click outside to close', 'Intuitive dismissal behavior'),
          _buildFeatureItem('✓ Customizable anchors', 'Control where popover appears'),
          _buildFeatureItem('✓ Animation support', 'Smooth fade and scale transitions'),
          _buildFeatureItem('✓ Programmatic control', 'Close from within popover content'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: controller.hide, // Close the popover
                icon: const Icon(Icons.close),
                label: const Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(final String title, final String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}
