# BeUI - Flutter Design System

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dev/packages/beui)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

A comprehensive Flutter UI design system that provides automatic responsive breakpoints, modern theming, and professional components for building beautiful, consistent applications.

## ✨ Key Features

- **🚀 Automatic Responsive Design** - Smart breakpoint detection (mobile/tablet/desktop)
- **🎨 Simplified Theme System** - Light/dark themes with automatic system detection
- **📱 Component Library** - Professional UI components with consistent styling
- **🎯 Type-Safe Text System** - Semantic text types with proper hierarchy
- **⚡ Zero Configuration** - Works out of the box with sensible defaults
- **🔧 Highly Customizable** - Override colors, styles, and breakpoints as needed

## 🚀 Quick Start

### Installation

Add BeUI to your `pubspec.yaml`:

```yaml
dependencies:
  beui:
    path: ../ui # or your package path
```

### Basic Setup

```dart
import 'package:flutter/material.dart';
import 'package:beui/beui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BeTheme(
      colors: BeColorsLight(),           // Optional: defaults to system colors
      themeMode: ThemeMode.system,       // Optional: follows system theme
      child: MaterialApp(
        title: 'BeUI Demo',
        home: HomePage(),
      ),
    );
  }
}
```

## 📖 Usage Examples

### Text Components

```dart
// Semantic text types with automatic styling
BeText.displayLarge('Welcome to BeUI'),
BeText.headlineMedium('Subheading'),
BeText.bodyLarge('Body text with proper spacing'),
BeText.labelSmall('Small label text'),

// Custom styling
BeText(
  'Custom text',
  type: BeTextType.titleLarge,
  color: Colors.blue,
  maxLine: 2,
  overflow: TextOverflow.ellipsis,
),
```

### Responsive Theming

```dart
// Automatic breakpoint detection
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);

    return Container(
      padding: theme.style.adaptiveStyle.padding,  // Auto-adjusts by screen size
      child: BeText(
        'Responsive text',
        style: theme.style.headlineLarge,           // Theme-aware styling
      ),
    );
  }
}
```

### Custom Themes

```dart
// Create custom color schemes
class MyCustomColors extends BeColor {
  @override
  Color get primary => Color(0xFF6366F1);

  @override
  Color get secondary => Color(0xFF8B5CF6);

  @override
  bool get isDark => false;

  // Override other colors as needed...
}

// Use your custom theme
BeTheme(
  colors: MyCustomColors(),
  child: MyApp(),
)
```

## 🎨 Theme System

BeUI's theme system automatically:

- **Detects screen width** and applies appropriate breakpoints
- **Follows system theme** (light/dark) unless explicitly overridden
- **Provides consistent spacing** across all components
- **Scales typography** based on screen size

### Breakpoints

| Breakpoint | Screen Width | Components Behavior                 |
| ---------- | ------------ | ----------------------------------- |
| Mobile     | < 640px      | Compact spacing, smaller buttons    |
| Tablet     | 640-1024px   | Comfortable spacing, medium buttons |
| Desktop    | > 1024px     | Spacious layout, larger buttons     |

## 🔧 Advanced Configuration

For advanced theming options, see:

- [Simplified Theme API](SIMPLIFIED_THEME_API.md)
- [Ultra Simple Theme Guide](ULTRA_SIMPLE_THEME.md)

## 📦 What's Included

- **Theme System**: `BeTheme`, `BeThemeData`, color schemes
- **Typography**: `BeText` with semantic types
- **Layout**: Responsive utilities and spacing
- **Foundation**: Core components and utilities
- **Icons**: Custom icon font integration
- **Animations**: Smooth transitions and effects

## 🤝 Contributing

Contributions are welcome! Please read our contributing guidelines and submit pull requests to improve BeUI.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ for the Flutter community**
