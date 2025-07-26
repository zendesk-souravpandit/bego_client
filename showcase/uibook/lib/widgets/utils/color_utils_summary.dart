// Summary of Color Utils Use Cases for UIBook
//
// This file provides a quick overview of all the color utility use cases
// that have been implemented in the UIBook package.

/*
=== COLOR UTILS USE CASES SUMMARY ===

📁 Location: showcase/uibook/lib/widgets/utils/

📄 Files Created:
1. use_case_be_color_utils.dart - Main BeColorUtils demonstrations
2. use_case_color_extension.dart - Color extension methods
3. use_case_custom_color.dart - CustomColor class integration
4. README.md - Comprehensive documentation

🎯 Use Cases Implemented:

1. "BeColorUtils - Color Swatch Generation"
   - Material Color swatch creation
   - ColorSwatchLevel enum usage
   - Tonal palette generation
   - Dark/Light mode adaptation

2. "BeColorUtils - Color Harmonization & Blending"
   - Color harmonization algorithms
   - Percentage and alpha blending
   - CustomColor integration
   - Visual blend comparisons

3. "BeColorUtils - Random Colors & Utilities"
   - Random color generation
   - ColorScheme creation
   - Brightness detection utilities
   - Theme integration examples

4. "Color Extensions - Blend Methods"
   - .blend() method demonstrations
   - .blendAlpha() method usage
   - Practical UI state examples
   - Interactive blend controls

5. "CustomColor - Theme Integration"
   - CustomColor class usage
   - Optional harmonization
   - Design system integration
   - Color palette creation

🛠️ Interactive Features:
- Live color pickers for all parameters
- Real-time blend amount adjustments
- Dark/Light mode toggles
- Percentage and alpha sliders
- Random color generation
- Code example displays

💡 Key Demonstrations:
- Material Design 3 color systems
- Brand color harmonization
- UI state color management
- Accessibility considerations
- Theme system integration
- Performance-optimized color operations

🔧 To Build:
cd showcase/uibook
dart run build_runner build

🚀 To Run:
cd showcase/uibook
flutter run

📍 Navigation in UIBook:
widget/utils → [Select any color utility use case]

=== END SUMMARY ===
*/

// Import statements used across all use cases:
// import 'package:beui/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:widgetbook/widgetbook.dart';
// import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Example usage patterns demonstrated:

// 1. Color Swatch Generation
// final materialColor = BeColorUtils.createColorSwatch(Colors.blue);
// final specificShade = BeColorUtils.createColorSwatchLevel(Colors.blue, level: ColorSwatchLevel.shade200);
// final tonalPalette = BeColorUtils.tonalPalette(Colors.blue);

// 2. Color Harmonization
// final harmonized = BeColorUtils.harmonize(Colors.red, Colors.blue);
// final customResult = BeColorUtils.customColor(customColor, brandColor);

// 3. Color Extensions
// final blended = baseColor.blend(Colors.white, 25); // 25% blend
// final alphaBlended = baseColor.blendAlpha(Colors.black, 64); // Alpha 64

// 4. CustomColor Integration
// final customColor = CustomColor(name: 'Accent', color: Colors.purple, blend: true);
// final result = customColor.value(brandColor);

// 5. Utility Functions
// final randomColor = BeColorUtils.randomColor();
// final colorScheme = BeColorUtils.colorScheme(Brightness.light, Colors.blue);
