# BeGrid System - Bootstrap-Inspired Responsive Grid for Flutter

A powerful and flexible responsive grid system for Flutter, inspired by Bootstrap's 12-column grid layout. This system provides responsive design capabilities with breakpoint-based column sizing.

## Features

- 📱 **Responsive Design**: Support for 6 breakpoints (xs, sm, md, lg, xl, xxl)
- 🎯 **12-Column Grid**: Standard 12-column layout system like Bootstrap
- 🔧 **Flexible Layouts**: Mix and match column sizes
- 📦 **Container System**: Built-in container with responsive padding and max-widths
- 🛠️ **Utility Functions**: Helper functions for common layout patterns
- 🎨 **Customizable Spacing**: Configurable gaps between columns and rows

## Components

### BeRow

Container widget that arranges children in a horizontal row with 12-column grid support.

### BeColumn

Responsive column widget with breakpoint-specific sizing.

### BeContainer

Bootstrap-like container with responsive padding and max-width constraints.

### BeResponsive

Utility widget that shows different content based on screen size.

## Breakpoints

| Breakpoint | Screen Size | Prefix            |
| ---------- | ----------- | ----------------- |
| xs         | < 576px     | Extra Small       |
| sm         | ≥ 576px     | Small             |
| md         | ≥ 768px     | Medium            |
| lg         | ≥ 992px     | Large             |
| xl         | ≥ 1200px    | Extra Large       |
| xxl        | ≥ 1400px    | Extra Extra Large |

## Basic Usage

```dart
import 'package:your_package/mulitchild.dart';

// Basic two-column layout
BeRow(
  spacing: 16,
  children: [
    BeColumn(
      xs: 6, // Half width on all screen sizes
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Center(child: Text('Column 1')),
      ),
    ),
    BeColumn(
      xs: 6, // Half width on all screen sizes
      child: Container(
        height: 100,
        color: Colors.red,
        child: Center(child: Text('Column 2')),
      ),
    ),
  ],
)
```

## Responsive Layout Example

```dart
// Responsive layout: full width on mobile, half width on medium screens
BeRow(
  spacing: 16,
  children: [
    BeColumn(
      xs: 12, // Full width on mobile
      md: 6,  // Half width on medium screens and up
      child: Container(
        height: 100,
        color: Colors.green,
        child: Center(child: Text('Main Content')),
      ),
    ),
    BeColumn(
      xs: 12, // Full width on mobile
      md: 6,  // Half width on medium screens and up
      child: Container(
        height: 100,
        color: Colors.orange,
        child: Center(child: Text('Sidebar')),
      ),
    ),
  ],
)
```

## Complex Responsive Layout

```dart
BeContainer(
  child: Column(
    children: [
      // Hero section - full width
      BeRow(
        children: [
          BeColumn(
            xs: 12,
            child: Container(
              height: 200,
              color: Colors.purple,
              child: Center(
                child: Text(
                  'Hero Section',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 20),

      // Content area with sidebar
      BeRow(
        spacing: 20,
        children: [
          // Main content
          BeColumn(
            xs: 12, // Full width on mobile
            lg: 8,  // 2/3 width on large screens
            child: Container(
              height: 300,
              color: Colors.blue.shade100,
              child: Center(child: Text('Main Content Area')),
            ),
          ),

          // Sidebar
          BeColumn(
            xs: 12, // Full width on mobile
            lg: 4,  // 1/3 width on large screens
            child: Container(
              height: 300,
              color: Colors.green.shade100,
              child: Center(child: Text('Sidebar')),
            ),
          ),
        ],
      ),

      SizedBox(height: 20),

      // Feature cards - responsive grid
      BeRow(
        spacing: 16,
        children: [
          BeColumn(
            xs: 12, // 1 per row on mobile
            sm: 6,  // 2 per row on small screens
            lg: 4,  // 3 per row on large screens
            child: _buildFeatureCard('Feature 1'),
          ),
          BeColumn(
            xs: 12,
            sm: 6,
            lg: 4,
            child: _buildFeatureCard('Feature 2'),
          ),
          BeColumn(
            xs: 12,
            sm: 6,
            lg: 4,
            child: _buildFeatureCard('Feature 3'),
          ),
        ],
      ),
    ],
  ),
)
```

## Using Grid Utilities

```dart
// Create equal-width columns
BeRow(
  spacing: 16,
  children: BeGridUtils.createEqualColumns([
    Text('Column 1'),
    Text('Column 2'),
    Text('Column 3'),
  ]),
)

// Create responsive columns with same breakpoints
BeRow(
  spacing: 16,
  children: BeGridUtils.createResponsiveColumns(
    [Text('A'), Text('B'), Text('C'), Text('D')],
    xs: 12, // 1 per row on mobile
    md: 6,  // 2 per row on medium
    lg: 3,  // 4 per row on large
  ),
)
```

## Container Options

```dart
// Fluid container (full width)
BeContainer(
  fluid: true,
  child: YourContent(),
)

// Standard container with responsive max-width
BeContainer(
  child: YourContent(),
)

// Custom container settings
BeContainer(
  padding: EdgeInsets.all(24),
  maxWidth: 800,
  child: YourContent(),
)
```

## Responsive Utilities

```dart
// Show different content based on screen size
BeResponsive(
  xs: Text('Mobile View'),
  md: Text('Desktop View'),
  fallback: Text('Default View'),
)

// Check current breakpoint
LayoutBuilder(
  builder: (context, constraints) {
    final breakpoint = BeBreakpoints.getBreakpoint(constraints.maxWidth);
    final isLarge = BeBreakpoints.isAtLeast(constraints.maxWidth, 'lg');

    return Text('Current: $breakpoint, Is Large: $isLarge');
  },
)
```

## Column Sizing Reference

| Class                  | Columns | Width   |
| ---------------------- | ------- | ------- |
| xs/sm/md/lg/xl/xxl: 1  | 1/12    | ~8.33%  |
| xs/sm/md/lg/xl/xxl: 2  | 2/12    | ~16.67% |
| xs/sm/md/lg/xl/xxl: 3  | 3/12    | 25%     |
| xs/sm/md/lg/xl/xxl: 4  | 4/12    | ~33.33% |
| xs/sm/md/lg/xl/xxl: 5  | 5/12    | ~41.67% |
| xs/sm/md/lg/xl/xxl: 6  | 6/12    | 50%     |
| xs/sm/md/lg/xl/xxl: 7  | 7/12    | ~58.33% |
| xs/sm/md/lg/xl/xxl: 8  | 8/12    | ~66.67% |
| xs/sm/md/lg/xl/xxl: 9  | 9/12    | 75%     |
| xs/sm/md/lg/xl/xxl: 10 | 10/12   | ~83.33% |
| xs/sm/md/lg/xl/xxl: 11 | 11/12   | ~91.67% |
| xs/sm/md/lg/xl/xxl: 12 | 12/12   | 100%    |

## Best Practices

1. **Mobile First**: Start with `xs` breakpoint and work your way up
2. **Consistent Spacing**: Use the `spacing` parameter for consistent gaps
3. **Semantic Structure**: Wrap your layouts in `BeContainer` for proper alignment
4. **Test Responsiveness**: Always test your layouts across different screen sizes
5. **Performance**: Use `BeGridUtils` for repetitive patterns to reduce boilerplate

## Advanced Features

### Custom Breakpoint Behavior

```dart
BeColumn(
  xs: 12,    // Full width on mobile
  sm: 12,    // Still full width on small tablets
  md: 6,     // Half width on medium screens
  lg: 4,     // One-third on large screens
  xl: 3,     // One-quarter on extra large
  xxl: 2,    // One-sixth on very large screens
  child: YourWidget(),
)
```

### Nested Grids

```dart
BeRow(
  children: [
    BeColumn(
      xs: 8,
      child: BeRow(
        children: [
          BeColumn(xs: 6, child: Text('Nested 1')),
          BeColumn(xs: 6, child: Text('Nested 2')),
        ],
      ),
    ),
    BeColumn(
      xs: 4,
      child: Text('Sidebar'),
    ),
  ],
)
```

This grid system provides the flexibility of Bootstrap's grid system while being fully native to Flutter, with proper widget composition and performance optimization.
