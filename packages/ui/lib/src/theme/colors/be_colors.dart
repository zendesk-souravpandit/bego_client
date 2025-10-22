import 'package:flutter/material.dart';

/// Modern theme colors based on sophisticated neutral palette
///
/// | **Color Type**      | **Color Name**      | **Hex Code**  | **Usage** |
/// |-------------------|-------------------|--------------|-----------|
/// | **Primary**       | Primary           | `0xFFBE3455` | Accent/brand color |
/// |                  | Primary Dark      | `0xFF8E1A35` | Hover/pressed states |
/// |                  | Primary Light     | `0xFFDA5A7A` | Subtle backgrounds |
/// | **Neutrals**      | Dark Blue         | `0xFF2D3142` | Primary text/headers |
/// |                  | Slate Blue        | `0xFF4F5D75` | Secondary text |
/// |                  | Sage Green        | `0xFF7A9E7E` | Accent elements |
/// |                  | Cream             | `0xFFFFF8F0` | Light background |
/// |                  | Light Beige       | `0xFFF7F4F3` | Card backgrounds |
/// |                  | Off White         | `0xFFFFFCF9` | Primary surface |

class BeColors {
  const BeColors._(); // Private constructor

  // Primary Brand Colors - Design System Implementation
  // colorPrimary: #2D3142 (Deep dark blue-grey) - Primary brand color
  static const Color primary = Color(0xFF2D3142); // Main brand color - deep dark blue-grey
  static const Color primaryDark = Color(0xFF1E1F2A); // Darker variant for pressed states
  static const Color primaryLight = Color(0xFF4F5D75); // Lighter variant - muted blue-grey
  // colorPrimaryContainer: #4F5D75 (Muted blue-grey) - Primary container backgrounds
  static const Color primaryContainer = Color(0xFF4F5D75); // Primary container - muted blue-grey
  static const Color primaryFixed = Color(0xFF4F5D75); // Fixed primary
  static const Color primaryFixedDim = Color(0xFF3A4556); // Dimmed fixed primary
  // colorOnPrimary: #FFFFFF (White) - Text/icons on primary
  static const Color onPrimary = Color(0xFFFFFFFF); // Text on primary - white
  // colorOnPrimaryContainer: #FFFFFFB3 (White 70% opacity) - Text on primary containers
  static const Color onPrimaryContainer = Color(0xFFFFFFB3); // Text on primary container - white 70% opacity
  static const Color onPrimaryFixed = Color(0xFFFFFFFF); // Text on fixed primary - white
  static const Color onPrimaryFixedVariant = Color(0xFFF5F5F5); // Text variant on fixed primary

  // Sophisticated Neutral Palette - Your color suggestions
  static const Color darkBlue = Color(0xFF2D3142); // Primary text/headers
  static const Color slateBlue = Color(0xFF4F5D75); // Secondary text
  static const Color sageGreen = Color(0xFF7A9E7E); // Accent elements
  static const Color cream = Color(0xFFFFF8F0); // Light background
  static const Color lightBeige = Color(0xFFF7F4F3); // Card backgrounds
  static const Color offWhite = Color(0xFFFFFCF9); // Primary surface

  // Text Colors - Design System Hierarchy
  static const Color textPrimary = Color(0xFF2D3142); // Main text - dark blue-grey
  static const Color textSecondary = Color(0xFF4F5D75); // Secondary text - muted blue-grey
  static const Color textMuted = Color(0xFF7A9E7E); // Muted text - sage green accent
  static const Color textDisabled = Color(0xFF9CA3AF); // Disabled text

  // Surface Colors - Design System Implementation
  // colorSurface: #FFF8F0 (Soft warm off-white) - Cards, sheets
  // colorBackground: #FFF8F0 (Soft warm off-white) - App background
  static const Color surface = Color(0xFFFAFAFA); // Primary surface - soft warm off-white
  static const Color surfaceDim = Color(0xFFF7F4F3); // Dimmed surface - light beige
  static const Color surfaceBright = Color(0xFFFFFFFF); // Brightest surface - pure white
  static const Color surfaceContainer = Color(0xFFF7F4F3); // Card/container surface - light beige
  static const Color surfaceContainerHigh = Color(0xFFFFF8F0); // High elevation container - cream
  static const Color surfaceContainerHighest = Color(0xFFF0EFEF); // Highest elevation
  static const Color surfaceContainerLow = Color(0xFFFAFAFA); // Low elevation container
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF); // Lowest/white surface
  static const Color surfaceVariant = Color(0xFFFFF8F0); // Elevated surface - cream
  // colorOnSurface: #2D3142 (Dark blue-grey) - Text/icons on surfaces
  static const Color onSurface = Color(0xFF2D3142); // Text on surface - dark blue-grey
  // colorOnBackground: #2D3142 (Dark blue-grey) - Text on background
  static const Color onSurfaceVariant = Color(0xFF4F5D75); // Text on surface variant - muted blue-grey

  // Secondary Colors - Accent color system using warm red
  // colorSecondary: #BE3455 (Warm strong red) - Accent buttons/highlights
  static const Color secondary = Color(0xFFBE3455); // Strong warm red - accent color
  static const Color secondaryDark = Color(0xFF8E1A35); // Darker secondary for pressed states
  static const Color secondaryLight = Color(0xFFDA5A7A); // Lighter secondary
  // colorSecondaryContainer: #FFF8F0 (Soft warm off-white) - Secondary container backgrounds
  static const Color secondaryContainer = Color(0xFFFFF8F0); // Secondary container - soft warm off-white
  // colorOnSecondary: #FFFFFF (White) - Text/icons on secondary
  static const Color onSecondary = Color(0xFFFFFFFF); // Text on secondary - white
  // colorOnSecondaryContainer: #BE3455 (Warm red) - Text on secondary containers
  static const Color onSecondaryContainer = Color(0xFFBE3455); // Text on secondary container - warm red

  // Tertiary Colors - Warm complement
  static const Color tertiary = Color(0xFF7D5635); // Warm brown tertiary
  static const Color tertiaryDark = Color(0xFF5A3D25); // Darker tertiary
  static const Color tertiaryLight = Color(0xFFA17555); // Lighter tertiary
  static const Color tertiaryContainer = Color(0xFFFFE0CC); // Tertiary container
  static const Color onTertiary = Color(0xFFFFFFFF); // Text on tertiary
  static const Color onTertiaryContainer = Color(0xFF2B1A0F); // Text on tertiary container

  // Semantic Colors - Design System Implementation
  // colorError: #BE3455 (Warm red) - Errors and validation messages
  static const Color error = Color(0xFFA24936); // Error - warm red
  static const Color errorDark = Color(0xFF8E1A35); // Dark error
  static const Color errorLight = Color(0xFFDA5A7A); // Light error
  static const Color errorContainer = Color(0xFFFFEDEA); // Error container
  // colorOnError: #FFFFFF (White) - Text on error background
  static const Color onError = Color(0xFFFFFFFF); // Text on error - white
  static const Color onErrorContainer = Color(0xFF410E0B); // Text on error container

  static const Color success = Color(0xFF16A34A); // Modern success green
  static const Color successDark = Color(0xFF15803D); // Dark success
  static const Color successLight = Color(0xFF4ADE80); // Light success
  static const Color successContainer = Color(0xFFDCFCE7); // Success container
  static const Color onSuccess = Color(0xFFFFFFFF); // Text on success
  static const Color onSuccessContainer = Color(0xFF052E16); // Text on success container

  static const Color warning = Color(0xFFF59E0B); // Modern warning amber
  static const Color warningDark = Color(0xFFD97706); // Dark warning
  static const Color warningLight = Color(0xFFFBBF24); // Light warning
  static const Color warningContainer = Color(0xFFFEF3C7); // Warning container
  static const Color onWarning = Color(0xFF000000); // Text on warning
  static const Color onWarningContainer = Color(0xFF451A03); // Text on warning container
  static const Color info = Color(0xFF2563EB); // Modern info blue
  static const Color infoDark = Color(0xFF1D4ED8); // Dark info
  static const Color infoLight = Color(0xFF60A5FA); // Light info
  static const Color infoContainer = Color(0xFFDBEAFE); // Info container
  static const Color onInfo = Color(0xFFFFFFFF); // Text on info
  static const Color onInfoContainer = Color(0xFF1E3A8A); // Text on info container

  // Neutral System - Sophisticated blue-grey scale
  static const Color neutral10 = Color(0xFF2D3142); // Deep charcoal blue
  static const Color neutral20 = Color(0xFF393E52); // Rich midnight blue
  static const Color neutral30 = Color(0xFF4F5D75); // Muted blue-grey
  static const Color neutral40 = Color(0xFF667387); // Medium blue-grey
  static const Color neutral50 = Color(0xFF7F8C9F); // Balanced neutral
  static const Color neutral60 = Color(0xFF9AA6B8); // Soft cool grey
  static const Color neutral80 = Color(0xFFD2D8E2); // Light neutral
  static const Color neutral90 = Color(0xFFE8EBF1); // Very light neutral
  static const Color neutral95 = Color(0xFFF5F6FA); // Nearly white
  static const Color neutral99 = Color(0xFFFFFCF9); // Soft off-white

  // Neutral Variant System - Sage-tinted neutrals for soft contrast
  static const Color neutralVariant30 = Color(0xFF50615F);
  static const Color neutralVariant50 = Color(0xFF708681);
  static const Color neutralVariant80 = Color(0xFFCBD9D3);
  static const Color neutralVariant90 = Color(0xFFE6F0EA);

  // Outline & Utility Colors - Design System Implementation
  static const Color outline = Color(0xFF94A3B8); // Crisp outline
  static const Color outlineVariant = Color(0xFFD8DEE6); // Subtle outline
  // colorDivider: #7A9E7E4D (Muted green, 30% opacity) - Divider lines
  static const Color divider = Color(0x4D7A9E7E); // Sage divider at 30% opacity
  // colorDisabled: #4F5D7566 (Muted blue-grey 40% opacity) - Disabled UI elements
  static const Color disabledColor = Color(0x664F5D75); // Muted blue-grey at 40%
  // colorHint: #4F5D757F (Muted blue-grey, 50% opacity) - Hint texts
  static const Color hintColor = Color(0x7F4F5D75); // Muted blue-grey at 50%
  // colorFocus: #BE345520 (Warm red, 12% opacity) - Focus outlines/highlights
  static const Color focusColor = Color(0x1FBE3455); // Warm red at 12%
  // colorHover: #7A9E7E1A (Muted green, 10% opacity) - Hover highlights
  static const Color hoverColor = Color(0x1A7A9E7E); // Sage green at 10%
  // colorHighlight: #BE345519 (Warm red, 10% opacity) - Ink ripple highlights
  static const Color highlightColor = Color(0x19BE3455); // Warm red highlight at 10%
  // colorShadow: #0000000D (Black, 5% opacity) - Shadows
  static const Color shadow = Color(0x0D000000); // Soft shadow at 5%
  // colorUnselectedWidget: #4F5D75B3 (Muted grey, 70% opacity) - Unselected widgets
  static const Color unselectedWidget = Color(0xB34F5D75); // Muted blue-grey at 70%

  // Legacy/Utility Colors
  static const Color transparent = Colors.transparent;
  // Light Theme Text Colors
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF374151);
  static const Color lightTextMuted = Color(0xFF6B7280);
  static const Color lightTextDisabled = Color(0xFF9CA3AF);
  static const Color lightTextLink = Color(0xFF2563EB);

  static const Color white = Color(0xFFFFFFFF);

  static const Color darkTextPrimary = Color(0xFFF5F5F5);
  static const Color darkTextSecondary = Color(0xFFD1D5DB);
  static const Color darkTextMuted = Color(0xFF9CA3AF);
  static const Color darkTextDisabled = Color(0xFF6B7280);
  static const Color darkTextLink = Color(0xFF93C5FD);

  static const slate50 = Color(0xFFF8FAFC);
  static const slate100 = Color(0xFFF3F4F6);
  static const slate200 = Color(0xFFE2E8F0);
  static const slate300 = Color(0xFFCBD5E1);
  static const slate400 = Color(0xFF94A3B8);
  static const slate500 = Color(0xFF64748B);
  static const slate600 = Color(0xFF475569);
  static const slate700 = Color(0xFF334155);
  static const slate800 = Color(0xFF1E293B);
  static const slate900 = Color(0xFF0F172A);
  static const slate = slate500;

  // color black and variation
  static const black100 = Color.fromRGBO(0, 0, 0, 0.1);
  static const black200 = Color.fromRGBO(0, 0, 0, 0.2);
  static const black300 = Color.fromRGBO(0, 0, 0, 0.3);
  static const black400 = Color.fromRGBO(0, 0, 0, 0.4);
  static const black500 = Color.fromRGBO(0, 0, 0, 0.5);
  static const black600 = Color.fromRGBO(0, 0, 0, 0.6);
  static const black700 = Color.fromRGBO(0, 0, 0, 0.7);
  static const black800 = Color.fromRGBO(0, 0, 0, 0.8);
  static const black900 = Color.fromRGBO(0, 0, 0, 0.9);
  static const black = Color.fromRGBO(0, 0, 0, 1);

  // color Blue Gray and variations
  static const blueGray50 = Color(0xFFF8FAFC);
  static const blueGray100 = Color(0xFFF3F4F6);
  static const blueGray200 = Color(0xFFE2E8F0);
  static const blueGray300 = Color(0xFFCBD5E1);
  static const blueGray400 = Color(0xFF94A3B8);
  static const blueGray500 = Color(0xFF64748B);
  static const blueGray600 = Color(0xFF475569);
  static const blueGray700 = Color(0xFF334155);
  static const blueGray800 = Color(0xFF1E293B);
  static const blueGray900 = Color(0xFF0F172A);
  static const blueGray = blueGray500;

  // color black and variation
  static const gray50 = Color(0xFFFAFAFA);
  static const gray100 = Color(0xFFF5F5F5);
  static const gray200 = Color(0xFFE4E4E7);
  static const gray300 = Color(0xFFD4D4D8);
  static const gray400 = Color(0xFFA1A1AA);
  static const gray500 = Color(0xFF71717A);
  static const gray600 = Color(0xFF52525B);
  static const gray700 = Color(0xFF3F3F46);
  static const gray800 = Color(0xFF27272A);
  static const gray900 = Color(0xFF18181B);
  static const gray = gray500;

  // color Red shades
  static const red50 = Color(0xFFFEF2F2);
  static const red100 = Color(0xFFFEE2E2);
  static const red200 = Color(0xFFFECACA);
  static const red300 = Color(0xFFFCA5A5);
  static const red400 = Color(0xFFF87171);
  static const red500 = Color(0xFFEF4444);
  static const red600 = Color(0xFFDC2626);
  static const red700 = Color(0xFFB91C1C);
  static const red800 = Color(0xFF991B1B);
  static const red900 = Color(0xFF7F1D1D);
  static const red = red500;

  // Orange and shades
  static const orange50 = Color(0xFFFFF7ED);
  static const orange100 = Color(0xFFFFEDD5);
  static const orange200 = Color(0xFFFED7AA);
  static const orange300 = Color(0xFFFDBA74);
  static const orange400 = Color(0xFFFB923C);
  static const orange500 = Color(0xFFF97316);
  static const orange600 = Color(0xFFEA580C);
  static const orange700 = Color(0xFFC2410C);
  static const orange800 = Color(0xFF9A3412);
  static const orange900 = Color(0xFF7C2D12);
  static const orange = orange500;

  // Amber and shades
  static const amber50 = Color(0xFFFFFBEB);
  static const amber100 = Color(0xFFFEF3C7);
  static const amber200 = Color(0xFFFDE68A);
  static const amber300 = Color(0xFFFCD34D);
  static const amber400 = Color(0xFFFBBF24);
  static const amber500 = Color(0xFFF59E0B);
  static const amber600 = Color(0xFFD97706);
  static const amber700 = Color(0xFFB45309);
  static const amber800 = Color(0xFF92400E);
  static const amber900 = Color(0xFF78350F);
  static const amber = amber500;

  // Yellow and shades
  static const yellow50 = Color(0xFFFEFCE8);
  static const yellow100 = Color(0xFFFEF9C3);
  static const yellow200 = Color(0xFFFEF08A);
  static const yellow300 = Color(0xFFFDE047);
  static const yellow400 = Color(0xFFFACC15);
  static const yellow500 = Color(0xFFEAB308);
  static const yellow600 = Color(0xFFCA8A04);
  static const yellow700 = Color(0xFFA16207);
  static const yellow800 = Color(0xFF854D0E);
  static const yellow900 = Color(0xFF713F12);
  static const yellow = yellow500;

  // Lime and shades
  static const lime50 = Color(0xFFF7FEE7);
  static const lime100 = Color(0xFFECFCCB);
  static const lime200 = Color(0xFFD9F99D);
  static const lime300 = Color(0xFFBEF264);
  static const lime400 = Color(0xFFA3E635);
  static const lime500 = Color(0xFF84CC16);
  static const lime600 = Color(0xFF65A30D);
  static const lime700 = Color(0xFF4D7C0F);
  static const lime800 = Color(0xFF3F6212);
  static const lime900 = Color(0xFF365314);
  static const lime = lime500;

  // Green and shades
  static const green50 = Color(0xFFF0FDF4);
  static const green100 = Color(0xFFDCFCE7);
  static const green200 = Color(0xFFBBF7D0);
  static const green300 = Color(0xFF86EFAC);
  static const green400 = Color(0xFF4ADE80);
  static const green500 = Color(0xFF22C55E);
  static const green600 = Color(0xFF16A34A);
  static const green700 = Color(0xFF15803D);
  static const green800 = Color(0xFF166534);
  static const green900 = Color(0xFF14532D);
  static const green = green500;

  // Emerald and shades
  static const emerald50 = Color(0xFFF0FDF4);
  static const emerald100 = Color(0xFFD1FAE5);
  static const emerald200 = Color(0xFFA7F3D0);
  static const emerald300 = Color(0xFF6EE7B7);
  static const emerald400 = Color(0xFF34D399);
  static const emerald500 = Color(0xFF10B981);
  static const emerald600 = Color(0xFF059669);
  static const emerald700 = Color(0xFF047857);
  static const emerald800 = Color(0xFF065F46);
  static const emerald900 = Color(0xFF064E3B);
  static const emerald = emerald500;

  // Green and shades
  static const teal50 = Color(0xFFF0FDFA);
  static const teal100 = Color(0xFFCCFBF1);
  static const teal200 = Color(0xFF99F6E4);
  static const teal300 = Color(0xFF5EEAD4);
  static const teal400 = Color(0xFF2DD4BF);
  static const teal500 = Color(0xFF14B8A6);
  static const teal600 = Color(0xFF0D9488);
  static const teal700 = Color(0xFF0F766E);
  static const teal800 = Color(0xFF115E59);
  static const teal900 = Color(0xFF134E4A);
  static const teal = teal500;

  // Green and shades
  static const cyan50 = Color(0xFFECFEFF);
  static const cyan100 = Color(0xFFCFFAFE);
  static const cyan200 = Color(0xFFA5F3FC);
  static const cyan300 = Color(0xFF67E8F9);
  static const cyan400 = Color(0xFF22D3EE);
  static const cyan500 = Color(0xFF06B6D4);
  static const cyan600 = Color(0xFF0891B2);
  static const cyan700 = Color(0xFF0E7490);
  static const cyan800 = Color(0xFF155E75);
  static const cyan900 = Color(0xFF164E63);
  static const cyan = cyan500;

  // Light Blue and shades
  static const lightBlue50 = Color(0xFFECFEFF);
  static const lightBlue100 = Color(0xFFE0F2FE);
  static const lightBlue200 = Color(0xFFBAE6FD);
  static const lightBlue300 = Color(0xFF7DD3FC);
  static const lightBlue400 = Color(0xFF38BDF8);
  static const lightBlue500 = Color(0xFF0EA5E9);
  static const lightBlue600 = Color(0xFF0284C7);
  static const lightBlue700 = Color(0xFF0369A1);
  static const lightBlue800 = Color(0xFF075985);
  static const lightBlue900 = Color(0xFF0C4A6E);
  static const lightBlue = lightBlue500;

  // Blue and shades
  static const blue50 = Color(0xFFEFF6FF);
  static const blue100 = Color(0xFFDBEAFE);
  static const blue200 = Color(0xFFBFDBFE);
  static const blue300 = Color(0xFF93C5FD);
  static const blue400 = Color(0xFF60A5FA);
  static const blue500 = Color(0xFF3B82F6);
  static const blue600 = Color(0xFF2563EB);
  static const blue700 = Color(0xFF1D4ED8);
  static const blue800 = Color(0xFF1E40AF);
  static const blue900 = Color(0xFF1E3A8A);
  static const blue = blue500;

  // Indigo and shades
  static const indigo50 = Color(0xFFEEF2FF);
  static const indigo100 = Color(0xFFE0E7FF);
  static const indigo200 = Color(0xFFC7D2FE);
  static const indigo300 = Color(0xFFA5B4FC);
  static const indigo400 = Color(0xFF818CF8);
  static const indigo500 = Color(0xFF6366F1);
  static const indigo600 = Color(0xFF4F46E5);
  static const indigo700 = Color(0xFF4338CA);
  static const indigo800 = Color(0xFF3730A3);
  static const indigo900 = Color(0xFF312E81);
  static const indigo = indigo500;

  // Voilet and shades
  static const voilet50 = Color(0xFFF5F3FF);
  static const voilet100 = Color(0xFFEDE9FE);
  static const voilet200 = Color(0xFFDDD6FE);
  static const voilet300 = Color(0xFFC4B5FD);
  static const voilet400 = Color(0xFFA78BFA);
  static const voilet500 = Color(0xFF8B5CF6);
  static const voilet600 = Color(0xFF7C3AED);
  static const voilet700 = Color(0xFF6D28D9);
  static const voilet800 = Color(0xFF5B21B6);
  static const voilet900 = Color(0xFF4C1D95);
  static const voilet = voilet500;

  // Purple and shades
  static const purple50 = Color(0xFFFAF5FF);
  static const purple100 = Color(0xFFF3E8FF);
  static const purple200 = Color(0xFFE9D5FF);
  static const purple300 = Color(0xFFD8B4FE);
  static const purple400 = Color(0xFFC084FC);
  static const purple500 = Color(0xFFA855F7);
  static const purple600 = Color(0xFF9333EA);
  static const purple700 = Color(0xFF7E22CE);
  static const purple800 = Color(0xFF6B21A8);
  static const purple900 = Color(0xFF581C87);
  static const purple = voilet500;

  // Purple and shades
  static const fuchsia50 = Color(0xFFFAF5FF);
  static const fuchsia100 = Color(0xFFFAE8FF);
  static const fuchsia200 = Color(0xFFF5D0FE);
  static const fuchsia300 = Color(0xFFF0ABFC);
  static const fuchsia400 = Color(0xFFE879F9);
  static const fuchsia500 = Color(0xFFD946EF);
  static const fuchsia600 = Color(0xFFC026D3);
  static const fuchsia700 = Color(0xFFA21CAF);
  static const fuchsia800 = Color(0xFF86198F);
  static const fuchsia900 = Color(0xFF701A75);
  static const fuchsia = fuchsia500;

  // Pink and shades
  static const pink50 = Color(0xFFFDF2F8);
  static const pink100 = Color(0xFFFCE7F3);
  static const pink200 = Color(0xFFFBCFE8);
  static const pink300 = Color(0xFFF9A8DD);
  static const pink400 = Color(0xFFF472B6);
  static const pink500 = Color(0xFFEC4899);
  static const pink600 = Color(0xFFDB2777);
  static const pink700 = Color(0xFFBE185D);
  static const pink800 = Color(0xFF9D174D);
  static const pink900 = Color(0xFF831843);
  static const pink = pink500;
  // Rose and shades
  static const rose50 = Color(0xFFFFF1F2);
  static const rose100 = Color(0xFFFFE4E6);
  static const rose200 = Color(0xFFFECDD3);
  static const rose300 = Color(0xFFFDA4AF);
  static const rose400 = Color(0xFFFB7185);
  static const rose500 = Color(0xFFF43F5E);
  static const rose600 = Color(0xFFE11D48);
  static const rose700 = Color(0xFFBE123C);
  static const rose800 = Color(0xFF9F1239);
  static const rose900 = Color(0xFF881337);
  static const rose = rose500;
}
