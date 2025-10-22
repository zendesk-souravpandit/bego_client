# BeUI Component Showcase

This demonstrates the basic components now available in BeUI:

## Foundation Components

### Buttons

```dart
// Primary button
BeButton.primary(
  onPressed: () {},
  child: Text('Primary Button'),
)

// Secondary button
BeButton.secondary(
  onPressed: () {},
  child: Text('Secondary'),
)

// Outline button with icon
BeButton.outline(
  onPressed: () {},
  icon: Icon(Icons.download),
  child: Text('Download'),
)

// Loading state
BeButton.primary(
  onPressed: () {},
  isLoading: true,
  child: Text('Processing...'),
)

// Full width button
BeButton.primary(
  onPressed: () {},
  fullWidth: true,
  child: Text('Full Width'),
)
```

### Cards

```dart
// Basic card
BeCard(
  child: Column(
    children: [
      BeText.titleMedium('Card Title'),
      BeText.bodyMedium('Card content goes here'),
    ],
  ),
)

// Elevated card with tap
BeCard.elevated(
  onTap: () {},
  child: ListTile(
    title: BeText.titleMedium('Tappable Card'),
    subtitle: BeText.bodySmall('Tap me!'),
  ),
)
```

### Input Fields

```dart
// Outlined input
BeInput.outlined(
  labelText: 'Email',
  hintText: 'Enter your email',
  prefixIcon: Icon(Icons.email),
)

// Filled input
BeInput.filled(
  labelText: 'Password',
  obscureText: true,
  suffixIcon: Icon(Icons.visibility),
)

// Large size with validation
BeInput(
  size: BeInputSize.large,
  labelText: 'Description',
  maxLines: 3,
  validator: (value) => value?.isEmpty == true ? 'Required' : null,
)
```

## Features

✅ **Automatic responsive behavior** - Components adapt to screen size  
✅ **Theme-aware styling** - Follows BeUI color system  
✅ **Multiple variants** - Primary, secondary, outline, etc.  
✅ **Loading states** - Built-in loading indicators  
✅ **Validation support** - Form validation integration  
✅ **Accessibility ready** - Proper semantic structure

## Typography

Full semantic text hierarchy with BeText component already implemented.

## Next Steps

Consider adding:

- Navigation components (tabs, bottom nav)
- Data display (lists, tables)
- Feedback (snackbars, dialogs)
- Layout utilities (spacing, grid)
