import 'package:beui/be_icons.dart';
import 'package:beui/mulitchild.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeMultiBadge', path: 'widget/multichild', type: BeMultiBadge)
Widget useCaseBeMultiBadge(final BuildContext context) {
  final rounded = context.knobs.boolean(label: 'Rounded', initialValue: false);
  final badgeCount = context.knobs.int.slider(label: 'Badge Count', initialValue: 3, min: 1, max: 6);

  // Create a list of badges based on the count
  final badges = List.generate(badgeCount, (final index) {
    const positions = BeMultiBadgePosition.values;
    return BeBadgeChild(
      position: positions[index % positions.length],
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _getBadgeColor(index),
          borderRadius: BorderRadius.circular(rounded ? 12 : 4),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2 * 255), blurRadius: 2, offset: const Offset(0, 1)),
          ],
        ),
        child: _getBadgeContent(index),
      ),
    );
  });

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeMultiBadge Examples:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),

          // Main customizable example
          Center(
            child: BeMultiBadge(
              rounded: rounded,
              labels: badges,
              child: _buildExampleCard('Dynamic Multi-Badge', Colors.blue),
            ),
          ),

          const SizedBox(height: 32),

          // Practical examples grid
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // Social media profile
              BeMultiBadge(
                rounded: true,
                labels: [
                  BeBadgeChild(
                    position: BeMultiBadgePosition.topRight,
                    child: _buildBadge('5', Colors.red, isCircle: true),
                  ),
                  BeBadgeChild(position: BeMultiBadgePosition.bottomRight, child: _buildStatusBadge(Colors.green)),
                ],
                child: _buildProfileAvatar(),
              ),

              // E-commerce product
              BeMultiBadge(
                rounded: false,
                labels: [
                  BeBadgeChild(position: BeMultiBadgePosition.topLeft, child: _buildBadge('NEW', Colors.orange)),
                  BeBadgeChild(position: BeMultiBadgePosition.topRight, child: _buildBadge('20% OFF', Colors.red)),
                  BeBadgeChild(position: BeMultiBadgePosition.bottomLeft, child: _buildRatingBadge()),
                ],
                child: _buildProductCard(),
              ),

              // Notification icon
              BeMultiBadge(
                rounded: true,
                labels: [
                  BeBadgeChild(
                    position: BeMultiBadgePosition.topRight,
                    child: _buildBadge('12', Colors.red, isCircle: true),
                  ),
                  BeBadgeChild(
                    position: BeMultiBadgePosition.bottomRight,
                    child: _buildBadge('!', Colors.orange, isCircle: true),
                  ),
                ],
                child: _buildIconContainer(BeIcons.icon_notifications, Colors.purple),
              ),

              // Document with multiple statuses
              BeMultiBadge(
                rounded: false,
                labels: [
                  BeBadgeChild(position: BeMultiBadgePosition.topLeft, child: _buildBadge('DRAFT', Colors.grey)),
                  BeBadgeChild(position: BeMultiBadgePosition.topRight, child: _buildBadge('URGENT', Colors.red)),
                  BeBadgeChild(
                    position: BeMultiBadgePosition.bottomCenter,
                    child: _buildBadge('3 Comments', Colors.blue),
                  ),
                ],
                child: _buildDocumentCard(),
              ),

              // Gaming achievement
              BeMultiBadge(
                rounded: true,
                labels: [
                  BeBadgeChild(position: BeMultiBadgePosition.topCenter, child: _buildBadge('LVL 5', Colors.purple)),
                  BeBadgeChild(
                    position: BeMultiBadgePosition.centerLeft,
                    child: _buildBadge('🏆', Colors.yellow, isCircle: true),
                  ),
                  BeBadgeChild(
                    position: BeMultiBadgePosition.centerRight,
                    child: _buildBadge('NEW', Colors.green, isCircle: true),
                  ),
                ],
                child: _buildGameCard(),
              ),

              // Message thread
              BeMultiBadge(
                rounded: false,
                labels: [
                  BeBadgeChild(
                    position: BeMultiBadgePosition.topRight,
                    child: _buildBadge('5', Colors.red, isCircle: true),
                  ),
                  BeBadgeChild(position: BeMultiBadgePosition.bottomLeft, child: _buildBadge('Online', Colors.green)),
                  BeBadgeChild(
                    position: BeMultiBadgePosition.bottomRight,
                    child: _buildBadge('Typing...', Colors.blue),
                  ),
                ],
                child: _buildChatCard(),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text('Use Cases:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            '• Social media profiles with multiple status indicators\n'
            '• E-commerce products with multiple promotional badges\n'
            '• Notification systems with priority levels\n'
            '• Document management with status indicators\n'
            '• Gaming interfaces with achievements and levels\n'
            '• Chat applications with multiple status badges',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

Color _getBadgeColor(final int index) {
  final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];
  return colors[index % colors.length];
}

Widget _getBadgeContent(final int index) {
  final contents = [
    const Icon(Icons.star, color: Colors.white, size: 12),
    const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    const Icon(Icons.favorite, color: Colors.white, size: 10),
    const Text('HOT', style: TextStyle(color: Colors.white, fontSize: 10)),
    const Icon(Icons.flash_on, color: Colors.white, size: 12),
    const Text('99+', style: TextStyle(color: Colors.white, fontSize: 10)),
  ];
  return contents[index % contents.length];
}

Widget _buildExampleCard(final String title, final Color color) {
  return Container(
    width: 120,
    height: 80,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1 * 255),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ),
  );
}

Widget _buildBadge(final String text, final Color color, {final bool isCircle = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: isCircle ? 6 : 8, vertical: isCircle ? 6 : 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(isCircle ? 12 : 4),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.2 * 255), blurRadius: 2, offset: const Offset(0, 1)),
      ],
    ),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
  );
}

Widget _buildStatusBadge(final Color color) {
  return Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
  );
}

Widget _buildProfileAvatar() {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      shape: BoxShape.circle,
      image: const DecorationImage(image: NetworkImage('https://picsum.photos/60/60?random=1'), fit: BoxFit.cover),
    ),
  );
}

Widget _buildProductCard() {
  return Container(
    width: 100,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Center(child: Icon(Icons.shopping_bag, color: Colors.grey)),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0), child: Text('Product', style: TextStyle(fontSize: 12))),
      ],
    ),
  );
}

Widget _buildRatingBadge() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4)),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.white, size: 8),
        SizedBox(width: 2),
        Text('4.5', style: TextStyle(color: Colors.white, fontSize: 8)),
      ],
    ),
  );
}

Widget _buildIconContainer(final IconData icon, final Color color) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1 * 255),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(icon, color: color, size: 24),
  );
}

Widget _buildDocumentCard() {
  return Container(
    width: 80,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.description, color: Colors.grey, size: 32), Text('Doc', style: TextStyle(fontSize: 10))],
    ),
  );
}

Widget _buildGameCard() {
  return Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple.shade300, Colors.blue.shade300],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(child: Icon(Icons.games, color: Colors.white, size: 32)),
  );
}

Widget _buildChatCard() {
  return Container(
    width: 100,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.1 * 255), blurRadius: 4, offset: const Offset(0, 2)),
      ],
    ),
    child: const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 16, color: Colors.white),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('John Doe', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              Text('Last message...', style: TextStyle(fontSize: 8, color: Colors.grey)),
            ],
          ),
        ),
      ],
    ),
  );
}
