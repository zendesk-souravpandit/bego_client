import 'package:becomponent/app.dart';
import 'package:becore/getx.dart';
import 'package:becore/model.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/text.dart';
import 'package:beui/theme.dart';
import 'package:flutter/material.dart';

class LocalePickerWidget extends StatelessWidget {
  const LocalePickerWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    final controller = Get.find<AppSettingsController>();

    final locales = <KeyValueSS>[
      KeyValueSS(key: 'en_US', value: 'English (United States)'),
      KeyValueSS(key: 'en_GB', value: 'English (United Kingdom)'),
      KeyValueSS(key: 'es_ES', value: 'Spanish (Spain)'),
      KeyValueSS(key: 'es_MX', value: 'Spanish (Mexico)'),
      KeyValueSS(key: 'fr_FR', value: 'French (France)'),
      KeyValueSS(key: 'de_DE', value: 'German (Germany)'),
      KeyValueSS(key: 'zh_CN', value: 'Chinese (Simplified)'),
      KeyValueSS(key: 'zh_TW', value: 'Chinese (Traditional)'),
      KeyValueSS(key: 'ja_JP', value: 'Japanese (Japan)'),
      KeyValueSS(key: 'ko_KR', value: 'Korean (South Korea)'),
      KeyValueSS(key: 'hi_IN', value: 'Hindi (India)'),
      KeyValueSS(key: 'ar_SA', value: 'Arabic (Saudi Arabia)'),
      KeyValueSS(key: 'ru_RU', value: 'Russian (Russia)'),
      KeyValueSS(key: 'pt_PT', value: 'Portuguese (Portugal)'),
      KeyValueSS(key: 'pt_BR', value: 'Portuguese (Brazil)'),
      KeyValueSS(key: 'it_IT', value: 'Italian (Italy)'),
      // Add more locales as required
    ];

    final currentLocaleKey = controller.appState.value.locale?.key ?? '';
    final betheme = becolors(context);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: p0,
        title: const BeText.headlineSmall('Select Language'),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(),
        actions: [
          Container(
            margin: pr8,
            decoration: const ShapeDecoration(color: BeColors.red, shape: CircleBorder()),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(BeIcons.icon_close, color: BeColors.white, size: 20),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: locales.length,
        itemBuilder: (final context, final index) {
          final locale = locales[index];
          final isSelected = locale.key == currentLocaleKey;
          return ListTile(
            minVerticalPadding: 4,
            selected: isSelected,
            selectedTileColor: betheme.isDark ? Colors.grey[800] : Colors.grey[200],
            title: BeText(locale.value),
            leading: Container(
              decoration: ShapeDecoration(
                color: isSelected ? Colors.green : null,
                shape: CircleBorder(
                  side: BorderSide(color: isSelected ? Colors.green : BeColors.gray300, width: 1),
                ),
              ),
              child: Padding(
                padding: p2,
                child: Icon(
                  isSelected ? BeIcons.icon_check : const IconData(32),
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
            onTap: () {
              controller.updateAppLocale(locale);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
