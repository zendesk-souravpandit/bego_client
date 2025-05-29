import 'package:becomponent/src/page/app_settings/app_settings_controller.dart';
import 'package:becomponent/src/page/app_settings/components/settings_scaffold.dart';
import 'package:becomponent/src/page/be_page.dart';
import 'package:becomponent/src/page/be_page_status_resolver.dart';
import 'package:becomponent/src/state/app_state.dart';
import 'package:becore/getx.dart';
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
