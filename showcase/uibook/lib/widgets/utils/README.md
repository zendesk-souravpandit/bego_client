# Color Utils Use Cases for UIBook

This document describes the comprehensive use cases created for the `BeColorUtils` and related color utilities in the UIBook showcase package.

## Overview

The color utility use cases demonstrate the powerful color manipulation and theme integration capabilities provided by the `beui` package. These use cases are designed to help developers understand and experiment with different color operations.

## Use Cases Implemented

### 1. BeColorUtils - Color Swatch Generation

**File:** `use_case_be_color_utils.dart`

**Demonstrates:**

- Material Color Swatch generation from any base color
- Individual ColorSwatchLevel creation (shade50, shade100, etc.)
- Tonal Palette generation (Material Design 3 style)
- Dark/Light mode adaptation

**Interactive Controls:**

- Base Color picker
- Dark Mode toggle

**Key Features:**

- Live preview of all 10 material design shades (50-900)
- ColorSwatchLevel enum examples with live color output
- Tonal palette with numbered stops (0-100)
- Hex color codes displayed for each generated color

### 2. BeColorUtils - Color Harmonization & Blending

**File:** `use_case_be_color_utils.dart` (second use case)

**Demonstrates:**

- Color harmonization using Material Design 3 algorithms
- Percentage-based color blending
- Alpha-based color blending
- CustomColor class integration

**Interactive Controls:**

- Source Color picker
- Target Color picker
- Blend Amount percentage slider (0-100%)
- Alpha Blend value slider (0-255)

**Key Features:**

- Side-by-side comparison of harmonized vs original colors
- Live blend amount adjustment
- Code examples for each operation
- Practical use case scenarios

### 3. BeColorUtils - Random Colors & Utilities

**File:** `use_case_be_color_utils.dart` (third use case)

**Demonstrates:**

- Random color generation
- ColorScheme generation from seed colors
- Color brightness detection utilities

**Interactive Controls:**

- Refresh button for new random colors
- Multiple source colors for scheme generation

**Key Features:**

- Grid of 12 random colors with refresh capability
- ColorScheme previews for both light and dark themes
- Color brightness analysis (isLight/isDark)
- Utility function demonstrations

### 4. Color Extensions - Blend Methods

**File:** `use_case_color_extension.dart`

**Demonstrates:**

- `Color.blend()` extension method
- `Color.blendAlpha()` extension method
- Practical blending scenarios
- UI state color variations

**Interactive Controls:**

- Base Color picker
- Blend Color picker
- Blend Percentage slider (0-100%)
- Alpha Value slider (0-255)

**Key Features:**

- Direct comparison between percentage and alpha blending
- Practical examples for UI states (hover, pressed, disabled)
- Status indicator color examples
- Code snippets for common use cases

### 5. CustomColor - Theme Integration

**File:** `use_case_custom_color.dart`

**Demonstrates:**

- CustomColor class usage
- Optional color harmonization
- Theme system integration
- Color palette creation

**Interactive Controls:**

- Source/Brand Color picker
- Custom Color picker
- Enable Harmonization toggle

**Key Features:**

- Visual explanation of CustomColor properties
- Theme system integration examples
- Design system color palette showcase
- Color variation generation
- Complete code examples

## How to Use

### Running the UIBook

1. Navigate to the uibook directory:

   ```bash
   cd showcase/uibook
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run
   ```

4. Navigate to "widget/utils" in the widgetbook interface to find all color utility use cases.

### Interactive Features

Each use case includes:

- **Live Controls**: Adjust colors, percentages, and toggles to see real-time changes
- **Code Examples**: Copy-paste ready code snippets
- **Visual Previews**: See colors with hex codes and brightness information
- **Practical Examples**: Real-world scenarios like UI states and design systems

## Code Structure

### BeColorUtils Static Methods

```dart
// Color swatch generation
BeColorUtils.createColorSwatch(baseColor, isDarkMode: false)
BeColorUtils.createColorSwatchLevel(baseColor, level: ColorSwatchLevel.shade100)
BeColorUtils.tonalPalette(baseColor, isDark: false)

// Color harmonization and blending
BeColorUtils.harmonize(targetColor, sourceColor)
BeColorUtils.customColor(customColor, sourceColor)
BeColorUtils.sourceOrBlend(sourceColor, targetColor)

// Utility functions
BeColorUtils.colorScheme(brightness, sourceColor, targetColor: null)
BeColorUtils.randomColor()
```

### Color Extensions

```dart
// Percentage blending (0-100%)
color.blend(blendColor, 25) // 25% blend

// Alpha blending (0-255)
color.blendAlpha(blendColor, 64) // Alpha 64 blend
```

### CustomColor Class

```dart
// Theme integration
final customColor = CustomColor(
  name: 'Brand Accent',
  color: Colors.purple,
  blend: true, // Optional harmonization
);

final result = customColor.value(brandColor);
```

## Best Practices Demonstrated

1. **Color Consistency**: Using harmonization for brand consistency
2. **Accessibility**: Proper text color contrast based on background brightness
3. **Theme Integration**: Building cohesive color systems
4. **Performance**: Efficient color calculations and caching
5. **Developer Experience**: Clear API design and practical examples

## Integration Examples

The use cases show how to integrate color utilities in:

- Design systems and theme creation
- UI component state management
- Brand color harmonization
- Accessibility-conscious color selection
- Dynamic color scheme generation

## Dependencies

The use cases depend on:

- `beui/utils.dart` - Core color utilities
- `flutter/material.dart` - Material Design framework
- `widgetbook` - Interactive documentation framework

## Contributing

When adding new color utility features:

1. Add corresponding use cases to demonstrate the functionality
2. Include interactive controls for key parameters
3. Provide code examples and practical scenarios
4. Update this documentation

---

_This documentation covers the comprehensive color utility use cases created for the UIBook showcase. Each use case is designed to be both educational and practical, helping developers understand and implement effective color systems in their applications._
