import 'package:becomponent/app.dart';
import 'package:becomponent/src/page/app_settings/components/settings_list_tile.dart';
import 'package:becomponent/src/state/list_tile_item.dart';
import 'package:becore/getx.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:flutter/material.dart';

class AppSettingsScaffold extends StatelessWidget {
  const AppSettingsScaffold({super.key});

  @override
  Widget build(final BuildContext context) {
    final controller = Get.find<AppSettingsController>();
    final state = controller.state;

    final settings = [
      ListTileItem(
        icon: BeIcons.icon_fi_rr_user,
        title: 'Account Settings',
        subtitle: 'Manage your account details, passwords, and privacy preferences.',
      ),
      ListTileItem(
        icon: BeIcons.icon_bell,
        title: 'Notifications',
        subtitle: 'Customize when and how you receive notifications.',
      ),
      ListTileItem(
        icon: BeIcons.icon_fi_rr_mobile,
        title: 'Dark Mode',
        subtitle: 'Switch between light, dark, or system themes.',
        trailing: Obx(
          () => Switch(
            value: controller.themeMode.value == ThemeMode.dark,
            onChanged: (_) => controller.toggleTheme(),
          ),
        ),
      ),
      ListTileItem(
        icon: BeIcons.icon_globe_alt,
        title: 'Language',
        subtitle: 'Change the app language',
        onTap: () {},
      ),
    ];

    final otherSettings = [
      ListTileItem(
        icon: BeIcons.icon_fi_rr_lock,
        title: 'Privacy & Security',
        subtitle: 'Control data permissions, app lock, and security settings.',
      ),
      ListTileItem(
        icon: BeIcons.icon_fi_rr_data_transfer,
        title: 'Data Usage',
        subtitle: 'Manage how the app uses cellular or Wi-Fi data.',
      ),
      ListTileItem(
        icon: BeIcons.icon_fi_rr_folder,
        title: 'Storage',
        subtitle: 'View and clear app cache and stored data.',
      ),
      ListTileItem(
        icon: BeIcons.icon_fi_rr_laptop,
        title: 'About',
        subtitle: 'View app information, version details, licenses, and legal info.',
      ),
      ListTileItem(
        icon: BeIcons.icon_hello,
        title: 'Help & Support',
        subtitle: 'Access FAQs, contact support, or send feedback.',
        onTap: () {},
      ),
    ];

    final appInfo = [
      ListTileItem(
        icon: BeIcons.icon_fi_rr_info,
        title: 'App Name',
        subtitle: state.appName,
        onTap: () {},
      ),
      ListTileItem(icon: BeIcons.icon_fi_rr_apps, title: 'Package Name', subtitle: state.package),
      ListTileItem(icon: BeIcons.icon_attribution, title: 'Version', subtitle: state.version),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _Section(title: 'Settings', items: settings),
          _Section(title: 'Other settings', items: otherSettings),
          _Section(title: 'App Info', items: appInfo),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.items});

  final String title;
  final List<ListTileItem> items;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeText.bodyLarge(title, padding: pt12 + px16),
        Card(
          child: Column(
            children: items.map((final item) => SettingsListTile(model: item)).toList(),
          ),
        ),
      ],
    );
  }
}
