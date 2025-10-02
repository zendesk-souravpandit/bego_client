// Design System Tokens Export
// This file provides a comprehensive design system based on the provided specifications

export 'be_border_radius_tokens.dart';
export 'be_component_tokens.dart';
export 'be_elevation_tokens.dart';
export 'be_spacing_tokens.dart';
export 'be_typography_tokens.dart';

/// Design System Overview
/// 
/// This design system provides consistent UI tokens that scale across mobile, tablet, and desktop devices.
/// 
/// ## Usage Example:
/// ```dart
/// // Get current device-specific spacing tokens
/// final spacing = BeSpacingTokens.get(context.beStyle.adaptiveStyle);
/// final borderRadius = BeBorderRadiusTokens.get(context.beStyle.adaptiveStyle);
/// final typography = BeTypographyTokens.get(context.beStyle.adaptiveStyle);
/// final component = BeComponentTokens.get(context.beStyle.adaptiveStyle);
/// 
/// // Use in widgets
/// Container(
///   padding: EdgeInsets.all(spacing.spacingMd),
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(borderRadius.borderRadiusMd),
///   ),
///   child: Text(
///     'Hello Design System',
///     style: TextStyle(
///       fontSize: typography.fontSizeBody,
///       fontFamily: typography.fontFamilyPrimary,
///       fontWeight: FontWeight.values[typography.fontWeightMedium ~/ 100 - 1],
///     ),
///   ),
/// )
/// ```
/// 
/// ## Color Tokens
/// All color tokens are available through `BeColors` class with design system naming:
/// - `BeColors.primary` (#2D3142) - Primary brand color
/// - `BeColors.secondary` (#BE3455) - Accent buttons/highlights
/// - `BeColors.surface` (#FFF8F0) - Cards, sheets
/// - `BeColors.onSurface` (#2D3142) - Text on surfaces
/// 
/// ## Responsive Scaling
/// The design system automatically adapts to:
/// - Mobile: Compact spacing, smaller text, appropriate touch targets
/// - Tablet: Medium spacing, balanced text sizes, comfortable interactions
/// - Desktop: Generous spacing, larger text, precise interactions
/// 
/// ## Component Integration
/// All Flutter Material 3 components are automatically themed to use these tokens through the theme builder.