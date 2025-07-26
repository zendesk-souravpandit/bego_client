import 'package:beui/overlay.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BePopover', path: 'widget/overlay', type: BePopover)
Widget useCaseBePopover(final BuildContext context) {
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

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BePopover Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),

          const Text('Automatic Popovers:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('These popovers show automatically when tapped', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              BePopover.automatic(
                popoverAnchor: popoverAnchor,
                childAnchor: childAnchor,
                hideOnTapOutside: hideOnTapOutside,
                autofocus: autofocus,
                directionPadding: directionPadding,
                popoverBuilder:
                    (final context, final decoration, final child) => _buildSimplePopover('Simple Tooltip', Icons.info),
                child: ElevatedButton(onPressed: () {}, child: const Text('Simple Tooltip')),
              ),

              BePopover.automatic(
                popoverAnchor: popoverAnchor,
                childAnchor: childAnchor,
                hideOnTapOutside: hideOnTapOutside,
                autofocus: autofocus,
                directionPadding: directionPadding,
                popoverBuilder: (final context, final decoration, final child) => _buildMenuPopover(),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  label: const Text('Menu'),
                ),
              ),

              BePopover.automatic(
                popoverAnchor: popoverAnchor,
                childAnchor: childAnchor,
                hideOnTapOutside: hideOnTapOutside,
                autofocus: autofocus,
                directionPadding: directionPadding,
                popoverBuilder: (final context, final decoration, final child) => _buildFormPopover(),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          const Text('Manual Control Popovers:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('These popovers are controlled programmatically', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          _ManualPopoverExample(
            popoverAnchor: popoverAnchor,
            childAnchor: childAnchor,
            hideOnTapOutside: hideOnTapOutside,
            autofocus: autofocus,
            directionPadding: directionPadding,
          ),

          const SizedBox(height: 40),
          const Text('Popover Positions:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('Different anchor combinations', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),

          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Center target
                  Center(
                    child: BePopover.automatic(
                      popoverAnchor: Alignment.topCenter,
                      childAnchor: Alignment.bottomCenter,
                      hideOnTapOutside: hideOnTapOutside,
                      popoverBuilder:
                          (final context, final decoration, final child) =>
                              _buildSimplePopover('Center', Icons.center_focus_strong),
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.center_focus_strong, color: Colors.blue),
                      ),
                    ),
                  ),

                  // Corner positions
                  Positioned(
                    top: 10,
                    left: 10,
                    child: BePopover.automatic(
                      popoverAnchor: Alignment.bottomRight,
                      childAnchor: Alignment.topLeft,
                      hideOnTapOutside: hideOnTapOutside,
                      popoverBuilder:
                          (final context, final decoration, final child) =>
                              _buildSimplePopover('Top Left', Icons.north_west),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.north_west, color: Colors.green, size: 20),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: BePopover.automatic(
                      popoverAnchor: Alignment.bottomLeft,
                      childAnchor: Alignment.topRight,
                      hideOnTapOutside: hideOnTapOutside,
                      popoverBuilder:
                          (final context, final decoration, final child) =>
                              _buildSimplePopover('Top Right', Icons.north_east),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.north_east, color: Colors.orange, size: 20),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: BePopover.automatic(
                      popoverAnchor: Alignment.topRight,
                      childAnchor: Alignment.bottomLeft,
                      hideOnTapOutside: hideOnTapOutside,
                      popoverBuilder:
                          (final context, final decoration, final child) =>
                              _buildSimplePopover('Bottom Left', Icons.south_west),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.south_west, color: Colors.purple, size: 20),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: BePopover.automatic(
                      popoverAnchor: Alignment.topLeft,
                      childAnchor: Alignment.bottomRight,
                      hideOnTapOutside: hideOnTapOutside,
                      popoverBuilder:
                          (final context, final decoration, final child) =>
                              _buildSimplePopover('Bottom Right', Icons.south_east),
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.south_east, color: Colors.red, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),
          const Text(
            'Adjust the knobs above to see how different anchor positions affect popover placement',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget _buildSimplePopover(final String title, final IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
    ),
    child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 20), const SizedBox(width: 8), Text(title)]),
  );
}

Widget _buildMenuPopover() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMenuItem(Icons.share, 'Share'),
        _buildMenuItem(Icons.copy, 'Copy'),
        _buildMenuItem(Icons.edit, 'Edit'),
        const Divider(height: 1),
        _buildMenuItem(Icons.delete, 'Delete', color: Colors.red),
      ],
    ),
  );
}

Widget _buildMenuItem(final IconData icon, final String label, {final Color? color}) {
  return InkWell(
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
        ],
      ),
    ),
  );
}

Widget _buildFormPopover() {
  return Container(
    width: 250,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4))],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Edit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text('Cancel')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Save')),
          ],
        ),
      ],
    ),
  );
}

class _ManualPopoverExample extends StatefulWidget {
  const _ManualPopoverExample({
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
  State<_ManualPopoverExample> createState() => _ManualPopoverExampleState();
}

class _ManualPopoverExampleState extends State<_ManualPopoverExample> with TickerProviderStateMixin {
  late BePopoverController _controller1;
  late BePopoverController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = BePopoverController(vsync: this);
    _controller2 = BePopoverController(vsync: this);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(onPressed: () => _controller1.show(), child: const Text('Show Notification')),
            const SizedBox(width: 12),
            ElevatedButton(onPressed: () => _controller1.hide(), child: const Text('Hide')),
            const SizedBox(width: 12),
            ElevatedButton(onPressed: () => _controller1.toggle(), child: const Text('Toggle')),
          ],
        ),
        const SizedBox(height: 16),
        BePopover(
          controller: _controller1,
          popoverAnchor: widget.popoverAnchor,
          childAnchor: widget.childAnchor,
          hideOnTapOutside: widget.hideOnTapOutside,
          autofocus: widget.autofocus,
          directionPadding: widget.directionPadding,
          popoverBuilder:
              (final context, final decoration, final child) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade200),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.notifications_active, color: Colors.amber.shade700, size: 32),
                    const SizedBox(height: 8),
                    const Text('Notification', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('This is a manually controlled popover'),
                  ],
                ),
              ),
          child: Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade300),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.notifications, color: Colors.blue), Text('Target', style: TextStyle(fontSize: 12))],
            ),
          ),
        ),
      ],
    );
  }
}
