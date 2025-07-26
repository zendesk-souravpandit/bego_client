import 'package:beui/be_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeIcons', path: 'widget/icons', type: Widget)
Widget useCaseBeIcons(final BuildContext context) {
  final iconSize = context.knobs.double.slider(label: 'Icon Size', initialValue: 24.0, min: 16.0, max: 64.0);

  final iconColor = context.knobs.colorOrNull(label: 'Icon Color') ?? Colors.black;

  final searchText = context.knobs.string(label: 'Search Icons', initialValue: '');

  // Sample of commonly used BeIcons (using verified icon names from the font)
  final commonIcons = <String, IconData>{
    'home': BeIcons.icon_home,
    'user': BeIcons.icon_user,
    'profile': BeIcons.icon_profile,
    'settings': BeIcons.icon_settings,
    'search': BeIcons.icon_search,
    'message': BeIcons.icon_message,
    'phone': BeIcons.icon_phone,
    'email': BeIcons.icon_email_1,
    'calendar': BeIcons.icon_calendar_1,
    'camera': BeIcons.icon_camera,
    'music': BeIcons.icon_music,
    'play': BeIcons.icon_play,
    'volume': BeIcons.icon_volume,
    'heart': BeIcons.icon_heart,
    'star': BeIcons.icon_star,
    'bookmark': BeIcons.icon_bookmark,
    'like': BeIcons.icon_like,
    'share': BeIcons.icon_share,
    'file': BeIcons.icon_file,
    'folder': BeIcons.icon_folder,
    'document': BeIcons.icon_file_document,
    'lock': BeIcons.icon_lock,
    'key': BeIcons.icon_key,
    'globe': BeIcons.icon_globe,
    'signal': BeIcons.icon_signal,
    'battery': BeIcons.icon_battery,
    'sun': BeIcons.icon_sun,
    'moon': BeIcons.icon_moon,
    'cloud': BeIcons.icon_cloud_1,
    'weather': BeIcons.icon_weather_app,
    'shopping_cart': BeIcons.icon_shopping_cart,
    'shopping_bag': BeIcons.icon_shopping_bag,
    'gift': BeIcons.icon_gift,
    'money': BeIcons.icon_money,
    'bank': BeIcons.icon_bank,
    'time': BeIcons.icon_time,
    'timer': BeIcons.icon_timer,
    'clock': BeIcons.icon_clock,
    'alarm': BeIcons.icon_alarm,
    'notifications': BeIcons.icon_notifications,
    'photoscan': BeIcons.icon_photoscan,
    'video': BeIcons.icon_video_calling_app,
    'pause': BeIcons.icon_play_pause,
    'stop': BeIcons.icon_play_stop,
    'copy': BeIcons.icon_copy,
    'cut': BeIcons.icon_cut,
    'undo': BeIcons.icon_undo,
    'redo': BeIcons.icon_redo,
    'printer': BeIcons.icon_printer,
    'security': BeIcons.icon_shield,
    'maps': BeIcons.icon_maps,
    'compass': BeIcons.icon_compass,
    'worldwide': BeIcons.icon_worldwide,
    'info': BeIcons.icon_info,
    'edition': BeIcons.icon_edition,
    'save_money': BeIcons.icon_save_money,
    'printing': BeIcons.icon_printing,
  };

  // Filter icons based on search
  final filteredIcons =
      searchText.isEmpty
          ? commonIcons
          : Map<String, IconData>.fromEntries(
            commonIcons.entries.where((final entry) => entry.key.toLowerCase().contains(searchText.toLowerCase())),
          );

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeIcons Showcase:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Custom icon font with ${commonIcons.length}+ icons', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),

          if (filteredIcons.isEmpty) ...[
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text('No icons found for "$searchText"', style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 8),
                  const Text('Try a different search term', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ] else ...[
            Text('Showing ${filteredIcons.length} icons', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: filteredIcons.length,
              itemBuilder: (final context, final index) {
                final entry = filteredIcons.entries.elementAt(index);
                return _buildIconCard(context, entry.key, entry.value, iconSize, iconColor);
              },
            ),
          ],

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),

          const Text('Usage Examples:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          _buildUsageExample('Icon Button', BeIcons.icon_heart, iconSize, iconColor),
          const SizedBox(height: 12),
          _buildUsageExample('Navigation Item', BeIcons.icon_home, iconSize, iconColor),
          const SizedBox(height: 12),
          _buildUsageExample('Action Button', BeIcons.icon_share, iconSize, iconColor),
          const SizedBox(height: 12),
          _buildUsageExample('Status Indicator', BeIcons.icon_notifications, iconSize, iconColor),

          const SizedBox(height: 32),
          const Text('Different Sizes:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Row(
            children: [
              _buildSizeExample(BeIcons.icon_star, 16, iconColor, '16px'),
              const SizedBox(width: 20),
              _buildSizeExample(BeIcons.icon_star, 24, iconColor, '24px'),
              const SizedBox(width: 20),
              _buildSizeExample(BeIcons.icon_star, 32, iconColor, '32px'),
              const SizedBox(width: 20),
              _buildSizeExample(BeIcons.icon_star, 48, iconColor, '48px'),
              const SizedBox(width: 20),
              _buildSizeExample(BeIcons.icon_star, 64, iconColor, '64px'),
            ],
          ),

          const SizedBox(height: 32),
          const Text('Different Colors:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          Row(
            children: [
              _buildColorExample(BeIcons.icon_heart, iconSize, Colors.red, 'Red'),
              const SizedBox(width: 20),
              _buildColorExample(BeIcons.icon_heart, iconSize, Colors.blue, 'Blue'),
              const SizedBox(width: 20),
              _buildColorExample(BeIcons.icon_heart, iconSize, Colors.green, 'Green'),
              const SizedBox(width: 20),
              _buildColorExample(BeIcons.icon_heart, iconSize, Colors.orange, 'Orange'),
              const SizedBox(width: 20),
              _buildColorExample(BeIcons.icon_heart, iconSize, Colors.purple, 'Purple'),
            ],
          ),

          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(BeIcons.icon_info, color: Colors.blue.shade600),
                    const SizedBox(width: 8),
                    const Text('Usage', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Import: import \'package:beui/be_icons.dart\';'),
                const SizedBox(height: 4),
                const Text('Usage: Icon(BeIcons.icon_name)'),
                const SizedBox(height: 4),
                const Text('Font Family: BeIcons'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildIconCard(
  final BuildContext context,
  final String name,
  final IconData iconData,
  final double size,
  final Color color,
) {
  return InkWell(
    onTap: () {
      Clipboard.setData(ClipboardData(text: 'BeIcons.icon_$name'));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied: BeIcons.icon_$name')));
    },
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: size, color: color),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildUsageExample(final String label, final IconData icon, final double size, final Color color) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Icon(icon, size: size, color: color),
        const SizedBox(width: 12),
        Text(label),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
          child: Text('${size.toInt()}px', style: const TextStyle(fontSize: 12)),
        ),
      ],
    ),
  );
}

Widget _buildSizeExample(final IconData icon, final double size, final Color color, final String label) {
  return Column(
    children: [
      Icon(icon, size: size, color: color),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}

Widget _buildColorExample(final IconData icon, final double size, final Color color, final String label) {
  return Column(
    children: [
      Icon(icon, size: size, color: color),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}
