import 'package:beui/src/theme/be_theme_data.dart' show BeThemeData;
import 'package:beui/src/theme/colors/be_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const package = 'beui';

ColorScheme buildColorScheme({required Brightness brightness, Color primary = const Color(0xFFBE3455)}) {
  final bool isDark = brightness == Brightness.dark;

  // Primary tonal palette
  final primaryTonal = _tonalPalette(primary, isDark);

  // Secondary tonal palette (complementary color)
  final secondaryColor = _findComplementary(primary);
  final secondaryTonal = _tonalPalette(secondaryColor, isDark);

  // Tertiary tonal palette (analogous color)
  final tertiaryColor = _shiftHue(primary, 30);
  final tertiaryTonal = _tonalPalette(tertiaryColor, isDark);

  // Error palette
  const errorColor = Color(0xFFB00020);
  final errorTonal = _tonalPalette(errorColor, isDark);

  return ColorScheme(
    brightness: brightness,
    // Primary colors
    primary: primaryTonal[40]!,
    onPrimary: primaryTonal[100]!,
    primaryContainer: primaryTonal[90]!,
    onPrimaryContainer: primaryTonal[10]!,

    // Secondary colors
    secondary: secondaryTonal[40]!,
    onSecondary: secondaryTonal[100]!,
    secondaryContainer: secondaryTonal[90]!,
    onSecondaryContainer: secondaryTonal[10]!,

    // Tertiary colors
    tertiary: tertiaryTonal[40]!,
    onTertiary: tertiaryTonal[100]!,
    tertiaryContainer: tertiaryTonal[90]!,
    onTertiaryContainer: tertiaryTonal[10]!,

    // Error colors
    error: errorTonal[40]!,
    onError: errorTonal[100]!,
    errorContainer: errorTonal[90]!,
    onErrorContainer: errorTonal[10]!,

    // Surface colors
    surface: isDark ? const Color(0xFF121212) : const Color(0xFFFFFFFF),
    onSurface: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
    surfaceContainerHighest: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFEEEEEE),
    onSurfaceVariant: isDark ? const Color(0xFFBDBDBD) : const Color(0xFF616161),

    // Outline colors
    outline: isDark ? const Color(0xFF757575) : const Color(0xFFE0E0E0),
    outlineVariant: isDark ? const Color(0xFF424242) : const Color(0xFFEEEEEE),

    // Shadow colors
    shadow: isDark ? const Color(0xFF000000) : const Color(0xFF000000),
    scrim: isDark ? const Color(0xFF000000) : const Color(0xFF000000),

    // Inverse colors
    inverseSurface: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF121212),
    onInverseSurface: isDark ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
    inversePrimary: primaryTonal[80]!,
  );
}

Map<int, Color> _tonalPalette(Color baseColor, bool isDark) {
  final hsl = HSLColor.fromColor(baseColor);
  return {
    0: hsl.withLightness(isDark ? 0.0 : 1.0).toColor(),
    10: hsl.withLightness(isDark ? 0.10 : 0.90).toColor(),
    20: hsl.withLightness(isDark ? 0.20 : 0.80).toColor(),
    30: hsl.withLightness(isDark ? 0.30 : 0.70).toColor(),
    40: hsl.withLightness(isDark ? 0.40 : 0.60).toColor(),
    50: hsl.withLightness(isDark ? 0.50 : 0.50).toColor(),
    60: hsl.withLightness(isDark ? 0.60 : 0.40).toColor(),
    70: hsl.withLightness(isDark ? 0.70 : 0.30).toColor(),
    80: hsl.withLightness(isDark ? 0.80 : 0.20).toColor(),
    90: hsl.withLightness(isDark ? 0.90 : 0.10).toColor(),
    95: hsl.withLightness(isDark ? 0.95 : 0.05).toColor(),
    99: hsl.withLightness(isDark ? 0.99 : 0.01).toColor(),
    100: hsl.withLightness(isDark ? 1.0 : 0.0).toColor(),
  };
}

Color _findComplementary(Color color) {
  final hsl = HSLColor.fromColor(color);
  return hsl.withHue((hsl.hue + 180) % 360).toColor();
}

Color _shiftHue(Color color, double degrees) {
  final hsl = HSLColor.fromColor(color);
  return hsl.withHue((hsl.hue + degrees) % 360).toColor();
}

// Usage in theme:
ThemeData lightTheme = ThemeData(colorScheme: buildColorScheme(brightness: Brightness.light), useMaterial3: true);

ThemeData darkTheme = ThemeData(colorScheme: buildColorScheme(brightness: Brightness.dark), useMaterial3: true);

AppBarTheme appBarTheme(BeThemeData betheme) => AppBarTheme(
  surfaceTintColor: BeColors.transparent,
  backgroundColor: betheme.colors.primary,
  shadowColor: BeColors.transparent,
  scrolledUnderElevation: 0.5,
  titleSpacing: 16,
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  // titleTextStyle: betheme.style.titleMedium.copyWith(
  //   fontWeight: FontWeight.bold,
  //   // leadingDistribution: TextLeadingDistribution.even,
  //   overflow: TextOverflow.ellipsis,
  // ),
  // toolbarTextStyle: betheme.style.bodySmall,
  // toolbarHeight: 10,
  // actionsIconTheme: const IconThemeData(weight: 1),
  // shape: ContinuousRectangleBorder(
  //   borderRadius: BorderRadius.only(
  //     bottomLeft: Radius.circular(80),
  //     bottomRight: Radius.circular(80),
  //   ),
  // ),
  shape: const RoundedRectangleBorder(),

  // foregroundColor: betheme.becolors.scaffoldBackground,
);

ThemeData createTheme(BeThemeData betheme, {bool useMaterial3 = true, Brightness brightness = Brightness.light}) {
  debugPrint('Creating ThemeData from Bego Theme Data ${betheme.runtimeType}');
  return ThemeData(
    useMaterial3: useMaterial3,
    brightness: brightness,
    appBarTheme: appBarTheme(betheme),
    // primarySwatch: primarySwatch, // don't work with Material3
    // colorScheme: buildColorScheme(brightness: brightness),
    colorScheme: ColorScheme.fromSeed(seedColor: betheme.colors.primary, brightness: brightness),

    // fontFamily: BegoTextStyle.fontFamily,
    // brightness: betheme.isDark ? Brightness.dark : Brightness.light,
    // colorSchemeSeed: betheme.becolors.primary,
    // package: BegoTextStyle.packageName,
    // fontFamilyFallback: ,
    // primarySwatch:  MaterialColor(primary, swatch),
    // androidOverscrollIndicator: ,
    // backgroundColor: ,
    // bottomAppBarColor: ,
    // errorColor: ,
    // selectedRowColor: ,
    // toggleableActiveColor: ,
    // brightness: betheme.isDark ? Brightness.dark : Brightness.light,
    // extensions: themeExtention(betheme),
    // fontFamily: BegoTextStyle.fontFamily,
    // primarySwatch: getPrimarySwatch(betheme),
    // colorSchemeSeed: BegoColors.pink,
    // platform: platform(betheme), // throws exception for web
    // colorScheme: betheme.colors.colorScheme,
    // fontFamilyFallback: const [],
    // package: package,
    // useMaterial3: useMaterial3,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // canvasColor: betheme.isDark ? BegoColors.slate900 : BegoColors.pink50,
    // cardColor: betheme.colors.card,
    // disabledColor: betheme.colors.disabled,
    // dividerColor: betheme.colors.divider,
    // focusColor: betheme.colors.focus,
    // highlightColor: betheme.colors.highlight,
    // hintColor: betheme.colors.hint,
    // hoverColor: betheme.colors.hover,
    // indicatorColor: betheme.colors.indicator,
    // primaryColor: betheme.colors.primary,
    // primaryColorDark: betheme.colors.primaryColorDark,
    // primaryColorLight: betheme.colors.primaryColorLight,
    // secondaryHeaderColor: betheme.colors.secondaryHeader,
    // scaffoldBackgroundColor: betheme.colors.scaffoldBackground,
    // shadowColor: betheme.colors.shadow,
    // splashColor: betheme.colors.splash,
    // unselectedWidgetColor: betheme.colors.unselectedWidget,
    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    // iconTheme: iconTheme(betheme),
    // primaryIconTheme: primaryIconTheme(betheme),
    // primaryTextTheme: primaryTextTheme(betheme),
    // applyElevationOverlayColor: true,
    // cupertinoOverrideTheme: cupertinoOverrideTheme(betheme), // done
    // inputDecorationTheme: inputDecorationTheme(betheme), // done
    // pageTransitionsTheme: pageTransitionsTheme(betheme), // done - > cutomize later
    // scrollbarTheme: scrollbarTheme(betheme), // done
    // splashFactory: splashFactory(betheme), // done
    // textTheme: textTheme(betheme), // done
    // actionIconTheme: actionIconTheme(betheme), //done
    // appBarTheme: appBarTheme(betheme), // done
    // badgeTheme: badgeTheme(betheme), //done
    // bannerTheme: bannerTheme(betheme), // done
    // bottomAppBarTheme: bottomAppBarTheme(betheme), // done
    // bottomNavigationBarTheme: bottomNavigationBarTheme(betheme), // done
    // bottomSheetTheme: bottomSheetTheme(betheme), // done
    // cardTheme: cardTheme(betheme), // done
    // chipTheme: chipTheme(betheme), // done
    // dataTableTheme: dataTableTheme(betheme), // done
    // datePickerTheme: datePickerTheme(betheme), // done
    // dialogTheme: dialogTheme(betheme), // done
    // dividerTheme: dividerTheme(betheme), // done
    // drawerTheme: drawerTheme(betheme), // done
    // dropdownMenuTheme: dropdownMenuTheme(betheme), //done (need enhancement)
    // expansionTileTheme: expansionTileTheme(betheme), // done
    // floatingActionButtonTheme: floatingActionButtonTheme(betheme), // done
    // listTileTheme: listTileTheme(betheme), //done
    // menuBarTheme: menuBarTheme(betheme), //done
    // menuButtonTheme: menuButtonTheme(betheme), // done
    // menuTheme: menuTheme(betheme), // done
    // navigationBarTheme: navigationBarTheme(betheme), // done
    // navigationDrawerTheme: navigationDrawerTheme(betheme), // done
    // iconButtonTheme: iconButtonTheme(betheme), //done
    // navigationRailTheme: navigationRailTheme(betheme), // done
    // elevatedButtonTheme: elevatedButtonTheme(betheme), // done
    // buttonTheme: buttonTheme(betheme), // theme
    // filledButtonTheme: filledButtonTheme(betheme), // done
    // outlinedButtonTheme: outlinedButtonTheme(betheme), // done
    // textButtonTheme: textButtonTheme(betheme), //done
    // popupMenuTheme: popupMenuTheme(betheme), // done
    // radioTheme: radioTheme(betheme), //done
    // searchViewTheme: searchViewTheme(betheme), // done
    // searchBarTheme: searchBarTheme(betheme), // done
    // segmentedButtonTheme: segmentedButtonTheme(betheme), //done
    // snackBarTheme: snackBarTheme(betheme), //done
    // tabBarTheme: tabBarTheme(betheme), //done
    // textSelectionTheme: textSelectionTheme(betheme), // done
    // timePickerTheme: timePickerTheme(betheme), //done
    // toggleButtonsTheme: toggleButtonsTheme(betheme), //done
    // tooltipTheme: tooltipTheme(betheme), // done
    // sliderTheme: sliderTheme(betheme), // done
    // progressIndicatorTheme: progressIndicatorTheme(betheme), //done
    // switchTheme: switchTheme(betheme), //done
    // checkboxTheme: checkboxTheme(betheme), // done
    // typography: typography, //done
  );
}
