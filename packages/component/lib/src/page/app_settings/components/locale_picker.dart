import 'package:becomponent/app.dart';
import 'package:becore/getx.dart';
import 'package:becore/modal.dart';
import 'package:beui/be_icons.dart';
import 'package:beui/decoration.dart';
import 'package:beui/mulitchild.dart';
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

    final currentLocaleKey = controller.state.locale?.key ?? '';
    final betheme = becolors(context);

    return Scaffold(
      body: BeLabel(
        innerLabel: true,
        position: BeLabelPosition.topRight,
        offset: const Offset(8, -8),
        label: Container(
          decoration: const ShapeDecoration(color: BeColors.red, shape: CircleBorder()),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(BeIcons.icon_close, color: BeColors.white),
          ),
        ),
        child: ListView.builder(
          padding: pt36,
          itemCount: locales.length,
          itemBuilder: (final context, final index) {
            final locale = locales[index];
            final isSelected = locale.key == currentLocaleKey;
            return ListTile(
              selected: isSelected,
              selectedTileColor: betheme.isDark ? Colors.grey[800] : Colors.grey[200],
              title: Text(locale.value),
              trailing:
                  isSelected
                      ? Container(
                        decoration: const ShapeDecoration(
                          color: Colors.green,
                          shape: CircleBorder(side: BorderSide(color: Colors.green, width: 2)),
                        ),
                        child: const Padding(
                          padding: p2,
                          child: Icon(Icons.check, color: Colors.white, size: 16),
                        ),
                      )
                      : null,
              onTap: () {
                controller.updateAppLocale(locale);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
