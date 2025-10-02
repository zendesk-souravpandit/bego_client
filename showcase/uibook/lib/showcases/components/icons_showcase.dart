import 'package:beui/be_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// BeIcons Showcase
@widgetbook.UseCase(name: 'BeIcons Library', path: 'Components/Icons', type: Widget)
Widget beIconsLibraryShowcase(final BuildContext context) {
  final iconSize = context.knobs.double.slider(label: 'Icon Size', initialValue: 24.0, min: 16.0, max: 64.0);
  final iconColor = context.knobs.colorOrNull(label: 'Icon Color') ?? Colors.black;
  final searchText = context.knobs.string(label: 'Search Icons', initialValue: '');

  // Get all icons from BeIcons
  final allIcons = <_IconInfo>[];

  // Add some common BeIcons from the actual library
  final commonBeIcons = <_IconInfo>[
    const _IconInfo('add', BeIcons.icon_add),
    const _IconInfo('home', BeIcons.icon_home),
    const _IconInfo('menu', BeIcons.icon_menu),
    const _IconInfo('search', BeIcons.icon_search),
    const _IconInfo('settings', BeIcons.icon_settings),
    const _IconInfo('star', BeIcons.icon_star),
    const _IconInfo('youtube', BeIcons.icon_youtube),
    const _IconInfo('check', BeIcons.icon_check),
    const _IconInfo('close', BeIcons.icon_close),
    const _IconInfo('volume', BeIcons.icon_volume),
    const _IconInfo('website', BeIcons.icon_website),
    const _IconInfo('webcam', BeIcons.icon_webcam),
    const _IconInfo('whatsapp', BeIcons.icon_whatsapp),
  ];

  allIcons.addAll(commonBeIcons);

  // Filter icons based on search
  final filteredIcons =
      searchText.isEmpty
          ? allIcons
          : allIcons.where((final icon) => icon.name.toLowerCase().contains(searchText.toLowerCase())).toList();

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('BeIcons Showcase', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Custom icon font with ${allIcons.length}+ icons', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),

          if (filteredIcons.isEmpty) ...[
            const SizedBox(height: 64),
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
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: filteredIcons.length,
              itemBuilder: (final context, final index) {
                final iconInfo = filteredIcons[index];
                return _IconTile(iconInfo: iconInfo, size: iconSize, color: iconColor);
              },
            ),
          ],
        ],
      ),
    ),
  );
}

// Standard Icons Grid Showcase
@widgetbook.UseCase(name: 'Standard Icons Grid', path: 'Components/Icons', type: BeIcons)
Widget standardIconsGridShowcase(final BuildContext context) {
  final color = context.knobs.colorOrNull(label: 'Color');
  final size = context.knobs.double.slider(label: 'Size', initialValue: 32.0, min: 16.0, max: 64.0);

  // Sample icons for demonstration
  final sampleIcons = <_IconInfo>[
    const _IconInfo('add', BeIcons.icon_add),
    const _IconInfo('home', BeIcons.icon_home),
    const _IconInfo('menu', BeIcons.icon_menu),
    const _IconInfo('search', BeIcons.icon_search),
    const _IconInfo('settings', BeIcons.icon_settings),
    const _IconInfo('star', BeIcons.icon_star),
    const _IconInfo('youtube', BeIcons.icon_youtube),
    const _IconInfo('check', BeIcons.icon_check),
    const _IconInfo('close', BeIcons.icon_close),
    const _IconInfo('volume', BeIcons.icon_volume),
    const _IconInfo('website', BeIcons.icon_website),
    const _IconInfo('whatsapp', BeIcons.icon_whatsapp),
  ];

  return GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    ),
    itemCount: sampleIcons.length,
    itemBuilder: (final context, final index) {
      final iconInfo = sampleIcons[index];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconInfo.icon, size: size, color: color),
          const SizedBox(height: 8),
          Text(
            iconInfo.name,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    },
  );
}

// Helper classes
class _IconInfo {
  const _IconInfo(this.name, this.icon);
  final String name;
  final IconData icon;
}

class _IconTile extends StatelessWidget {
  const _IconTile({required this.iconInfo, required this.size, required this.color});

  final _IconInfo iconInfo;
  final double size;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _copyIconName(context),
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
              Icon(iconInfo.icon, size: size, color: color),
              const SizedBox(height: 8),
              Text(
                iconInfo.name,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copyIconName(final BuildContext context) {
    Clipboard.setData(ClipboardData(text: 'BeIcons.icon_${iconInfo.name}'));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied: BeIcons.icon_${iconInfo.name}'), duration: const Duration(seconds: 2)),
    );
  }
}
