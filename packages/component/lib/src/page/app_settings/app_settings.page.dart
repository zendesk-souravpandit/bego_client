import 'package:becomponent/src/page/app_settings/app_settings_controller.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:becomponent/src/state/app_state.dart';
import 'package:becore/getx.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class AppSettingsPage extends BePage<AppState, AppSettingsController> {
  AppSettingsPage({super.key})
    : super(
        statusResolver: BePageStatusWidgetResolver<AppSettingsController>(
          successBuilder: (final BuildContext context, final AppSettingsController controller) {
            return const AppSettingsScaffold();
          },
        ),
      );

  @override
  AppSettingsController get controller => Get.find<AppSettingsController>();
}

class AppSettingsScaffold extends StatelessWidget {
  const AppSettingsScaffold({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: ListView(
        children: [
          BeText.titleMedium('User', padding: px16 + py4),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 1,
            // color: Colors.blue,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ...settings.map((final setting) {
                  return SettingsListTile(model: setting);
                }),
              ],
            ),
          ),
          BeText.titleMedium('User', padding: px16 + py4),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 1,
            // color: Colors.blue,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ...settings.map((final setting) {
                  return SettingsListTile(model: setting);
                }),
              ],
            ),
          ),
          BeText.titleMedium('User', padding: px16 + py4),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 1,
            // color: Colors.blue,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ...settings.map((final setting) {
                  return SettingsListTile(model: setting);
                }),
              ],
            ),
          ),
          BeText.titleMedium('User', padding: px16 + py4),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 1,
            // color: Colors.blue,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ...settings.map((final setting) {
                  return SettingsListTile(model: setting);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final settings = [
  ListTileModel(icon: BeIcons.icon_peach, title: 'Profile Settings', subtitle: 'Manage your profile settings'),
  ListTileModel(
    icon: BeIcons.icon_apple,
    title: 'Notification Settings',
    subtitle: 'Manage your notification preferences',
  ),
  ListTileModel(icon: BeIcons.icon_band_aid, title: 'Security Settings', subtitle: 'Manage your security settings'),
  ListTileModel(icon: BeIcons.icon_fi_rr_speaker, title: 'Language Settings', subtitle: 'Change the app language'),
];

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key, required this.model});

  final ListTileModel model;
  @override
  Widget build(final BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(model.icon),
      title: BeText.bodyMedium(model.title),
      subtitle: BeText.bodySmall(model.subtitle, color: BeColors.gray400),
      onTap: model.onTap,
      trailing: const Icon(BeIcons.icon_chevron_right),
    );
  }
}

class ListTileModel {
  ListTileModel({required this.icon, required this.title, required this.subtitle, this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
}
