// import 'package:flutter/material.dart';

// ThemeData buildTheme() {
//   return ThemeData(
//     useMaterial3: useMaterial3,
//     extensions: [betheme],
//     colorScheme: colorScheme,
//     brightness: brightness,

//     // Component themes
//     appBarTheme: _buildAppBarTheme(),
//     badgeTheme: _buildBadgeTheme(),
//     buttonTheme: _buildButtonTheme(),
//     cardTheme: _buildCardTheme(),
//     checkboxTheme: _buildCheckboxTheme(),
//     chipTheme: _buildChipTheme(),
//     dialogTheme: _buildDialogTheme(),
//     dividerTheme: _buildDividerTheme(),
//     dropdownMenuTheme: _buildDropdownMenuTheme(),
//     elevatedButtonTheme: _buildElevatedButtonTheme(),
//     expansionTileTheme: _buildExpansionTileTheme(),
//     filledButtonTheme: _buildFilledButtonTheme(),
//     floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
//     iconButtonTheme: _buildIconButtonTheme(),
//     inputDecorationTheme: _buildInputDecorationTheme(),
//     listTileTheme: _buildListTileTheme(),
//     navigationBarTheme: _buildNavigationBarTheme(),
//     outlinedButtonTheme: _buildOutlinedButtonTheme(),
//     popupMenuTheme: _buildPopupMenuTheme(),
//     progressIndicatorTheme: _buildProgressIndicatorTheme(),
//     radioTheme: _buildRadioTheme(),
//     sliderTheme: _buildSliderTheme(),
//     snackBarTheme: _buildSnackBarTheme(),
//     switchTheme: _buildSwitchTheme(),
//     tabBarTheme: _buildTabBarTheme(),
//     textButtonTheme: _buildTextButtonTheme(),
//     textSelectionTheme: _buildTextSelectionTheme(),
//     timePickerTheme: _buildTimePickerTheme(),
//     tooltipTheme: _buildTooltipTheme(),
//     actionIconTheme: _buildActionIconTheme(),
//     dataTableTheme: _buildDataTableTheme(),
//     bottomSheetTheme: _buildBottomSheetTheme(),
//     bottomNavigationBarTheme: _buildBottomNavigationBarTheme(),
//     datePickerTheme: _buildDatePickerTheme(),

//     drawerTheme: _buildDrawerTheme(),
//     iconTheme: _buildIconTheme(),
//     bottomAppBarTheme: _buildBottomAppBarTheme(),
//     bannerTheme: _buildBannerTheme(),
//     menuBarTheme: _buildMenuBarTheme(),
//     menuButtonTheme: _buildMenuButtonTheme(),
//     navigationRailTheme: _buildNavigationRailTheme(),
//     pageTransitionsTheme: _buildPageTransitionsTheme(),
//     scrollbarTheme: _buildScrollbarTheme(),
//     navigationDrawerTheme: _buildNavigationDrawerTheme(),
//     menuTheme: _buildMenuTheme(),
//     textTheme: _buildTextTheme(),
//     primaryIconTheme: _buildPrimaryIconTheme(),
//     // package: 'beui',
//     searchViewTheme: _buildSearchViewTheme(),
//     searchBarTheme: _buildSearchBarTheme(),
//     segmentedButtonTheme: _buildSegmentedButtonTheme(),
//     toggleButtonsTheme: _buildToggleButtonsTheme(),
//     primaryTextTheme: _buildPrimaryTextTheme(),

//     // Add other component themes as needed
//   );
// }

import 'package:beui/src/decoration/be_round_rectangle_border.dart';
import 'package:beui/src/extentions/be_double_ext.dart';
import 'package:beui/theme.dart';
import 'package:beui/ui.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme({
  required BeThemeData betheme,
  bool useMaterial3 = true,
  Brightness brightness = Brightness.light,
}) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: betheme.colors.primary,
    brightness: brightness,
  );

  return ThemeData(
    useMaterial3: useMaterial3,
    colorScheme: colorScheme,
    brightness: brightness,
    package: BeUIConst.packageName,
    extensions: [betheme],
    fontFamily: BeUIConst.fontFamily,
    splashFactory: InkRipple.splashFactory,

    // Component themes
    appBarTheme: _buildAppBarTheme(colorScheme),
    badgeTheme: _buildBadgeTheme(colorScheme),
    buttonTheme: _buildButtonTheme(),
    cardTheme: _buildCardTheme(colorScheme),
    checkboxTheme: _buildCheckboxTheme(colorScheme),
    chipTheme: _buildChipTheme(colorScheme),
    dialogTheme: _buildDialogTheme(colorScheme),
    dividerTheme: _buildDividerTheme(colorScheme),
    dropdownMenuTheme: _buildDropdownMenuTheme(colorScheme),
    elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
    expansionTileTheme: _buildExpansionTileTheme(colorScheme),
    filledButtonTheme: _buildFilledButtonTheme(colorScheme),
    floatingActionButtonTheme: _buildFloatingActionButtonTheme(colorScheme),
    iconButtonTheme: _buildIconButtonTheme(colorScheme),
    inputDecorationTheme: _buildInputDecorationTheme(betheme),
    listTileTheme: _buildListTileTheme(colorScheme),
    navigationBarTheme: _buildNavigationBarTheme(colorScheme),
    outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
    popupMenuTheme: _buildPopupMenuTheme(colorScheme),
    progressIndicatorTheme: _buildProgressIndicatorTheme(colorScheme),
    radioTheme: _buildRadioTheme(colorScheme),
    sliderTheme: _buildSliderTheme(colorScheme),
    snackBarTheme: _buildSnackBarTheme(colorScheme),
    switchTheme: _buildSwitchTheme(colorScheme),
    tabBarTheme: _buildTabBarTheme(colorScheme),
    textButtonTheme: _buildTextButtonTheme(colorScheme),
    textSelectionTheme: _buildTextSelectionTheme(colorScheme),
    timePickerTheme: _buildTimePickerTheme(colorScheme),
    tooltipTheme: _buildTooltipTheme(colorScheme),
    actionIconTheme: _buildActionIconTheme(colorScheme),
    dataTableTheme: _buildDataTableTheme(colorScheme),
    bottomSheetTheme: _buildBottomSheetTheme(colorScheme),
    bottomNavigationBarTheme: _buildBottomNavigationBarTheme(colorScheme),
    datePickerTheme: _buildDatePickerTheme(colorScheme),
    drawerTheme: _buildDrawerTheme(colorScheme),
    iconTheme: _buildIconTheme(colorScheme),
    bottomAppBarTheme: _buildBottomAppBarTheme(colorScheme),
    bannerTheme: _buildBannerTheme(colorScheme),
    menuBarTheme: _buildMenuBarTheme(colorScheme),
    menuButtonTheme: _buildMenuButtonTheme(colorScheme),
    navigationRailTheme: _buildNavigationRailTheme(colorScheme),
    pageTransitionsTheme: _buildPageTransitionsTheme(),
    scrollbarTheme: _buildScrollbarTheme(colorScheme),
    navigationDrawerTheme: _buildNavigationDrawerTheme(colorScheme),
    menuTheme: _buildMenuTheme(colorScheme),
    textTheme: _buildTextTheme(),
    primaryIconTheme: _buildPrimaryIconTheme(colorScheme),
    searchBarTheme: _buildSearchBarTheme(colorScheme),
    segmentedButtonTheme: _buildSegmentedButtonTheme(colorScheme),
    toggleButtonsTheme: _buildToggleButtonsTheme(colorScheme),
    primaryTextTheme: _buildPrimaryTextTheme(colorScheme),

    // searchViewTheme: _buildSearchViewTheme(colorScheme),
  );
}

// // ========== Color Scheme ==========
// ColorScheme _buildColorScheme(Brightness brightness) {
//   return ColorScheme.fromSeed(
//     seedColor: const Color(0xFF6750A4), // M3 baseline purple
//     brightness: brightness,
//     // Customize all colors:
//     primary: const Color(0xFF6750A4),
//     onPrimary: const Color(0xFFFFFFFF),
//     primaryContainer: const Color(0xFFEADDFF),
//     onPrimaryContainer: const Color(0xFF21005D),
//     secondary: const Color(0xFF625B71),
//     onSecondary: const Color(0xFFFFFFFF),
//     secondaryContainer: const Color(0xFFE8DEF8),
//     onSecondaryContainer: const Color(0xFF1D192B),
//     tertiary: const Color(0xFF7D5260),
//     onTertiary: const Color(0xFFFFFFFF),
//     tertiaryContainer: const Color(0xFFFFD8E4),
//     onTertiaryContainer: const Color(0xFF31111D),
//     error: const Color(0xFFB3261E),
//     onError: const Color(0xFFFFFFFF),
//     errorContainer: const Color(0xFFF9DEDC),
//     onErrorContainer: const Color(0xFF410E0B),
//     outline: const Color(0xFF79747E),
//     background: const Color(0xFFFFFBFE),
//     onBackground: const Color(0xFF1C1B1F),
//     surface: const Color(0xFFFFFBFE),
//     onSurface: const Color(0xFF1C1B1F),
//     surfaceVariant: const Color(0xFFE7E0EC),
//     onSurfaceVariant: const Color(0xFF49454F),
//     inverseSurface: const Color(0xFF313033),
//     onInverseSurface: const Color(0xFFF4EFF4),
//     inversePrimary: const Color(0xFFD0BCFF),
//     shadow: const Color(0xFF000000),
//     surfaceTint: const Color(0xFF6750A4),
//   );
// }

// ========== Component Themes ==========

AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    backgroundColor: colorScheme.surface,
    foregroundColor: colorScheme.onSurface,
    elevation: 0,
    scrolledUnderElevation: 3,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    surfaceTintColor: colorScheme.surfaceTint,
    shadowColor: colorScheme.shadow,
    iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
    actionsIconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
  );
}

BadgeThemeData _buildBadgeTheme(ColorScheme colorScheme) {
  return BadgeThemeData(
    backgroundColor: colorScheme.error,
    textColor: colorScheme.onError,
    alignment: Alignment.topRight,
    offset: const Offset(12, -12),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: colorScheme.onError,
    ),
    smallSize: 6,
    largeSize: 16,
  );
}

ButtonThemeData _buildButtonTheme() {
  return const ButtonThemeData(
    alignedDropdown: true,
    layoutBehavior: ButtonBarLayoutBehavior.padded,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
}

CardTheme _buildCardTheme(ColorScheme colorScheme) {
  return CardTheme(
    color: colorScheme.surface,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    elevation: 1,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
  );
}

CheckboxThemeData _buildCheckboxTheme(ColorScheme colorScheme) {
  return CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    side: BorderSide(color: colorScheme.outline, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

ChipThemeData _buildChipTheme(ColorScheme colorScheme) {
  return ChipThemeData(
    backgroundColor: colorScheme.surfaceContainerHighest,
    deleteIconColor: colorScheme.onSurfaceVariant,
    disabledColor: colorScheme.onSurface.withAlpha(0.12.toAlpha()),
    selectedColor: colorScheme.primary,
    secondarySelectedColor: colorScheme.secondary,
    shadowColor: colorScheme.shadow,
    selectedShadowColor: colorScheme.shadow,
    showCheckmark: true,
    checkmarkColor: colorScheme.onPrimary,
    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    labelStyle: TextStyle(color: colorScheme.onSurface, fontSize: 12),
    secondaryLabelStyle: TextStyle(color: colorScheme.onPrimary, fontSize: 12),
    brightness: colorScheme.brightness,
    elevation: 0,
    pressElevation: 1,
    shape: const StadiumBorder(),
    side: BorderSide.none,
  );
}

DialogTheme _buildDialogTheme(ColorScheme colorScheme) {
  return DialogTheme(
    backgroundColor: colorScheme.surface,
    elevation: 6,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    alignment: Alignment.center,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: colorScheme.onSurface.withAlpha(0.8.toAlpha()),
    ),
    actionsPadding: const EdgeInsets.all(16),
  );
}

// [Continues with all other theme builders...]
// (Note: Due to length, I've shown a subset. The full implementation would include all requested theme builders.)

// ========== Text Theme ==========
TextTheme _buildTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}

// ========== Remaining Theme Builders ==========

DividerThemeData _buildDividerTheme(ColorScheme colorScheme) {
  return DividerThemeData(
    color: colorScheme.outline.withAlpha(0.3.toAlpha()),
    thickness: 1,
    indent: 16,
    endIndent: 16,
    space: 16,
  );
}

DropdownMenuThemeData _buildDropdownMenuTheme(ColorScheme colorScheme) {
  return DropdownMenuThemeData(
    textStyle: TextStyle(color: colorScheme.onSurface, fontSize: 16),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
      elevation: const WidgetStatePropertyAll(8),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

ElevatedButtonThemeData _buildElevatedButtonTheme(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.12.toAlpha());
        }
        return colorScheme.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.38.toAlpha());
        }
        return colorScheme.onPrimary;
      }),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.onPrimary.withAlpha(0.12.toAlpha()),
      ),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

ExpansionTileThemeData _buildExpansionTileTheme(ColorScheme colorScheme) {
  return ExpansionTileThemeData(
    backgroundColor: colorScheme.surface,
    collapsedBackgroundColor: colorScheme.surface,
    textColor: colorScheme.onSurface,
    collapsedTextColor: colorScheme.onSurface,
    iconColor: colorScheme.onSurface,
    collapsedIconColor: colorScheme.onSurface,
    childrenPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    expansionAnimationStyle: AnimationStyle(
      curve: Curves.bounceInOut,
      reverseCurve: Curves.bounceIn,
      duration: const Duration(seconds: 1),
    ),
    tilePadding: const EdgeInsets.symmetric(horizontal: 16),
    expandedAlignment: Alignment.centerLeft,
    collapsedShape: const BeRoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: 0.2),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    shape: BeRoundedRectangleBorder(
      backgroundColor: colorScheme.onTertiary.withAlpha(5),
      side: const BorderSide(color: Colors.grey, width: 0.2),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
  );
}

FilledButtonThemeData _buildFilledButtonTheme(ColorScheme colorScheme) {
  return FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.12.toAlpha());
        }
        return colorScheme.primaryContainer;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.38.toAlpha());
        }
        return colorScheme.onPrimaryContainer;
      }),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.onPrimaryContainer.withAlpha(0.12.toAlpha()),
      ),
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

FloatingActionButtonThemeData _buildFloatingActionButtonTheme(
  ColorScheme colorScheme,
) {
  return FloatingActionButtonThemeData(
    backgroundColor: colorScheme.primaryContainer,
    foregroundColor: colorScheme.onPrimaryContainer,
    elevation: 3,
    focusElevation: 4,
    hoverElevation: 5,
    disabledElevation: 0,
    highlightElevation: 6,
    shape: const CircleBorder(),
    sizeConstraints: const BoxConstraints.tightFor(width: 56, height: 56),
    extendedSizeConstraints: const BoxConstraints.tightFor(height: 56),
    extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
    extendedTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: colorScheme.onPrimaryContainer,
    ),
  );
}

IconButtonThemeData _buildIconButtonTheme(ColorScheme colorScheme) {
  return IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.38.toAlpha());
        }
        return colorScheme.primary;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.primary.withAlpha(0.12.toAlpha());
        }
        return Colors.transparent;
      }),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      minimumSize: const WidgetStatePropertyAll(Size(40, 40)),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      shape: const WidgetStatePropertyAll(CircleBorder()),
    ),
  );
}

InputDecorationTheme _buildInputDecorationTheme(BeThemeData betheme) {
  final colors = ColorUtils.createColorSwatch(betheme.colors.formFillColor);
  return InputDecorationTheme(
    filled: true,
    fillColor: betheme.colors.formFillColor,
    // focusColor: colorScheme.primary,
    // hoverColor: colorScheme.onSurface.withAlpha(0.08.toAlpha()),
    // errorStyle: TextStyle(color: colorScheme.error),
    // floatingLabelStyle: TextStyle(color: colorScheme.primary),
    // labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    // helperStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    // hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    // prefixStyle: TextStyle(color: colorScheme.onSurface),
    // suffixStyle: TextStyle(color: colorScheme.onSurface),
    // counterStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.shade100, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.shade700, width: 2),
    ),
    // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    // isDense: true,
    // alignLabelWithHint: true,
    // errorMaxLines: 2,
  );
}

ListTileThemeData _buildListTileTheme(ColorScheme colorScheme) {
  return ListTileThemeData(
    dense: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    tileColor: colorScheme.surface,
    selectedTileColor: colorScheme.primaryContainer,
    iconColor: colorScheme.onSurfaceVariant,
    textColor: colorScheme.onSurface,
    selectedColor: colorScheme.onPrimaryContainer,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    horizontalTitleGap: 16,
    minVerticalPadding: 8,
    minLeadingWidth: 40,
    enableFeedback: true,
    mouseCursor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      if (states.contains(WidgetState.hovered)) {
        return SystemMouseCursors.click;
      }
      return SystemMouseCursors.basic;
    }),
  );
}

NavigationBarThemeData _buildNavigationBarTheme(ColorScheme colorScheme) {
  return NavigationBarThemeData(
    height: 80,
    backgroundColor: colorScheme.surface,
    elevation: 3,
    indicatorColor: colorScheme.secondaryContainer,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color:
            isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);
      return IconThemeData(
        size: 24,
        color:
            isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
      );
    }),
  );
}

OutlinedButtonThemeData _buildOutlinedButtonTheme(ColorScheme colorScheme) {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withAlpha(0.12.toAlpha()),
          );
        }
        return BorderSide(color: colorScheme.outline);
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.38.toAlpha());
        }
        return colorScheme.onSurface;
      }),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.onSurface.withAlpha(0.12.toAlpha()),
      ),
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

// ========== Popup Menu Theme ==========
PopupMenuThemeData _buildPopupMenuTheme(ColorScheme colorScheme) {
  return PopupMenuThemeData(
    color: colorScheme.surface,
    elevation: 3,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    textStyle: TextStyle(fontSize: 14, color: colorScheme.onSurface),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: colorScheme.outline.withAlpha(0.2.toAlpha())),
    ),
    position: PopupMenuPosition.under,
    iconColor: colorScheme.onSurfaceVariant,
    iconSize: 24,
    enableFeedback: true,
    menuPadding: const EdgeInsets.all(8),
    mouseCursor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      return SystemMouseCursors.click;
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color:
            isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
      );
    }),
  );
}

// ========== Progress Indicator Theme ==========
ProgressIndicatorThemeData _buildProgressIndicatorTheme(
  ColorScheme colorScheme,
) {
  return ProgressIndicatorThemeData(
    color: colorScheme.primary,
    linearTrackColor: colorScheme.surfaceContainerHighest,
    circularTrackColor: colorScheme.surfaceContainerHighest,
    refreshBackgroundColor: colorScheme.surface,
    linearMinHeight: 4,
  );
}

// ========== Radio Theme ==========
RadioThemeData _buildRadioTheme(ColorScheme colorScheme) {
  return RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.onSurfaceVariant;
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return colorScheme.primary.withAlpha(0.1.toAlpha());
      }
      if (states.contains(WidgetState.hovered)) {
        return colorScheme.onSurface.withAlpha(0.04.toAlpha());
      }
      return null;
    }),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );
}

// ========== Slider Theme ==========
SliderThemeData _buildSliderTheme(ColorScheme colorScheme) {
  return SliderThemeData(
    activeTrackColor: colorScheme.primary,
    inactiveTrackColor: colorScheme.surfaceContainerHighest,
    secondaryActiveTrackColor: colorScheme.primaryContainer,
    thumbColor: colorScheme.primary,
    overlayColor: colorScheme.primary.withAlpha(0.12.toAlpha()),
    valueIndicatorColor: colorScheme.primary,
    activeTickMarkColor: colorScheme.onPrimary,
    inactiveTickMarkColor: colorScheme.surfaceContainerHighest,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
    trackHeight: 4,
    minThumbSeparation: 8,
    rangeThumbShape: const RoundRangeSliderThumbShape(),
    rangeTrackShape: const RectangularRangeSliderTrackShape(),
    rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
  );
}

// ========== SnackBar Theme ==========
SnackBarThemeData _buildSnackBarTheme(ColorScheme colorScheme) {
  return SnackBarThemeData(
    backgroundColor: colorScheme.inverseSurface,
    actionTextColor: colorScheme.inversePrimary,
    disabledActionTextColor: colorScheme.onSurface.withAlpha(0.38.toAlpha()),
    contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    behavior: SnackBarBehavior.floating,
    width: 400,
    insetPadding: const EdgeInsets.all(16),
    showCloseIcon: true,
    closeIconColor: colorScheme.onInverseSurface,
  );
}

// ========== Switch Theme ==========
SwitchThemeData _buildSwitchTheme(ColorScheme colorScheme) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.onPrimary;
      }
      return colorScheme.outlineVariant;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.surfaceContainerHighest;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return colorScheme.outline;
    }),
    trackOutlineWidth: const WidgetStatePropertyAll(2),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    mouseCursor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      return SystemMouseCursors.click;
    }),
  );
}

// ========== Tab Bar Theme ==========
TabBarTheme _buildTabBarTheme(ColorScheme colorScheme) {
  return TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: colorScheme.primary),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: colorScheme.surfaceContainerHighest,
    labelColor: colorScheme.primary,
    unselectedLabelColor: colorScheme.onSurfaceVariant,
    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return colorScheme.primary.withAlpha(0.12.toAlpha());
      }
      return null;
    }),
    splashFactory: InkRipple.splashFactory,
  );
}

// ========== Text Button Theme ==========
TextButtonThemeData _buildTextButtonTheme(ColorScheme colorScheme) {
  return TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withAlpha(0.38.toAlpha());
        }
        return colorScheme.primary;
      }),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.primary.withAlpha(0.12.toAlpha()),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

// ========== Text Selection Theme ==========
TextSelectionThemeData _buildTextSelectionTheme(ColorScheme colorScheme) {
  return TextSelectionThemeData(
    cursorColor: colorScheme.primary,
    selectionColor: colorScheme.primary.withAlpha(0.4.toAlpha()),
    selectionHandleColor: colorScheme.primary,
  );
}

// ========== Time Picker Theme ==========
TimePickerThemeData _buildTimePickerTheme(ColorScheme colorScheme) {
  return TimePickerThemeData(
    backgroundColor: colorScheme.surface,
    hourMinuteTextColor: colorScheme.onSurface,
    hourMinuteColor: colorScheme.surfaceContainerHighest,
    dayPeriodTextColor: colorScheme.onSurface,
    dayPeriodColor: colorScheme.surfaceContainerHighest,
    dialHandColor: colorScheme.primary,
    dialBackgroundColor: colorScheme.surfaceContainerHighest,
    dialTextColor: colorScheme.onSurfaceVariant,
    entryModeIconColor: colorScheme.onSurfaceVariant,
    dayPeriodBorderSide: BorderSide(color: colorScheme.outline),
    hourMinuteTextStyle: const TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    dayPeriodTextStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    helpTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    hourMinuteShape: const CircleBorder(),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    // inputDecorationTheme: _buildInputDecorationTheme(betheme),
  );
}

// ========== Tooltip Theme ==========
TooltipThemeData _buildTooltipTheme(ColorScheme colorScheme) {
  return TooltipThemeData(
    height: 32,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    margin: const EdgeInsets.all(16),
    verticalOffset: 8,
    preferBelow: true,
    excludeFromSemantics: true,
    decoration: BoxDecoration(
      color: colorScheme.inverseSurface,
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: TextStyle(color: colorScheme.onInverseSurface, fontSize: 12),
    waitDuration: const Duration(milliseconds: 500),
    showDuration: const Duration(seconds: 2),
  );
}

// ========== Action Icon Theme ==========
ActionIconThemeData _buildActionIconTheme(ColorScheme colorScheme) {
  return ActionIconThemeData(
    backButtonIconBuilder:
        (context) => IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
    closeButtonIconBuilder:
        (context) => IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.maybePop(context),
        ),
    drawerButtonIconBuilder:
        (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
    endDrawerButtonIconBuilder:
        (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
  );
}

// ========== Data Table Theme ==========
DataTableThemeData _buildDataTableTheme(ColorScheme colorScheme) {
  return DataTableThemeData(
    dataRowColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primaryContainer;
      }
      return colorScheme.surface;
    }),
    dataTextStyle: TextStyle(color: colorScheme.onSurface),
    headingRowColor: WidgetStatePropertyAll(
      colorScheme.surfaceContainerHighest,
    ),
    headingTextStyle: TextStyle(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    ),
    horizontalMargin: 16,
    columnSpacing: 24,
    dividerThickness: 1,
    checkboxHorizontalMargin: 12,
    decoration: BoxDecoration(
      border: Border.all(color: colorScheme.outline.withAlpha(0.2.toAlpha())),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

// ========== Bottom Sheet Theme ==========
BottomSheetThemeData _buildBottomSheetTheme(ColorScheme colorScheme) {
  return BottomSheetThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 6,
    modalBackgroundColor: colorScheme.surface,
    modalElevation: 12,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    clipBehavior: Clip.antiAlias,
    constraints: const BoxConstraints(maxWidth: 640),
    surfaceTintColor: colorScheme.surfaceTint,
    showDragHandle: true,
    dragHandleColor: colorScheme.onSurfaceVariant,
    dragHandleSize: const Size(32, 4),
  );
}

// ========== Bottom Navigation Bar Theme ==========
BottomNavigationBarThemeData _buildBottomNavigationBarTheme(
  ColorScheme colorScheme,
) {
  return BottomNavigationBarThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 3,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.onSurfaceVariant,
    selectedIconTheme: IconThemeData(color: colorScheme.primary, size: 24),
    unselectedIconTheme: IconThemeData(
      color: colorScheme.onSurfaceVariant,
      size: 24,
    ),
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    enableFeedback: true,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
  );
}

// ========== Date Picker Theme ==========
DatePickerThemeData _buildDatePickerTheme(ColorScheme colorScheme) {
  return DatePickerThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 6,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    headerBackgroundColor: colorScheme.primary,
    headerForegroundColor: colorScheme.onPrimary,
    weekdayStyle: TextStyle(color: colorScheme.onSurface),
    dayStyle: TextStyle(color: colorScheme.onSurface),
    yearStyle: TextStyle(color: colorScheme.onSurface),
    rangePickerBackgroundColor: colorScheme.surface,
    rangePickerElevation: 6,
    rangePickerShadowColor: colorScheme.shadow,
    rangePickerSurfaceTintColor: colorScheme.surfaceTint,
    rangePickerHeaderBackgroundColor: colorScheme.primary,
    rangePickerHeaderForegroundColor: colorScheme.onPrimary,
    rangeSelectionBackgroundColor: colorScheme.primaryContainer,
    // rangeSelectionOverlayColor: colorScheme.onPrimaryContainer.withAlpha(
    //   0.12,
    // ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    cancelButtonStyle: _buildTextButtonTheme(colorScheme).style,
    confirmButtonStyle: _buildTextButtonTheme(colorScheme).style,
    headerHelpStyle: TextStyle(color: colorScheme.onSurfaceVariant),

    dayOverlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary.withAlpha(0.12.toAlpha());
      }
      return null;
    }),
    todayBorder: BorderSide(color: colorScheme.primary),
    todayForegroundColor: WidgetStatePropertyAll(colorScheme.primary),
  );
}

// ========== Drawer Theme ==========
DrawerThemeData _buildDrawerTheme(ColorScheme colorScheme) {
  return DrawerThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 16,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    shape: const RoundedRectangleBorder(),
    width: 304,
    scrimColor: colorScheme.scrim.withAlpha(0.5.toAlpha()),
    endShape: const RoundedRectangleBorder(),
  );
}

// ========== Icon Theme ==========
IconThemeData _buildIconTheme(ColorScheme colorScheme) {
  return IconThemeData(
    color: colorScheme.onSurfaceVariant,
    size: 24,
    fill: 0.0,
    weight: 400,
    grade: 0,
    opticalSize: 48,
    shadows: null,
  );
}

// ========== Bottom App Bar Theme ==========
BottomAppBarTheme _buildBottomAppBarTheme(ColorScheme colorScheme) {
  return BottomAppBarTheme(
    color: colorScheme.surface,
    elevation: 4,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    height: 80,
    padding: EdgeInsets.zero,
    // notchMargin: 8,
    shape: const AutomaticNotchedShape(
      RoundedRectangleBorder(),
      StadiumBorder(),
    ),
  );
}

// ========== Banner Theme ==========
MaterialBannerThemeData _buildBannerTheme(ColorScheme colorScheme) {
  return MaterialBannerThemeData(
    backgroundColor: colorScheme.surfaceContainerHighest,
    contentTextStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    leadingPadding: const EdgeInsets.only(left: 16),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    elevation: 1,
  );
}

// ========== Menu Bar Theme ==========
MenuBarThemeData _buildMenuBarTheme(ColorScheme colorScheme) {
  return MenuBarThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
      elevation: const WidgetStatePropertyAll(2),
      shadowColor: WidgetStatePropertyAll(colorScheme.shadow),
      surfaceTintColor: WidgetStatePropertyAll(colorScheme.surfaceTint),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

// ========== Menu Button Theme ==========
MenuButtonThemeData _buildMenuButtonTheme(ColorScheme colorScheme) {
  return MenuButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.primary.withAlpha(0.12.toAlpha());
        }
        return null;
      }),
      foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.primary.withAlpha(0.08.toAlpha()),
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

// ========== Navigation Rail Theme ==========
NavigationRailThemeData _buildNavigationRailTheme(ColorScheme colorScheme) {
  return NavigationRailThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 2,
    unselectedLabelTextStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    selectedLabelTextStyle: TextStyle(color: colorScheme.primary),
    unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
    selectedIconTheme: IconThemeData(color: colorScheme.primary),
    labelType: NavigationRailLabelType.all,
    groupAlignment: 0,
    useIndicator: true,
    indicatorColor: colorScheme.secondaryContainer,
    minWidth: 72,
    minExtendedWidth: 200,
  );
}

// ========== Page Transitions Theme ==========
PageTransitionsTheme _buildPageTransitionsTheme() {
  return const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    },
  );
}

// ========== Scrollbar Theme ==========
ScrollbarThemeData _buildScrollbarTheme(ColorScheme colorScheme) {
  return ScrollbarThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return colorScheme.onSurface.withAlpha(0.6.toAlpha());
      }
      if (states.contains(WidgetState.hovered)) {
        return colorScheme.onSurface.withAlpha(0.4.toAlpha());
      }
      return colorScheme.onSurface.withAlpha(0.3.toAlpha());
    }),
    trackColor: WidgetStatePropertyAll(colorScheme.surfaceContainerHighest),
    trackBorderColor: WidgetStatePropertyAll(colorScheme.outline),
    thickness: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return 8;
      }
      return 4;
    }),
    radius: const Radius.circular(4),
    crossAxisMargin: 2,
    mainAxisMargin: 4,
    minThumbLength: 48,
    interactive: true,
  );
}

// ========== Navigation Drawer Theme ==========
NavigationDrawerThemeData _buildNavigationDrawerTheme(ColorScheme colorScheme) {
  return NavigationDrawerThemeData(
    backgroundColor: colorScheme.surface,
    elevation: 16,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: colorScheme.surfaceTint,
    indicatorColor: colorScheme.secondaryContainer,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        color:
            isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      final isSelected = states.contains(WidgetState.selected);
      return IconThemeData(
        color:
            isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
      );
    }),
  );
}

// ========== Menu Theme ==========
MenuThemeData _buildMenuTheme(ColorScheme colorScheme) {
  return MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
      elevation: const WidgetStatePropertyAll(8),
      shadowColor: WidgetStatePropertyAll(colorScheme.shadow),
      surfaceTintColor: WidgetStatePropertyAll(colorScheme.surfaceTint),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
    ),
  );
}

// ========== Primary Icon Theme ==========
IconThemeData _buildPrimaryIconTheme(ColorScheme colorScheme) {
  return IconThemeData(
    color: colorScheme.primary,
    size: 24,
    fill: 0.0,
    weight: 400,
    grade: 0,
    opticalSize: 48,
    shadows: null,
  );
}

// ========== Search Bar Theme ==========
SearchBarThemeData _buildSearchBarTheme(ColorScheme colorScheme) {
  return SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(
      colorScheme.surfaceContainerHighest,
    ),
    elevation: const WidgetStatePropertyAll(0),
    surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStatePropertyAll(
      colorScheme.primary.withAlpha(0.12.toAlpha()),
    ),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    side: WidgetStatePropertyAll(
      BorderSide(color: colorScheme.outline.withAlpha(0.5.toAlpha())),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textStyle: WidgetStatePropertyAll(
      TextStyle(color: colorScheme.onSurface, fontSize: 16),
    ),
    hintStyle: WidgetStatePropertyAll(
      TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 16),
    ),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
    constraints: const BoxConstraints(minHeight: 56),
    // leadingIcon: WidgetStatePropertyAll(
    // Icon(Icons.search, color: colorScheme.onSurfaceVariant),
    // ),
    // trailingIcon: WidgetStatePropertyAll(
    // Icon(Icons.close, color: colorScheme.onSurfaceVariant),
    // ),
  );
}

// ========== Segmented Button Theme ==========
SegmentedButtonThemeData _buildSegmentedButtonTheme(ColorScheme colorScheme) {
  return SegmentedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.onPrimary;
        }
        return colorScheme.onSurface;
      }),
      overlayColor: WidgetStatePropertyAll(
        colorScheme.primary.withAlpha(0.12.toAlpha()),
      ),
      side: WidgetStatePropertyAll(BorderSide(color: colorScheme.outline)),
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

// ========== Toggle Buttons Theme ==========
ToggleButtonsThemeData _buildToggleButtonsTheme(ColorScheme colorScheme) {
  return ToggleButtonsThemeData(
    color: colorScheme.onSurfaceVariant,
    selectedColor: colorScheme.onPrimary,
    disabledColor: colorScheme.onSurface.withAlpha(0.38.toAlpha()),
    fillColor: Colors.transparent,
    focusColor: colorScheme.primary.withAlpha(0.12.toAlpha()),
    highlightColor: colorScheme.primary.withAlpha(0.12.toAlpha()),
    hoverColor: colorScheme.primary.withAlpha(0.08.toAlpha()),
    splashColor: colorScheme.primary.withAlpha(0.12.toAlpha()),
    borderColor: colorScheme.outline,
    selectedBorderColor: colorScheme.primary,
    disabledBorderColor: colorScheme.onSurface.withAlpha(0.12.toAlpha()),
    borderRadius: BorderRadius.circular(8),
    borderWidth: 1,
    constraints: const BoxConstraints(minHeight: 40, minWidth: 64),
  );
}

// ========== Primary Text Theme ==========
TextTheme _buildPrimaryTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: colorScheme.primary,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: colorScheme.primary,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: colorScheme.primary,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: colorScheme.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: colorScheme.primary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: colorScheme.primary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: colorScheme.primary,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: colorScheme.primary,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: colorScheme.primary,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: colorScheme.primary,
    ),
  );
}
