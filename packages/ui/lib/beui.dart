/// BeUI - A comprehensive Flutter UI design system
///
/// BeUI provides a modern, responsive design system for Flutter applications
/// with automatic breakpoint detection, theming, and a comprehensive component library.

library beui;

// Animations and effects
export 'animations.dart';

// Icons and assets
export 'be_icons.dart';

// Common utilities
export 'common.dart';

// Decorations and styling
export 'decoration.dart';

// Foundation components
export 'foundation.dart';

// Core utilities
export 'from.dart';

// Layout components
export 'layout.dart';

// Multi-child widgets
export 'mulitchild.dart';

// Overlay components
export 'overlay.dart';

// Extensions and helpers
export 'src/extensions/be_double_ext.dart';
export 'src/extensions/be_theme_ext.dart' hide BeThemeContextExtension;
export 'src/extensions/sized_context.dart';

// Text components
export 'text.dart';

// Core theme system
export 'theme.dart';

// UI components and utilities
export 'ui.dart';
export 'utils.dart' hide Box; // Hide conflicting Box class
