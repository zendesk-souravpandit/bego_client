# UI Book - Widget Showcases

This directory contains organized widget showcases for the Bego UI library.

## Directory Structure

```
lib/
├── core/                       # Core utilities and helpers
│   ├── utils/                  # Performance and utility helpers
│   └── widgetbook/            # Widgetbook-specific extensions and utilities
├── showcases/                 # Organized widget showcases
│   ├── components/            # UI components (buttons, text, forms, etc.)
│   │   ├── button_showcase.dart      # All button variants combined
│   │   ├── form_showcase.dart        # Form fields and selectors
│   │   ├── icons_showcase.dart       # Icon libraries and displays
│   │   └── text_showcase.dart        # Text styles and typography
│   ├── foundation/            # Design system foundations
│   │   └── theme_showcase.dart       # Colors, interactions, and design tokens
│   └── primitives/            # Basic UI primitives (containers, layouts, etc.)
├── decoration/                # Legacy decoration showcases (to be moved)
├── widgets/                   # Legacy widget showcases (to be moved)
├── main.dart                  # Main application entry point
└── main.directories.g.dart   # Generated widgetbook configuration
```

## Reorganization Completed

### ✅ What's Been Done:

1. **Created New Organized Structure**:

   - `showcases/components/` for interactive UI components
   - `showcases/foundation/` for design system foundations
   - `showcases/primitives/` for basic building blocks

2. **Combined Related Use Cases**:

   - **button_showcase.dart**: Combined standard buttons and icon-text buttons
   - **text_showcase.dart**: Combined text styles, typography system, and tagged text
   - **form_showcase.dart**: Combined form fields, item selectors, and comprehensive forms
   - **icons_showcase.dart**: Combined BeIcons library and standard icon grids
   - **theme_showcase.dart**: Combined color schemes and tappable interactions

3. **Improved Navigation Paths**:

   - `Components/Buttons` for all button variants
   - `Components/Text` for all text-related showcases
   - `Components/Forms` for all form-related showcases
   - `Components/Icons` for all icon showcases
   - `Foundation/Colors` and `Foundation/Interactions` for design foundations

4. **Moved Core Utilities**:
   - Moved `utils/` and `widgetbook/` to `core/` directory

### 🚧 Still To Do (Optional):

1. **Move Remaining Legacy Files**:

   - `widgets/animations/` → `showcases/components/animations_showcase.dart`
   - `widgets/overlay/` → `showcases/components/overlay_showcase.dart`
   - `widgets/multichild/` → `showcases/primitives/containers_showcase.dart`
   - `widgets/layout/` → `showcases/primitives/layout_showcase.dart`
   - `widgets/loading/` → `showcases/components/loading_showcase.dart`

2. **Clean Up**:
   - Remove old `widgets/` directory after migration
   - Move `decoration/` showcases to appropriate `showcases/` subdirectories

## Benefits of New Structure

1. **Consistent Organization**: Related components are grouped together
2. **Reduced Navigation**: Fewer duplicate paths and cleaner hierarchy
3. **Combined Use Cases**: Multiple related variations in single files
4. **Better Discoverability**: Logical grouping by component type and purpose
5. **Maintainable**: Easier to find and update related showcases

## Usage

To view the showcases:

```bash
cd showcase/uibook
flutter run
```

The Widgetbook will automatically generate the navigation structure based on the `@widgetbook.UseCase` annotations and their specified paths.
