# BeText Widget Use Cases Documentation

This document describes the comprehensive use cases created for the `BeText` widget in the UIBook showcase package.

## Overview

The `BeText` widget is a powerful text component that follows Material Design 3 typography guidelines and provides a consistent way to display text throughout your application. The use cases demonstrate all features, styling options, and practical implementations.

## Use Cases Implemented

### 1. BeText - Typography Showcase

**File:** `use_case_be_text_comprehensive.dart`

**Purpose:** Comprehensive demonstration of all Material Design 3 typography scales with interactive controls.

**Features Demonstrated:**

- **Display Styles** (displayLarge, displayMedium, displaySmall)
  - Large, expressive text for marketing or brand communications
  - Best for hero sections and brand messaging
- **Headline Styles** (headlineLarge, headlineMedium, headlineSmall)
  - High-emphasis text for short, important content
  - Perfect for page titles and section headers
- **Title Styles** (titleLarge, titleMedium, titleSmall)
  - Medium-emphasis text for section headers and important content
  - Ideal for card titles and navigation elements
- **Body Styles** (bodyLarge, bodyMedium, bodySmall)
  - Regular text for paragraphs and body content
  - Default choice for most text content
- **Label Styles** (labelLarge, labelMedium, labelSmall)
  - Small text for captions, labels, and auxiliary content
  - Perfect for form labels and metadata

**Interactive Controls:**

- Sample Text input
- Text Color picker
- Max Lines input
- Text Alignment selector
- Show Padding toggle
- Text Overflow options

### 2. BeText - Practical Examples

**File:** `use_case_be_text_comprehensive.dart` (second use case)

**Purpose:** Real-world usage scenarios and implementation patterns.

**Examples Included:**

#### App Headers & Navigation

- App Bar Title using `BeText.titleLarge()`
- Tab Label using `BeText.labelLarge()`
- Breadcrumb using `BeText.bodySmall()`

#### Content Display

- Article Title using `BeText.headlineMedium()`
- Article Body with text truncation
- Metadata using `BeText.labelSmall()`

#### Cards & Lists

- Product Card layout example
- List Item with avatar and metadata
- Proper spacing and hierarchy

#### Form Elements

- Form section title
- Input labels and helper text
- Validation messaging

#### Text Alignment Examples

- Left, center, right, and justified alignment
- Visual demonstration of each option

#### Overflow Handling

- Ellipsis, fade, clip, and visible overflow
- Practical scenarios for each type

**Interactive Controls:**

- Long Text Content input
- Short Text Content input

### 3. BeText - Custom Styling

**File:** `use_case_be_text_comprehensive.dart` (third use case)

**Purpose:** Advanced styling capabilities and custom TextStyle integration.

**Features Demonstrated:**

- Custom TextStyle application
- Font size adjustment (8-64px)
- Font weight selection (w100-w900)
- Letter spacing control (-2 to 4)
- Line height adjustment (1-3x)
- Text decoration options
- Text and background color customization
- Live code generation

**Interactive Controls:**

- Text Content input
- Font Size slider
- Font Weight selector
- Letter Spacing slider
- Line Height slider
- Text Decoration selector
- Text Color picker
- Background Color picker

**Advanced Features:**

- Live preview of custom styles
- Generated code output
- TextStyle properties reference
- Best practices guide

## Widget API Reference

### BeText Constructors

#### Main Constructor

```dart
BeText(
  String text, {
  Color? color,
  int? maxLine,
  TextAlign? align,
  EdgeInsets? padding,
  BeTextVariant? variant,
  TextStyle? style,
  BeTextType type = BeTextType.bodyMedium,
  TextOverflow? overflow,
})
```

#### Named Constructors

All Material Design 3 typography scales are available as named constructors:

```dart
// Display styles
BeText.displayLarge(text, ...)
BeText.displayMedium(text, ...)
BeText.displaySmall(text, ...)

// Headline styles
BeText.headlineLarge(text, ...)
BeText.headlineMedium(text, ...)
BeText.headlineSmall(text, ...)

// Title styles
BeText.titleLarge(text, ...)
BeText.titleMedium(text, ...)
BeText.titleSmall(text, ...)

// Body styles
BeText.bodyLarge(text, ...)
BeText.bodyMedium(text, ...)
BeText.bodySmall(text, ...)

// Label styles
BeText.labelLarge(text, ...)
BeText.labelMedium(text, ...)
BeText.labelSmall(text, ...)
```

### Properties

| Property   | Type             | Description                 |
| ---------- | ---------------- | --------------------------- |
| `text`     | `String?`        | The text to display         |
| `color`    | `Color?`         | Override text color         |
| `maxLine`  | `int?`           | Maximum number of lines     |
| `align`    | `TextAlign?`     | Text alignment              |
| `padding`  | `EdgeInsets?`    | Padding around the text     |
| `variant`  | `BeTextVariant?` | Text variant styling        |
| `style`    | `TextStyle?`     | Custom text style override  |
| `type`     | `BeTextType`     | Typography scale type       |
| `overflow` | `TextOverflow?`  | How to handle text overflow |

## Best Practices Demonstrated

### 1. Typography Hierarchy

- Use display styles for hero content and marketing
- Use headlines for page and section titles
- Use titles for card headers and navigation
- Use body styles for regular content
- Use labels for metadata and form elements

### 2. Color and Contrast

- Always consider accessibility and contrast ratios
- Use theme-aware colors when possible
- Test with both light and dark themes

### 3. Text Overflow Handling

- Use ellipsis for single-line truncation
- Use fade for gradual text cutoff
- Consider maxLines for multi-line content
- Test with different content lengths

### 4. Responsive Design

- Choose appropriate typography scales for different screen sizes
- Consider reading distance and device context
- Test across different device sizes

### 5. Performance

- Cache TextStyle objects when possible
- Avoid unnecessary rebuilds
- Use const constructors where applicable

## Usage Examples

### Basic Usage

```dart
// Simple text with default body medium style
BeText('Hello, World!')

// Headline with custom color
BeText.headlineLarge(
  'Welcome to Our App',
  color: Theme.of(context).colorScheme.primary,
)

// Body text with line limits
BeText.bodyMedium(
  longText,
  maxLine: 3,
  overflow: TextOverflow.ellipsis,
)
```

### Advanced Styling

```dart
// Custom styled text
BeText(
  'Custom Text',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    decoration: TextDecoration.underline,
  ),
)

// Text with padding and alignment
BeText.titleMedium(
  'Centered Title',
  align: TextAlign.center,
  padding: EdgeInsets.all(16),
)
```

### Form Integration

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    BeText.labelMedium('Email Address *'),
    SizedBox(height: 4),
    TextField(...),
    SizedBox(height: 4),
    BeText.labelSmall(
      'We will never share your email',
      color: Theme.of(context).colorScheme.outline,
    ),
  ],
)
```

## Testing Guidelines

### What to Test

1. **Typography Scale Consistency**: Verify all scales render correctly
2. **Color Application**: Test with various color combinations
3. **Overflow Behavior**: Test with long and short text
4. **Alignment**: Verify all alignment options work
5. **Accessibility**: Test with screen readers and high contrast
6. **Performance**: Measure render times with large text blocks

### Interactive Testing

Use the UIBook use cases to:

- Test different text lengths and content types
- Verify color combinations and accessibility
- Experiment with styling options
- Validate responsive behavior
- Check overflow handling

## Integration with Design System

The BeText widget is designed to integrate seamlessly with your design system:

1. **Theme Integration**: Automatically uses theme typography scales
2. **Color System**: Respects theme color schemes
3. **Consistency**: Provides consistent text rendering across the app
4. **Customization**: Allows overrides when needed
5. **Accessibility**: Built-in accessibility features

## Performance Considerations

- BeText is optimized for performance with minimal rebuilds
- TextStyle objects are cached when possible
- Empty or null text returns an empty widget efficiently
- Default maxLines value prevents infinite height issues

---

_This documentation covers the comprehensive BeText widget use cases. Each use case is designed to demonstrate real-world usage patterns and help developers understand the full capabilities of the BeText component._
