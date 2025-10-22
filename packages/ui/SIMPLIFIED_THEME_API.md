# Simplified BeTheme API

## 🎉 New Simplified Usage

The BeTheme system has been redesigned to be much simpler and more automatic. You no longer need to worry about breakpoints - everything is handled automatically based on screen width!

### Before (Old API)

```dart
// ❌ Old complex API
BeTheme(
  betheme: BeThemeData(
    breakpoint: BeBreakpoint.md,  // Manual breakpoint management
    colors: BeColorsLight(),
    themeMode: ThemeMode.light,
  ),
  child: MyApp(),
)
```

### After (New Simplified API)

```dart
// ✅ New simple API
BeTheme(
  colors: BeColorsLight(),    // Optional: defaults to system theme colors
  themeMode: ThemeMode.system, // Optional: defaults to system theme mode
  child: MyApp(),
)
```

## Key Benefits

### 🚀 **Automatic Responsive Design**

- Automatically detects screen width and applies appropriate breakpoints
- Mobile (< 640px): Compact spacing, smaller buttons
- Tablet (640-1024px): Comfortable spacing, medium buttons
- Desktop (> 1024px): Spacious layout, larger buttons

### 🎨 **Simple Color Configuration**

- Just provide a `BeColor` instance (BeColorsLight, BeColorsDark, or custom)
- All component themes automatically use your colors
- No need to manually configure breakpoints or adaptive styles

### 🌙 **Smart Theme Mode Detection**

- Automatically follows system theme mode (light/dark)
- Override with explicit `themeMode` parameter if needed
- Seamless switching between light and dark themes

## Usage Examples

### Basic Usage (Minimal Setup)

```dart
MaterialApp(
  home: BeTheme(
    child: Scaffold(
      body: Text('Automatic responsive theme!'),
    ),
  ),
)
```

### Custom Colors

```dart
BeTheme(
  colors: BeColorsLight(), // or BeColorsDark() for dark theme
  child: MyApp(),
)
```

### Force Theme Mode

```dart
BeTheme(
  colors: BeColorsLight(),
  themeMode: ThemeMode.dark, // Force dark mode
  child: MyApp(),
)
```

## What Happens Automatically

### Responsive Breakpoints

| Screen Width | Breakpoint | Button Size | Spacing  | Text Size |
| ------------ | ---------- | ----------- | -------- | --------- |
| < 640px      | Mobile     | Compact     | Dense    | Small     |
| 640-1024px   | Tablet     | Medium      | Normal   | Medium    |
| > 1024px     | Desktop    | Large       | Spacious | Large     |

### Component Adaptations

- **Buttons**: Automatically resize based on screen size
- **Input Fields**: Touch-friendly on mobile, spacious on desktop
- **Typography**: Scales appropriately for readability
- **Spacing**: Dense on mobile, comfortable on desktop
- **Touch Targets**: Properly sized for each platform

## Migration Guide

If you're using the old API, here's how to migrate:

### Old Code

```dart
BeTheme(
  betheme: BeThemeData(
    breakpoint: BeBreakpoint.lg,
    colors: BeColorsLight(),
    themeMode: ThemeMode.light,
  ),
  child: child,
)
```

### New Code

````dart
### New Code
```dart
BeTheme(
  colors: BeColorsLight(),
  // breakpoint is now automatic based on screen width!
  // themeMode is now automatic based on system brightness!
  child: child,
)
````

````

### Deprecated Constructor

The old `BeTheme.withThemeData()` constructor is still available but deprecated:

```dart
// ⚠️  Deprecated - will be removed in future version
BeTheme.withThemeData(
  betheme: BeThemeData(...),
  child: child,
)
````

## Advanced Usage

### Responsive Helper

```dart
LayoutBuilder(
  builder: (context, constraints) {
    // BeTheme automatically handles responsive design
    // based on constraints.maxWidth

    return BeTheme(
      colors: constraints.maxWidth > 1200
          ? BeColorsLight()  // Desktop colors
          : BeColorsDark(),   // Mobile colors
      child: MyResponsiveWidget(),
    );
  },
)
```

### Custom Color Scheme

```dart
class MyCustomColors implements BeColor {
  // Implement BeColor interface with your brand colors
}

BeTheme(
  colors: MyCustomColors(),
  child: MyApp(),
)
```

## Benefits Summary

✅ **Simplified API** - Only requires colors, everything else is automatic  
✅ **Automatic Responsive Design** - No manual breakpoint management  
✅ **Better Performance** - Optimized theme building and responsive detection  
✅ **Type Safe** - Full compile-time safety with proper Dart types  
✅ **Backward Compatible** - Old API still works (but deprecated)  
✅ **Less Boilerplate** - Minimal code needed for full theme system
