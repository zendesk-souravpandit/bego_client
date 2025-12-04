// ignore_for_file: lines_longer_than_80_chars

import 'package:beui/src/decoration/be_edge_insets.dart';
import 'package:beui/src/decoration/be_round_rectangle_border.dart';
import 'package:beui/src/extensions/be_double_ext.dart';
import 'package:beui/theme.dart';
import 'package:beui/utils.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme({required final BeThemeData betheme, final bool useMaterial3 = true}) {
  final isDark = betheme.colors.isDark;
  final brightness = isDark ? Brightness.dark : Brightness.light;
  final colors = betheme.colors;
  final colorScheme = _buildColorScheme(colors);
  final bestyle = betheme.style;

  return ThemeData(
    useMaterial3: useMaterial3,
    colorScheme: colorScheme,
    brightness: brightness,
    package: BeUIConst.packageName,
    fontFamily: BeUIConst.fontFamily,
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    splashFactory: InkRipple.splashFactory,
    disabledColor: colors.disabled,
    dividerColor: BeColors.divider,
    hintColor: BeColors.hintColor,
    focusColor: BeColors.focusColor,
    hoverColor: BeColors.hoverColor,
    highlightColor: BeColors.highlightColor,
    shadowColor: BeColors.shadow,
    unselectedWidgetColor: BeColors.unselectedWidget,
    textTheme: _buildTextTheme(bestyle),

    // Component themes
    appBarTheme: _buildAppBarTheme(betheme),
    badgeTheme: _buildBadgeTheme(betheme),
    buttonTheme: _buildButtonTheme(betheme),
    cardTheme: _buildCardTheme(betheme),
    checkboxTheme: _buildCheckboxTheme(betheme),
    chipTheme: _buildChipTheme(betheme),
    dialogTheme: _buildDialogTheme(betheme),
    dividerTheme: _buildDividerTheme(betheme),

    dropdownMenuTheme: _buildDropdownMenuTheme(betheme),

    elevatedButtonTheme: _buildElevatedButtonTheme(betheme),
    filledButtonTheme: _buildFilledButtonTheme(betheme),
    outlinedButtonTheme: _buildOutlinedButtonTheme(betheme),
    textButtonTheme: _buildTextButtonTheme(betheme),
    iconButtonTheme: _buildIconButtonTheme(betheme),
    floatingActionButtonTheme: _buildFloatingActionButtonTheme(betheme),
    segmentedButtonTheme: _buildSegmentedButtonTheme(betheme),
    toggleButtonsTheme: _buildToggleButtonsTheme(betheme),
    inputDecorationTheme: _buildInputDecorationTheme(betheme),
    expansionTileTheme: _buildExpansionTileTheme(betheme),
    listTileTheme: _buildListTileTheme(betheme),
    navigationBarTheme: _buildNavigationBarTheme(betheme),
    popupMenuTheme: _buildPopupMenuTheme(betheme),
    progressIndicatorTheme: _buildProgressIndicatorTheme(betheme),
    radioTheme: _buildRadioTheme(betheme),
    sliderTheme: _buildSliderTheme(betheme),
    snackBarTheme: _buildSnackBarTheme(betheme),
    switchTheme: _buildSwitchTheme(betheme),
    tabBarTheme: _buildTabBarTheme(betheme),
    textSelectionTheme: _buildTextSelectionTheme(betheme),
    timePickerTheme: _buildTimePickerTheme(betheme),
    tooltipTheme: _buildTooltipTheme(betheme),
    actionIconTheme: _buildActionIconTheme(betheme),
    dataTableTheme: _buildDataTableTheme(betheme),
    bottomSheetTheme: _buildBottomSheetTheme(betheme),
    bottomNavigationBarTheme: _buildBottomNavigationBarTheme(betheme),
    datePickerTheme: _buildDatePickerTheme(betheme),
    drawerTheme: _buildDrawerTheme(betheme),
    iconTheme: _buildIconTheme(betheme),
    bottomAppBarTheme: _buildBottomAppBarTheme(betheme),
    bannerTheme: _buildBannerTheme(betheme),
    menuBarTheme: _buildMenuBarTheme(betheme),
    menuButtonTheme: _buildMenuButtonTheme(betheme),
    navigationRailTheme: _buildNavigationRailTheme(betheme),
    pageTransitionsTheme: _buildPageTransitionsTheme(),
    scrollbarTheme: _buildScrollbarTheme(betheme),
    navigationDrawerTheme: _buildNavigationDrawerTheme(betheme),
    menuTheme: _buildMenuTheme(betheme),
    primaryIconTheme: _buildPrimaryIconTheme(betheme),
    searchBarTheme: _buildSearchBarTheme(betheme),
    primaryTextTheme: _buildPrimaryTextTheme(betheme),
    extensions: [betheme],

    // searchViewTheme: _buildSearchViewTheme(colorScheme),
  );
}

// ========== Color Scheme ==========
ColorScheme _buildColorScheme(final BeColor colors) {
  return ColorScheme(
    brightness: colors.isDark ? Brightness.dark : Brightness.light,

    // Primary color system from sophisticated palette
    primary: colors.primary,
    onPrimary: colors.onPrimary,
    primaryContainer: colors.primaryContainer,
    onPrimaryContainer: colors.onPrimaryContainer,
    primaryFixed: colors.primaryFixed,
    onPrimaryFixed: colors.onPrimaryFixed,
    primaryFixedDim: colors.primaryFixedDim,
    onPrimaryFixedVariant: colors.onPrimaryFixedVariant,

    // Secondary color system
    secondary: colors.secondary,
    onSecondary: colors.onSecondary,
    secondaryContainer: colors.secondaryContainer,
    onSecondaryContainer: colors.onSecondaryContainer,
    secondaryFixed: colors.secondaryContainer, // Use container as fixed
    onSecondaryFixed: colors.onSecondaryContainer,
    secondaryFixedDim: colors.secondary,
    onSecondaryFixedVariant: colors.onSecondary,

    // Tertiary color system
    tertiary: colors.tertiary,
    onTertiary: colors.onTertiary,
    tertiaryContainer: colors.tertiaryContainer,
    onTertiaryContainer: colors.onTertiaryContainer,
    tertiaryFixed: colors.tertiaryContainer,
    onTertiaryFixed: colors.onTertiaryContainer,
    tertiaryFixedDim: colors.tertiary,
    onTertiaryFixedVariant: colors.onTertiary,

    // Error system
    error: colors.error,
    onError: colors.onError,
    errorContainer: colors.errorContainer,
    onErrorContainer: colors.onErrorContainer,

    // Surface system from sophisticated neutrals
    surface: colors.surface,
    onSurface: colors.onSurface,
    surfaceDim: colors.surfaceDim,
    surfaceBright: colors.surfaceBright,
    surfaceContainerLowest: colors.surfaceContainerLowest,
    surfaceContainerLow: colors.surfaceContainerLow,
    surfaceContainer: colors.surfaceContainer,
    surfaceContainerHigh: colors.surfaceContainerHigh,
    surfaceContainerHighest: colors.surfaceContainerHighest,
    onSurfaceVariant: colors.onSurfaceVariant,

    // Outline system
    outline: colors.outline,
    outlineVariant: colors.outlineVariant,

    // Shadow and scrim
    shadow: colors.isDark ? const Color(0xFF000000) : const Color(0xFF000000),
    scrim: colors.isDark ? const Color(0xFF000000) : const Color(0xFF000000),

    // Inverse colors for contrast
    inverseSurface: colors.isDark ? colors.surfaceContainerHighest : colors.neutral10,
    onInverseSurface: colors.isDark ? colors.neutral10 : colors.surfaceContainerHighest,
    inversePrimary: colors.isDark ? colors.primaryLight : colors.primaryDark,

    // Surface tint
    surfaceTint: colors.primary,
  );
}

// ========== Component Themes ==========

AppBarTheme _buildAppBarTheme(final BeThemeData betheme) {
  final adaptiveStyle = betheme.style.adaptiveStyle;
  final colors = betheme.colors;

  return AppBarTheme(
    backgroundColor: colors.surface,
    foregroundColor: Colors.transparent,
    elevation: 0,
    actionsPadding: EdgeInsets.symmetric(horizontal: adaptiveStyle.buttonMediumPaddingHorizontal),
    scrolledUnderElevation: 2,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: adaptiveStyle.titleLargeTextSize,
      fontWeight: FontWeight.w500,
      color: colors.onSurface,
    ),
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.black.withAlpha(100),
    iconTheme: IconThemeData(color: colors.onSurface, size: 24),
    actionsIconTheme: IconThemeData(color: colors.onSurface, size: 24),
  );
}

BadgeThemeData _buildBadgeTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return BadgeThemeData(
    backgroundColor: colors.error,
    textColor: colors.onError,
    alignment: Alignment.topRight,
    offset: const Offset(12, -12),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colors.onError),
    smallSize: 6,
    largeSize: 16,
  );
}

ButtonThemeData _buildButtonTheme(final BeThemeData betheme) {
  return ButtonThemeData(
    alignedDropdown: true,

    // layoutBehavior: ButtonBarLayoutBehavior.padded,
    buttonColor: betheme.colors.error,

    // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
}

CardThemeData _buildCardTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return CardThemeData(
    color: colors.surface,
    elevation: 4,
    margin: const EdgeInsets.all(BeStyleConst.spacing12),
    shadowColor: BeColors.shadow,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BeStyleConst.cardBorderRadius,
      side: BorderSide(color: colors.outlineVariant, width: BeStyleConst.borderWidthThin),
    ),
    clipBehavior: Clip.antiAlias,
  );
}

CheckboxThemeData _buildCheckboxTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(colors.onPrimary),
    side: BorderSide(color: colors.outline, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

ChipThemeData _buildChipTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ChipThemeData(
    backgroundColor: colors.surfaceContainerHighest,
    deleteIconColor: colors.onSurfaceVariant,
    disabledColor: colors.onSurface.withAlpha(0.12.toAlpha()),
    selectedColor: colors.primary,
    secondarySelectedColor: colors.secondary,
    shadowColor: Colors.black,
    selectedShadowColor: Colors.black,
    showCheckmark: true,
    checkmarkColor: colors.onPrimary,
    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    labelStyle: TextStyle(color: colors.onSurface, fontSize: 12),
    secondaryLabelStyle: TextStyle(color: colors.onPrimary, fontSize: 12),
    brightness: colors.isDark ? Brightness.dark : Brightness.light,
    elevation: 0,
    pressElevation: 1,
    shape: const StadiumBorder(),
    side: BorderSide.none,
  );
}

DialogThemeData _buildDialogTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return DialogThemeData(
    backgroundColor: colors.surface,
    elevation: 8,
    shadowColor: BeColors.shadow,
    surfaceTintColor: Colors.transparent,
    // Responsive dialog border radius using design system tokens
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius + 4), // Slightly larger than buttons
    ),
    alignment: Alignment.center,
    // Responsive typography using design system tokens
    titleTextStyle: TextStyle(
      fontSize: adaptiveStyle.titleLargeTextSize,
      fontWeight: FontWeight.w700,
      color: colors.onSurface,
      fontFamily: BeUIConst.fontFamily,
    ),
    contentTextStyle: TextStyle(
      fontSize: adaptiveStyle.bodyLargeTextSize,
      fontWeight: FontWeight.w400,
      color: colors.onSurface,
      fontFamily: BeUIConst.fontFamily,
    ),
    actionsPadding: const EdgeInsets.symmetric(horizontal: BeStyleConst.spacing16, vertical: BeStyleConst.spacing12),
  );
}

// [Continues with all other theme builders...]
// (Note: Due to length, I've shown a subset. The full implementation would include all requested theme builders.)

// ========== Text Theme ==========
TextTheme _buildTextTheme(final BeStyle bestyle) {
  return TextTheme(
    displayLarge: bestyle.displayLarge,
    displayMedium: bestyle.displayMedium,
    displaySmall: bestyle.displaySmall,
    headlineLarge: bestyle.headlineLarge,
    headlineMedium: bestyle.headlineMedium,
    headlineSmall: bestyle.headlineSmall,
    titleLarge: bestyle.titleLarge,
    titleMedium: bestyle.titleMedium,
    titleSmall: bestyle.titleSmall,
    bodyLarge: bestyle.bodyLarge,
    bodyMedium: bestyle.bodyMedium,
    bodySmall: bestyle.bodySmall,
    labelLarge: bestyle.labelLarge,
    labelMedium: bestyle.labelMedium,
    labelSmall: bestyle.labelSmall,
  );
}

// ========== Remaining Theme Builders ==========

DividerThemeData _buildDividerTheme(final BeThemeData betheme) {
  return const DividerThemeData(
    color: BeColors.divider,
    thickness: 1,
    indent: 0,
    endIndent: 0,
    space: BeStyleConst.spacing16,
  );
}

DropdownMenuThemeData _buildDropdownMenuTheme(final BeThemeData betheme) {
  return DropdownMenuThemeData(
    textStyle: TextStyle(color: betheme.colors.textPrimary, fontSize: 16),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: BeColors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),

    menuStyle: MenuStyle(
      padding: const WidgetStatePropertyAll(p0),
      surfaceTintColor: const WidgetStatePropertyAll(BeColors.transparent),
      // side: const WidgetStatePropertyAll(BorderSide(color: Colors.red)),
      side: const WidgetStatePropertyAll(BorderSide.none),

      // visualDensity: const VisualDensity(horizontal: 1),
      backgroundColor: const WidgetStatePropertyAll(BeColors.white),

      elevation: const WidgetStatePropertyAll(8),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    ),
  );
}

ElevatedButtonThemeData _buildElevatedButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return ElevatedButtonThemeData(
    style: ButtonStyle(
      // Background colors with brand color system
      backgroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.primaryDark;
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.primaryLight;
        }
        return colors.primary;
      }),

      // Foreground colors for text and icons
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.textSecondary.withValues(alpha: 0.6);
        }
        return colors.onPrimary;
      }),

      // Overlay color for ripple effects
      overlayColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.onPrimary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.onPrimary.withValues(alpha: 0.05);
        }
        return Colors.transparent;
      }),

      // Modern flat design with subtle elevation
      elevation: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return 0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 1;
        }
        if (states.contains(WidgetState.hovered)) {
          return 2;
        }
        return 1;
      }),

      shadowColor: WidgetStateProperty.resolveWith((final states) {
        return colors.primary.withValues(alpha: 0.2);
      }),

      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),

      // Responsive text styling using design system typography tokens
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: adaptiveStyle.buttonMediumTextSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontFamily: BeUIConst.fontFamily,
        ),
      ),

      // Icon styling
      iconColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.textSecondary.withValues(alpha: 0.6);
        }
        return colors.onPrimary;
      }),
      iconSize: const WidgetStatePropertyAll(20),

      // Responsive padding using design system component tokens
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: adaptiveStyle.buttonMediumPaddingHorizontal,
          vertical: adaptiveStyle.inputContentPaddingVertical,
        ),
      ),

      // Responsive minimum size for touch targets
      minimumSize: WidgetStatePropertyAll(Size(0, adaptiveStyle.buttonMediumHeight)),

      // Animation duration for smooth interactions
      animationDuration: BeStyleConst.animationDurationFast,

      // Responsive shape using design system border radius tokens
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius)),
      ),
    ),
  );
}

ExpansionTileThemeData _buildExpansionTileTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ExpansionTileThemeData(
    backgroundColor: colors.surface,
    collapsedBackgroundColor: colors.surface,
    textColor: colors.onSurface,
    collapsedTextColor: colors.onSurface,
    iconColor: colors.onSurface,
    collapsedIconColor: colors.onSurface,
    childrenPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    expansionAnimationStyle: const AnimationStyle(
      curve: Curves.bounceInOut,
      reverseCurve: Curves.bounceIn,
      duration: Duration(seconds: 1),
    ),
    tilePadding: const EdgeInsets.symmetric(horizontal: 16),
    expandedAlignment: Alignment.centerLeft,
    collapsedShape: const BeRoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: 0.2),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    shape: BeRoundedRectangleBorder(
      backgroundColor: colors.tertiary.withAlpha(5),
      side: const BorderSide(color: Colors.grey, width: 0.2),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
  );
}

FilledButtonThemeData _buildFilledButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return FilledButtonThemeData(
    style: ButtonStyle(
      // Background colors using secondary color for accent behavior
      backgroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.secondaryDark;
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.secondaryLight;
        }
        return colors.secondary;
      }),

      // Foreground colors for text and icons
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.textSecondary.withValues(alpha: 0.6);
        }
        return colors.onSecondary;
      }),

      // Overlay color for ripple effects
      overlayColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.onSecondary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.onSecondary.withValues(alpha: 0.05);
        }
        return Colors.transparent;
      }),

      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),

      // Responsive text styling using design system typography tokens
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: adaptiveStyle.buttonMediumTextSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontFamily: BeUIConst.fontFamily,
        ),
      ),

      iconSize: const WidgetStatePropertyAll(20),

      // Responsive padding using design system component tokens
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: adaptiveStyle.buttonMediumPaddingHorizontal,
          vertical: adaptiveStyle.inputContentPaddingVertical,
        ),
      ),

      // Responsive minimum size for touch targets
      minimumSize: WidgetStatePropertyAll(Size(0, adaptiveStyle.buttonMediumHeight)),

      animationDuration: BeStyleConst.animationDurationFast,

      // Responsive shape using design system border radius tokens
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius)),
      ),
    ),
  );
}

FloatingActionButtonThemeData _buildFloatingActionButtonTheme(final BeThemeData betheme) {
  final swPrimary = BeColorUtils.createColorSwatch(betheme.colors.primary);
  return FloatingActionButtonThemeData(
    backgroundColor: swPrimary,
    foregroundColor: swPrimary.shade50,
    elevation: 3,
    focusElevation: 4,
    hoverElevation: 5,
    disabledElevation: 0,
    highlightElevation: 6,
    shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
    sizeConstraints: const BoxConstraints.tightFor(width: 36, height: 36),
    extendedIconLabelSpacing: 12,

    // largeSizeConstraints: const BoxConstraints.expand(),
    extendedSizeConstraints: const BoxConstraints.tightFor(height: 36),
    extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
    extendedTextStyle: const TextStyle(fontWeight: FontWeight.w500, color: BeColors.primary, fontSize: 14),
  );
}

IconButtonThemeData _buildIconButtonTheme(final BeThemeData betheme) {
  final swPrimary = BeColorUtils.createColorSwatch(betheme.colors.primary);
  return IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return BeColors.neutral50;
        }
        return swPrimary.shade500;
      }),
      padding: const WidgetStatePropertyAll(p8),
      overlayColor: const WidgetStatePropertyAll(BeColors.transparent),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      minimumSize: const WidgetStatePropertyAll(Size.zero),
      textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      iconColor: const WidgetStatePropertyAll(BeColors.slate700),
      iconSize: WidgetStateProperty.resolveWith((final state) {
        // if (state.containsAll([WidgetState.hovered, WidgetState.pressed])) {
        //   return 14.5;
        // }
        return 18;
      }),
      animationDuration: const Duration(milliseconds: 200),
    ),
  );
}

InputDecorationTheme _buildInputDecorationTheme(final BeThemeData betheme) {
  final adaptiveStyle = betheme.style.adaptiveStyle;
  final colors = betheme.colors;

  return InputDecorationTheme(
    filled: true,
    fillColor: colors.formFillColor,
    errorMaxLines: 2,

    // Responsive border styling with brand colors
    border: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(color: colors.outline, width: BeStyleConst.inputBorderWidthDefault),
    ),

    // Enabled state - subtle border for clean appearance
    enabledBorder: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(color: colors.outline.withValues(alpha: 0.4), width: BeStyleConst.inputBorderWidthDefault),
    ),

    // Focused state - prominent brand color border
    focusedBorder: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(color: colors.primary, width: BeStyleConst.inputBorderWidthFocus),
    ),

    // Error state - clear error indication
    errorBorder: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(color: colors.error, width: BeStyleConst.inputBorderWidthError),
    ),

    // Focused error state - prominent error with focus
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(color: colors.error, width: BeStyleConst.inputBorderWidthFocus),
    ),

    // Disabled state - visually distinct disabled appearance
    disabledBorder: OutlineInputBorder(
      borderRadius: BeStyleConst.inputBorderRadius,
      borderSide: BorderSide(
        color: colors.disabled.withValues(alpha: 0.2),
        width: BeStyleConst.inputBorderWidthDefault,
      ),
    ),

    contentPadding: BeStyleConst.inputContentPadding,

    // Simplified label styling - no floating labels for compact design
    labelStyle: TextStyle(
      fontSize: adaptiveStyle.inputLabelTextSize,
      fontWeight: FontWeight.w500,
      color: colors.textSecondary,
      letterSpacing: 0.1,
    ),

    // Disable floating labels for compact design
    floatingLabelStyle: TextStyle(
      fontSize: adaptiveStyle.inputLabelTextSize - 1,
      fontWeight: FontWeight.w600,
      color: colors.primary,
      letterSpacing: 0.1,
    ),

    // Hint text styling
    hintStyle: TextStyle(
      fontSize: adaptiveStyle.inputHintTextSize,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary.withValues(alpha: 0.6),
      letterSpacing: 0.2,
    ),

    // Error text styling with responsive sizing
    errorStyle: TextStyle(
      fontSize: adaptiveStyle.inputErrorTextSize,
      fontWeight: FontWeight.w500,
      color: colors.error,
      letterSpacing: 0.2,
      height: 1.3,
    ),

    // Helper text styling
    helperStyle: TextStyle(
      fontSize: adaptiveStyle.inputHelperTextSize,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary.withValues(alpha: 0.8),
      letterSpacing: 0.2,
    ),

    // Prefix and suffix styling
    prefixStyle: TextStyle(
      fontSize: adaptiveStyle.inputTextSize,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary,
    ),

    suffixStyle: TextStyle(
      fontSize: adaptiveStyle.inputTextSize,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary,
    ),

    // Counter styling
    counterStyle: TextStyle(
      fontSize: adaptiveStyle.inputHelperTextSize,
      fontWeight: FontWeight.w400,
      color: colors.textSecondary.withValues(alpha: 0.8),
    ),

    // Icon theming for consistent appearance
    prefixIconColor: colors.textSecondary,
    suffixIconColor: colors.textSecondary,

    isCollapsed: false,
    isDense: false,
    alignLabelWithHint: false,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
  );
}

ListTileThemeData _buildListTileTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ListTileThemeData(
    dense: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    tileColor: Colors.transparent,
    selectedTileColor: colors.primaryContainer,
    iconColor: colors.onSurfaceVariant,
    textColor: colors.onSurface,
    selectedColor: colors.onPrimaryContainer,
    contentPadding: px16 + py8,
    horizontalTitleGap: 16,
    minVerticalPadding: 8,
    enableFeedback: true,
    minTileHeight: 0,
    titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colors.onSurface),
    subtitleTextStyle: const TextStyle(fontSize: 12, color: BeColors.neutral60),
    mouseCursor: WidgetStateProperty.resolveWith((final states) {
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

NavigationBarThemeData _buildNavigationBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return NavigationBarThemeData(
    height: 80,
    backgroundColor: colors.surface,
    elevation: 3,
    indicatorColor: colors.secondaryContainer,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: WidgetStateProperty.resolveWith((final states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: isSelected ? colors.onSurface : colors.onSurfaceVariant,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((final states) {
      final isSelected = states.contains(WidgetState.selected);
      return IconThemeData(size: 24, color: isSelected ? colors.onSurface : colors.onSurfaceVariant);
    }),
  );
}

OutlinedButtonThemeData _buildOutlinedButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return OutlinedButtonThemeData(
    style: ButtonStyle(
      // Background - transparent for outlined style
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),

      // Foreground colors with brand color scheme
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.primaryDark;
        }
        return colors.primary;
      }),

      // Overlay color for button interactions
      overlayColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.primary.withValues(alpha: 0.05);
        }
        return Colors.transparent;
      }),

      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),

      // Responsive text styling using design system typography tokens
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: adaptiveStyle.buttonMediumTextSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontFamily: BeUIConst.fontFamily,
        ),
      ),

      // Icon styling - matches text color behavior
      iconColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.primaryDark;
        }
        return colors.primary;
      }),
      iconSize: const WidgetStatePropertyAll(20),

      // Border styling with state management
      side: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: colors.disabled, width: BeStyleConst.borderWidthThin);
        }
        if (states.contains(WidgetState.pressed)) {
          return BorderSide(color: colors.primary, width: BeStyleConst.borderWidthThick);
        }
        if (states.contains(WidgetState.focused)) {
          return BorderSide(color: colors.primary, width: BeStyleConst.borderWidthFocus);
        }
        return BorderSide(color: colors.primary, width: BeStyleConst.borderWidthThin);
      }),

      // Responsive padding using design system component tokens
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: adaptiveStyle.buttonMediumPaddingHorizontal,
          vertical: adaptiveStyle.inputContentPaddingVertical,
        ),
      ),

      // Responsive minimum size for touch targets
      minimumSize: WidgetStatePropertyAll(Size(0, adaptiveStyle.buttonMediumHeight)),

      animationDuration: BeStyleConst.animationDurationFast,

      // Responsive shape using design system border radius tokens
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius)),
      ),
    ),
  );
}

PopupMenuThemeData _buildPopupMenuTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return PopupMenuThemeData(
    color: colors.surface,
    elevation: 3,
    shadowColor: BeColors.gray200,
    surfaceTintColor: Colors.transparent,
    textStyle: TextStyle(fontSize: 14, color: colors.onSurface),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: BeColors.gray300, width: 0.2),
    ),
    position: PopupMenuPosition.under,
    iconColor: colors.onSurfaceVariant,
    iconSize: 24,
    enableFeedback: true,
    menuPadding: const EdgeInsets.all(8),
    mouseCursor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      return SystemMouseCursors.click;
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((final states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: isSelected ? colors.onSurface : colors.onSurfaceVariant,
      );
    }),
  );
}

ProgressIndicatorThemeData _buildProgressIndicatorTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ProgressIndicatorThemeData(
    color: colors.primary,
    linearTrackColor: colors.surfaceContainerHighest,
    circularTrackColor: colors.surfaceContainerHighest,
    refreshBackgroundColor: colors.surface,
    linearMinHeight: 4,
  );
}

RadioThemeData _buildRadioTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primary;
      }
      return colors.onSurfaceVariant;
    }),
    overlayColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.primary.withAlpha(0.1.toAlpha());
      }
      if (states.contains(WidgetState.hovered)) {
        return colors.onSurface.withAlpha(0.04.toAlpha());
      }
      return null;
    }),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );
}

SliderThemeData _buildSliderTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return SliderThemeData(
    activeTrackColor: colors.primary,
    inactiveTrackColor: colors.surfaceContainerHighest,
    secondaryActiveTrackColor: colors.primaryContainer,
    thumbColor: colors.primary,
    overlayColor: colors.primary.withAlpha(0.12.toAlpha()),
    valueIndicatorColor: colors.primary,
    activeTickMarkColor: colors.onPrimary,
    inactiveTickMarkColor: colors.surfaceContainerHighest,
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

SnackBarThemeData _buildSnackBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return SnackBarThemeData(
    backgroundColor: colors.isDark ? colors.surfaceContainerHighest : colors.neutral10,
    actionTextColor: colors.primary,
    disabledActionTextColor: colors.onSurface.withAlpha(0.38.toAlpha()),
    contentTextStyle: TextStyle(color: colors.isDark ? colors.neutral10 : colors.surfaceContainerHighest),
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    behavior: SnackBarBehavior.floating,
    width: 400,
    insetPadding: const EdgeInsets.all(16),
    showCloseIcon: true,
    closeIconColor: colors.isDark ? colors.neutral10 : colors.surfaceContainerHighest,
  );
}

SwitchThemeData _buildSwitchTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.onPrimary;
      }
      return colors.outlineVariant;
    }),
    trackColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primary;
      }
      return colors.surfaceContainerHighest;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return colors.outline;
    }),
    trackOutlineWidth: const WidgetStatePropertyAll(2),
    splashRadius: 16,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    mouseCursor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      return SystemMouseCursors.click;
    }),
  );
}

TabBarThemeData _buildTabBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return TabBarThemeData(
    indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: colors.primary)),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: colors.surfaceContainerHighest,
    labelColor: colors.primary,
    unselectedLabelColor: colors.onSurfaceVariant,
    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    overlayColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.primary.withAlpha(0.12.toAlpha());
      }
      return null;
    }),
    splashFactory: InkRipple.splashFactory,
  );
}

// ========== Text Button Theme ==========
TextButtonThemeData _buildTextButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return TextButtonThemeData(
    style: ButtonStyle(
      // Background - completely transparent for text button
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),

      // Foreground colors with subtle interaction states
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.primaryDark;
        }
        return colors.primary;
      }),

      // Subtle overlay for interactions
      overlayColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return colors.primary.withValues(alpha: 0.04);
        }
        return Colors.transparent;
      }),

      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),

      // Responsive text styling using design system typography tokens
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: adaptiveStyle.buttonMediumTextSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontFamily: BeUIConst.fontFamily,
        ),
      ),

      // Icon styling with interaction states
      iconColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabled;
        }
        return colors.primary;
      }),

      iconSize: const WidgetStatePropertyAll(20),

      // No border for text button
      side: const WidgetStatePropertyAll(BorderSide.none),

      // Responsive padding using design system component tokens (smaller for text button)
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: adaptiveStyle.buttonSmallPaddingHorizontal,
          vertical: adaptiveStyle.inputContentPaddingVertical * 0.7, // Slightly smaller vertical padding
        ),
      ),

      // Responsive minimum size for touch targets (smaller for text button)
      minimumSize: WidgetStatePropertyAll(Size(0, adaptiveStyle.buttonSmallHeight)),

      animationDuration: BeStyleConst.animationDurationFast,

      // Responsive shape using design system border radius tokens
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius)),
      ),
    ),
  );
}

TextSelectionThemeData _buildTextSelectionTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return TextSelectionThemeData(
    cursorColor: colors.primary,
    selectionColor: colors.primary.withAlpha(0.4.toAlpha()),
    selectionHandleColor: colors.primary,
  );
}

TimePickerThemeData _buildTimePickerTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return TimePickerThemeData(
    backgroundColor: colors.surface,
    hourMinuteTextColor: colors.onSurface,
    hourMinuteColor: colors.surfaceContainerHighest,
    dayPeriodTextColor: colors.onSurface,
    dayPeriodColor: colors.surfaceContainerHighest,
    dialHandColor: colors.primary,
    dialBackgroundColor: colors.surfaceContainerHighest,
    dialTextColor: colors.onSurfaceVariant,
    entryModeIconColor: colors.onSurfaceVariant,
    dayPeriodBorderSide: BorderSide(color: colors.outline),
    hourMinuteTextStyle: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
    dayPeriodTextStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    helpTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colors.onSurface),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    hourMinuteShape: const CircleBorder(),
    dayPeriodShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}

TooltipThemeData _buildTooltipTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return TooltipThemeData(
    constraints: const BoxConstraints(minHeight: 32),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    margin: const EdgeInsets.all(16),
    verticalOffset: 8,
    preferBelow: true,
    excludeFromSemantics: true,
    decoration: BoxDecoration(
      color: colors.isDark ? colors.surfaceContainerHighest : colors.neutral10,
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: TextStyle(color: colors.isDark ? colors.neutral10 : colors.surfaceContainerHighest, fontSize: 12),
    waitDuration: const Duration(milliseconds: 500),
    showDuration: const Duration(seconds: 2),
  );
}

ActionIconThemeData _buildActionIconTheme(final BeThemeData betheme) {
  return ActionIconThemeData(
    backButtonIconBuilder: (final context) =>
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.maybePop(context)),
    closeButtonIconBuilder: (final context) =>
        IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.maybePop(context)),
    drawerButtonIconBuilder: (final context) =>
        IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
    endDrawerButtonIconBuilder: (final context) =>
        IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openEndDrawer()),
  );
}

DataTableThemeData _buildDataTableTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return DataTableThemeData(
    dataRowColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primaryContainer;
      }
      return colors.surface;
    }),
    dataTextStyle: TextStyle(color: colors.onSurface),
    headingRowColor: WidgetStatePropertyAll(colors.surfaceContainerHighest),
    headingTextStyle: TextStyle(color: colors.onSurface, fontWeight: FontWeight.w600),
    horizontalMargin: 16,
    columnSpacing: 24,
    dividerThickness: 1,
    checkboxHorizontalMargin: 12,
    decoration: BoxDecoration(
      border: Border.all(color: colors.outline.withAlpha(0.2.toAlpha())),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

BottomSheetThemeData _buildBottomSheetTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return BottomSheetThemeData(
    backgroundColor: colors.surface,
    elevation: 6,
    modalBackgroundColor: colors.surface,
    modalElevation: 12,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    clipBehavior: Clip.antiAlias,
    constraints: const BoxConstraints(maxWidth: 640),
    surfaceTintColor: colors.primary,
    showDragHandle: true,
    dragHandleColor: colors.onSurfaceVariant,
    dragHandleSize: const Size(32, 4),
  );
}

BottomNavigationBarThemeData _buildBottomNavigationBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return BottomNavigationBarThemeData(
    backgroundColor: colors.surface,
    elevation: 3,
    selectedItemColor: colors.primary,
    unselectedItemColor: colors.onSurfaceVariant,
    selectedIconTheme: IconThemeData(color: colors.primary, size: 24),
    unselectedIconTheme: IconThemeData(color: colors.onSurfaceVariant, size: 24),
    selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    enableFeedback: true,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
  );
}

DatePickerThemeData _buildDatePickerTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return DatePickerThemeData(
    backgroundColor: colors.surface,
    elevation: 6,
    shadowColor: Colors.black,
    surfaceTintColor: colors.primary,
    headerBackgroundColor: colors.primary,
    headerForegroundColor: colors.onPrimary,
    weekdayStyle: TextStyle(color: colors.onSurface),
    dayStyle: TextStyle(color: colors.onSurface),
    yearStyle: TextStyle(color: colors.onSurface),
    rangePickerBackgroundColor: colors.surface,
    rangePickerElevation: 6,
    rangePickerShadowColor: Colors.black,
    rangePickerSurfaceTintColor: colors.primary,
    rangePickerHeaderBackgroundColor: colors.primary,
    rangePickerHeaderForegroundColor: colors.onPrimary,
    rangeSelectionBackgroundColor: colors.primaryContainer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    cancelButtonStyle: _buildTextButtonTheme(betheme).style,
    confirmButtonStyle: _buildTextButtonTheme(betheme).style,
    headerHelpStyle: TextStyle(color: colors.onSurfaceVariant),

    dayOverlayColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.selected)) {
        return colors.primary.withAlpha(0.12.toAlpha());
      }
      return null;
    }),
    todayBorder: BorderSide(color: colors.primary),
    todayForegroundColor: WidgetStatePropertyAll(colors.primary),
  );
}

DrawerThemeData _buildDrawerTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return DrawerThemeData(
    backgroundColor: colors.surface,
    elevation: 16,
    shadowColor: Colors.black,
    surfaceTintColor: colors.primary,
    shape: const RoundedRectangleBorder(),
    width: 304,
    scrimColor: Colors.black.withAlpha(0.5.toAlpha()),
    endShape: const RoundedRectangleBorder(),
  );
}

IconThemeData _buildIconTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return IconThemeData(
    color: colors.onSurfaceVariant,
    size: 24,
    fill: 0.0,
    weight: 400,
    grade: 0,
    opticalSize: 48,
    shadows: null,
  );
}

BottomAppBarThemeData _buildBottomAppBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return BottomAppBarThemeData(
    color: colors.surface,
    elevation: 4,
    shadowColor: Colors.black,
    surfaceTintColor: colors.primary,
    height: 80,
    padding: EdgeInsets.zero,
    shape: const AutomaticNotchedShape(RoundedRectangleBorder(), StadiumBorder()),
  );
}

MaterialBannerThemeData _buildBannerTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return MaterialBannerThemeData(
    backgroundColor: colors.surfaceContainerHighest,
    contentTextStyle: TextStyle(color: colors.onSurfaceVariant),
    leadingPadding: const EdgeInsets.only(left: 16),
    padding: const EdgeInsets.symmetric(horizontal: 8),
    elevation: 1,
  );
}

MenuBarThemeData _buildMenuBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return MenuBarThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colors.surface),
      elevation: const WidgetStatePropertyAll(2),
      shadowColor: const WidgetStatePropertyAll(Colors.black),
      surfaceTintColor: WidgetStatePropertyAll(colors.primary),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    ),
  );
}

MenuButtonThemeData _buildMenuButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return MenuButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.pressed)) {
          return colors.primary.withAlpha(0.12.toAlpha());
        }
        return null;
      }),
      foregroundColor: WidgetStatePropertyAll(colors.onSurface),
      overlayColor: WidgetStatePropertyAll(colors.primary.withAlpha(0.08.toAlpha())),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    ),
  );
}

NavigationRailThemeData _buildNavigationRailTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return NavigationRailThemeData(
    backgroundColor: colors.surface,
    elevation: 2,
    unselectedLabelTextStyle: TextStyle(color: colors.onSurfaceVariant),
    selectedLabelTextStyle: TextStyle(color: colors.primary),
    unselectedIconTheme: IconThemeData(color: colors.onSurfaceVariant),
    selectedIconTheme: IconThemeData(color: colors.primary),
    labelType: NavigationRailLabelType.all,
    groupAlignment: 0,
    useIndicator: true,
    indicatorColor: colors.secondaryContainer,
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

ScrollbarThemeData _buildScrollbarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ScrollbarThemeData(
    thumbColor: WidgetStateProperty.resolveWith((final states) {
      if (states.contains(WidgetState.pressed)) {
        return colors.onSurface.withAlpha(0.6.toAlpha());
      }
      if (states.contains(WidgetState.hovered)) {
        return colors.onSurface.withAlpha(0.4.toAlpha());
      }
      return colors.onSurface.withAlpha(0.3.toAlpha());
    }),
    trackColor: WidgetStatePropertyAll(colors.surfaceContainerHighest),
    trackBorderColor: WidgetStatePropertyAll(colors.outline),
    thickness: WidgetStateProperty.resolveWith((final states) {
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

NavigationDrawerThemeData _buildNavigationDrawerTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return NavigationDrawerThemeData(
    backgroundColor: colors.surface,
    elevation: 16,
    shadowColor: Colors.black,
    surfaceTintColor: colors.primary,
    indicatorColor: colors.secondaryContainer,
    indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    labelTextStyle: WidgetStateProperty.resolveWith((final states) {
      final isSelected = states.contains(WidgetState.selected);
      return TextStyle(
        color: isSelected ? colors.onSurface : colors.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((final states) {
      final isSelected = states.contains(WidgetState.selected);
      return IconThemeData(color: isSelected ? colors.onSurface : colors.onSurfaceVariant);
    }),
  );
}

MenuThemeData _buildMenuTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return MenuThemeData(
    style: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(colors.surface),
      elevation: const WidgetStatePropertyAll(8),
      shadowColor: const WidgetStatePropertyAll(Colors.black),
      surfaceTintColor: WidgetStatePropertyAll(colors.primary),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
    ),
  );
}

IconThemeData _buildPrimaryIconTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return IconThemeData(
    color: colors.primary,
    size: 24,
    fill: 0.0,
    weight: 400,
    grade: 0,
    opticalSize: 48,
    shadows: null,
  );
}

SearchBarThemeData _buildSearchBarTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(colors.surfaceContainerHighest),
    elevation: const WidgetStatePropertyAll(0),
    surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
    overlayColor: WidgetStatePropertyAll(colors.primary.withAlpha(0.12.toAlpha())),
    shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    side: WidgetStatePropertyAll(BorderSide(color: colors.outline.withAlpha(0.5.toAlpha()))),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    textStyle: WidgetStatePropertyAll(TextStyle(color: colors.onSurface, fontSize: 16)),
    hintStyle: WidgetStatePropertyAll(TextStyle(color: colors.onSurfaceVariant, fontSize: 16)),
    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
    constraints: const BoxConstraints(minHeight: 56),
  );
}

// ========== Segmented Button Theme ==========
SegmentedButtonThemeData _buildSegmentedButtonTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return SegmentedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.selected)) {
          return colors.primary;
        }
        return Colors.transparent;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((final states) {
        if (states.contains(WidgetState.selected)) {
          return colors.onPrimary;
        }
        return colors.primary;
      }),

      elevation: const WidgetStatePropertyAll(0),

      // Responsive text styling using design system typography tokens
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: adaptiveStyle.buttonMediumTextSize,
          fontWeight: FontWeight.w500,
          fontFamily: BeUIConst.fontFamily,
        ),
      ),

      side: WidgetStatePropertyAll(BorderSide(color: colors.primary)),

      // Responsive shape using design system border radius tokens
      shape: WidgetStatePropertyAll(
        RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(adaptiveStyle.buttonBorderRadius),
          side: const BorderSide(),
        ),
      ),
    ),
  );
}

ToggleButtonsThemeData _buildToggleButtonsTheme(final BeThemeData betheme) {
  final colors = betheme.colors;

  return ToggleButtonsThemeData(
    color: colors.onSurfaceVariant,
    selectedColor: colors.onPrimary,
    disabledColor: colors.onSurface.withAlpha(0.38.toAlpha()),
    fillColor: Colors.transparent,
    focusColor: colors.primary.withAlpha(0.12.toAlpha()),
    highlightColor: colors.primary.withAlpha(0.12.toAlpha()),
    hoverColor: colors.primary.withAlpha(0.08.toAlpha()),
    splashColor: colors.primary.withAlpha(0.12.toAlpha()),
    borderColor: colors.outline,
    selectedBorderColor: colors.primary,
    disabledBorderColor: colors.onSurface.withAlpha(0.12.toAlpha()),
    borderRadius: BorderRadius.circular(8),
    borderWidth: 1,
    constraints: const BoxConstraints(minHeight: 40, minWidth: 64),
  );
}

TextTheme _buildPrimaryTextTheme(final BeThemeData betheme) {
  final colors = betheme.colors;
  final adaptiveStyle = betheme.style.adaptiveStyle;

  return TextTheme(
    displayLarge: TextStyle(
      fontSize: adaptiveStyle.displayLargeTextSize,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      color: colors.primary,
    ),
    displayMedium: TextStyle(
      fontSize: adaptiveStyle.displayMediumTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    displaySmall: TextStyle(
      fontSize: adaptiveStyle.displaySmallTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    headlineLarge: TextStyle(
      fontSize: adaptiveStyle.headlineLargeTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    headlineMedium: TextStyle(
      fontSize: adaptiveStyle.headlineMediumTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    headlineSmall: TextStyle(
      fontSize: adaptiveStyle.headlineSmallTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    titleLarge: TextStyle(
      fontSize: adaptiveStyle.titleLargeTextSize,
      fontWeight: FontWeight.w400,
      color: colors.primary,
    ),
    titleMedium: TextStyle(
      fontSize: adaptiveStyle.titleMediumTextSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: colors.primary,
    ),
    titleSmall: TextStyle(
      fontSize: adaptiveStyle.titleSmallTextSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: colors.primary,
    ),
    bodyLarge: TextStyle(
      fontSize: adaptiveStyle.bodyLargeTextSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: colors.primary,
    ),
    bodyMedium: TextStyle(
      fontSize: adaptiveStyle.bodyMediumTextSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: colors.primary,
    ),
    bodySmall: TextStyle(
      fontSize: adaptiveStyle.bodySmallTextSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: colors.primary,
    ),
    labelLarge: TextStyle(
      fontSize: adaptiveStyle.labelLargeTextSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: colors.primary,
    ),
    labelMedium: TextStyle(
      fontSize: adaptiveStyle.labelMediumTextSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: colors.primary,
    ),
    labelSmall: TextStyle(
      fontSize: adaptiveStyle.labelSmallTextSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: colors.primary,
    ),
  );
}
