import 'package:flutter/material.dart';

/// Example demonstrating OverlayPortal enhancements in Flutter 3.38
///
/// New Features:
/// 1. overlayChildLayoutBuilder - Render child in any Overlay up the tree
/// 2. More robust Overlay.of method
/// 3. Better control over floating UI elements
void main() {
  runApp(const OverlayPortalExampleApp());
}

class OverlayPortalExampleApp extends StatelessWidget {
  const OverlayPortalExampleApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'OverlayPortal Enhancements Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const OverlayPortalDemoPage(),
    );
  }
}

class OverlayPortalDemoPage extends StatelessWidget {
  const OverlayPortalDemoPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('OverlayPortal Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SectionHeader(title: 'Basic OverlayPortal', description: 'Simple tooltip overlay attached to a button'),
          SizedBox(height: 8),
          BasicOverlayExample(),

          SizedBox(height: 32),
          _SectionHeader(
            title: 'App-Wide Notification',
            description:
                'Uses overlayChildLayoutBuilder to show notification '
                'in root overlay, escaping parent constraints',
          ),
          SizedBox(height: 8),
          AppWideNotificationExample(),

          SizedBox(height: 32),
          _SectionHeader(
            title: 'Custom Positioned Overlay',
            description: 'Advanced positioning with overlayChildLayoutBuilder',
          ),
          SizedBox(height: 8),
          CustomPositionedOverlayExample(),

          SizedBox(height: 32),
          _SectionHeader(
            title: 'Nested Overlay Context',
            description: 'Demonstrates rendering in different overlay levels',
          ),
          SizedBox(height: 8),
          NestedOverlayExample(),
        ],
      ),
    );
  }
}

/// Section header widget
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600], fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

/// Example 1: Basic OverlayPortal usage
class BasicOverlayExample extends StatefulWidget {
  const BasicOverlayExample({super.key});

  @override
  State<BasicOverlayExample> createState() => _BasicOverlayExampleState();
}

class _BasicOverlayExampleState extends State<BasicOverlayExample> {
  final OverlayPortalController _controller = OverlayPortalController();
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Hover or tap the button to show tooltip'),
            const SizedBox(height: 16),
            CompositedTransformTarget(
              link: _layerLink,
              child: OverlayPortal(
                controller: _controller,
                overlayChildBuilder: (final BuildContext context) {
                  return CompositedTransformFollower(
                    link: _layerLink,
                    targetAnchor: Alignment.bottomCenter,
                    followerAnchor: Alignment.topCenter,
                    offset: const Offset(0, 8),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(8)),
                        child: const Text('This is a tooltip overlay!', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );
                },
                child: ElevatedButton(onPressed: _controller.toggle, child: const Text('Toggle Tooltip')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Example 2: App-wide notification using overlayChildLayoutBuilder
/// This is the key enhancement in Flutter 3.38
class AppWideNotificationExample extends StatefulWidget {
  const AppWideNotificationExample({super.key});

  @override
  State<AppWideNotificationExample> createState() => _AppWideNotificationExampleState();
}

class _AppWideNotificationExampleState extends State<AppWideNotificationExample> {
  final OverlayPortalController _controller = OverlayPortalController();

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: OverlayPortal(
          controller: _controller,
          // NEW in Flutter 3.38: overlayChildLayoutBuilder
          // Allows rendering in any Overlay up the tree
          // overlayLocation: OverlayChildLocation.nearestOverlay,
          overlayChildBuilder: (final BuildContext overlayContext) {
            // This overlay will render in the root Overlay,
            // escaping any parent layout constraints
            return Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'App-wide notification!\nEscapes parent constraints.',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: _controller.hide,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Column(
            children: [
              const Text('This notification will appear at the top of the entire app', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  _controller.show();
                  // Auto-hide after 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    if (mounted && _controller.isShowing) {
                      _controller.hide();
                    }
                  });
                },
                icon: const Icon(Icons.notifications),
                label: const Text('Show Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Example 3: Custom positioned overlay with layout builder
class CustomPositionedOverlayExample extends StatefulWidget {
  const CustomPositionedOverlayExample({super.key});

  @override
  State<CustomPositionedOverlayExample> createState() => _CustomPositionedOverlayExampleState();
}

class _CustomPositionedOverlayExampleState extends State<CustomPositionedOverlayExample> {
  final OverlayPortalController _controller = OverlayPortalController();
  Alignment _position = Alignment.center;

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            OverlayPortal(
              controller: _controller,
              overlayChildBuilder: (final BuildContext context) {
                return AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: _position,
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 48),
                          const SizedBox(height: 8),
                          const Text(
                            'Custom Positioned!',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(onPressed: _controller.hide, child: const Text('Close')),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const SizedBox.shrink(),
            ),
            const Text('Choose position and show overlay:'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _PositionButton(
                  label: 'Top Left',
                  alignment: Alignment.topLeft,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Top Center',
                  alignment: Alignment.topCenter,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Top Right',
                  alignment: Alignment.topRight,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Center',
                  alignment: Alignment.center,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Bottom Left',
                  alignment: Alignment.bottomLeft,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Bottom Center',
                  alignment: Alignment.bottomCenter,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
                _PositionButton(
                  label: 'Bottom Right',
                  alignment: Alignment.bottomRight,
                  onPressed: (final alignment) {
                    setState(() => _position = alignment);
                    _controller.show();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PositionButton extends StatelessWidget {
  const _PositionButton({required this.label, required this.alignment, required this.onPressed});
  final String label;
  final Alignment alignment;
  final void Function(Alignment) onPressed;

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(alignment),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}

/// Example 4: Nested overlay context
/// Demonstrates rendering in different overlay levels
class NestedOverlayExample extends StatefulWidget {
  const NestedOverlayExample({super.key});

  @override
  State<NestedOverlayExample> createState() => _NestedOverlayExampleState();
}

class _NestedOverlayExampleState extends State<NestedOverlayExample> {
  final OverlayPortalController _localController = OverlayPortalController();
  final OverlayPortalController _rootController = OverlayPortalController();

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Local overlay (constrained to this container)
              Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (final BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Nested Overlay Container'),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Local overlay portal
                              OverlayPortal(
                                controller: _localController,
                                overlayChildBuilder: (final BuildContext context) {
                                  return Center(
                                    child: Material(
                                      elevation: 4,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Local Overlay',
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              '(Contained)',
                                              style: TextStyle(color: Colors.white70, fontSize: 12),
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: _localController.hide,
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ElevatedButton(
                                  onPressed: _localController.show,
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                                  child: const Text('Local Overlay'),
                                ),
                              ),
                              // Root overlay portal
                              OverlayPortal(
                                controller: _rootController,
                                overlayChildBuilder: (final BuildContext context) {
                                  // This renders in the root overlay
                                  return Positioned(
                                    top: 100,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Material(
                                        elevation: 8,
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          padding: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                'Root Overlay',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                '(Escapes container)',
                                                style: TextStyle(color: Colors.white70),
                                              ),
                                              const SizedBox(height: 16),
                                              ElevatedButton(
                                                onPressed: _rootController.hide,
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ElevatedButton(
                                  onPressed: _rootController.show,
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                  child: const Text('Root Overlay'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
