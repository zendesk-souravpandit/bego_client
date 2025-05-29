import 'package:becomponent/app.dart';
import 'package:becomponent/src/state/list_tile_item.dart';
import 'package:becore/getx.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';

class AppSettingsScaffold extends StatelessWidget {
  const AppSettingsScaffold({super.key});
  @override
  Widget build(final BuildContext context) {
    final AppSettingsController controller = Get.find<AppSettingsController>();
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
        trailing: Obx(() {
          return Switch(
            value: controller.themeMode.value == ThemeMode.dark,
            onChanged: (final v) => controller.toggleTheme(),
          );
        }),
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
        children: [
          Column(
            children: [
              const ListTile(
                title: BeText.bodyLarge('Settings'),
                // subtitle: BeText.bodySmall('App Information', color: BeColors.gray400),
              ),
              ...settings.map((final setting) {
                return SettingsListTile(model: setting);
              }),

              const ListTile(
                title: BeText.bodyLarge('Other settings'),
                // subtitle: BeText.bodySmall('App Information', color: BeColors.gray400),
              ),
              ...otherSettings.map((final setting) {
                return SettingsListTile(model: setting);
              }),
              const ListTile(
                title: BeText.bodyLarge('App Info'),
                // subtitle: BeText.bodySmall('App Information', color: BeColors.gray400),
              ),
              ...appInfo.map((final setting) {
                return SettingsListTile(model: setting);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key, required this.model});

  final ListTileItem model;
  @override
  Widget build(final BuildContext context) {
    print('SettingsListTile: ${model.title}');
    return ListTile(
      leading: Obx(() {
        final isDarkMode = Get.find<AppThemeController>().themeMode.value == ThemeMode.dark;
        return Container(
          padding: p8,
          decoration: ShapeDecoration(
            color: Color(stringToColor(model.icon.toString(), lightTone: !isDarkMode)),
            shape: const RoundedSuperellipseBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              // side: BorderSide(color: BeColors.gray100, width: 2.0),
            ),
          ),
          child: Icon(
            model.icon,
            color: isDarkMode ? BeColors.slate200 : BeColors.slate700,
            size: 24.0,
          ),
        );
      }),
      title: BeText.bodyMedium(model.title),
      subtitle: BeText.bodySmall(model.subtitle, color: BeColors.gray400),
      onTap: model.onTap ?? () {},
      trailing:
          model.trailing ?? (model.onTap != null ? const Icon(BeIcons.icon_chevron_right) : null),
      // iconColor: BeColors.primary,
    );
  }
}
