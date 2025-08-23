# BeTextMore Widget

A powerful and feature-rich expandable text widget for Flutter that extends beyond basic "read more" functionality. Built as a `LeafRenderObjectWidget` for optimal performance, it offers comprehensive text trimming, styling, and interaction capabilities.

## Features

### Core Functionality

- **Dual Trimming Modes**: Support for both character-length and line-based trimming
- **Rich Text Support**: Full support for `TextSpan` and custom text styling
- **Annotations**: Pattern-based text highlighting (URLs, hashtags, mentions, etc.)
- **State Management**: External state control via `ValueNotifier`
- **Performance Optimized**: Built as a `LeafRenderObjectWidget` for efficient rendering

### Styling & Customization

- **Pre/Post Text**: Add prefix and suffix content with custom styling
- **Custom Link Styles**: Separate styling for "more" and "less" links
- **Delimiter Customization**: Custom ellipsis and delimiter styling
- **Theme Integration**: Respects Flutter's text theming system
- **Accessibility**: Full semantics support for screen readers

### Advanced Features

- **Gesture Recognition**: Built-in tap handling with customizable areas
- **Layout Flexibility**: Supports all Flutter text layout properties
- **Internationalization**: Full locale and text direction support
- **Selection Support**: Integration with Flutter's text selection system

## Basic Usage

```dart
BeTextMore(
  text: 'Your long text content here...',
  trimLength: 150,
  trimMode: TrimMode.Length,
  style: TextStyle(fontSize: 16),
)
```

## Trimming Modes

### Length-Based Trimming

Trims text based on character count:

```dart
BeTextMore(
  text: 'Long text content...',
  trimMode: TrimMode.Length,
  trimLength: 240, // Characters
)
```

### Line-Based Trimming

Trims text based on number of lines:

```dart
BeTextMore(
  text: 'Long text content...',
  trimMode: TrimMode.Line,
  trimLines: 3, // Lines
)
```

## Rich Text Support

Use the `.rich()` constructor for complex text formatting:

```dart
BeTextMore.rich(
  TextSpan(
    children: [
      TextSpan(text: 'Normal text '),
      TextSpan(
        text: 'bold text',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' and more...'),
    ],
  ),
  trimLength: 100,
)
```

## Annotations

Add interactive patterns to your text:

```dart
BeTextMore(
  text: 'Visit https://flutter.dev or follow #flutter',
  annotations: [
    // URL annotation
    Annotation(
      regExp: RegExp(r'https?://[^\s]+'),
      spanBuilder: ({required text, required textStyle}) => TextSpan(
        text: text,
        style: textStyle.copyWith(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () => launchUrl(Uri.parse(text)),
      ),
    ),
    // Hashtag annotation
    Annotation(
      regExp: RegExp(r'#\w+'),
      spanBuilder: ({required text, required textStyle}) => TextSpan(
        text: text,
        style: textStyle.copyWith(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)
```

## Pre/Post Text

Add contextual text before and after the main content:

```dart
BeTextMore(
  preDataText: 'Introduction:',
  text: 'Main content here...',
  postDataText: '(Source: Company Blog)',
  preDataTextStyle: TextStyle(fontWeight: FontWeight.bold),
  postDataTextStyle: TextStyle(fontStyle: FontStyle.italic),
)
```

## External State Control

Control the expanded/collapsed state programmatically:

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ValueNotifier<bool> isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => isCollapsed.value = !isCollapsed.value,
          child: Text('Toggle'),
        ),
        BeTextMore(
          text: 'Controlled text content...',
          isCollapsed: isCollapsed,
          trimLength: 100,
        ),
      ],
    );
  }

  @override
  void dispose() {
    isCollapsed.dispose();
    super.dispose();
  }
}
```

## Styling Options

### Link Customization

```dart
BeTextMore(
  text: 'Your content...',
  trimCollapsedText: 'read more',
  trimExpandedText: 'show less',
  moreStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  lessStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
)
```

### Delimiter Styling

```dart
BeTextMore(
  text: 'Your content...',
  delimiter: '... ',
  delimiterStyle: TextStyle(color: Colors.orange),
)
```

### Color Customization

```dart
BeTextMore(
  text: 'Your content...',
  colorClickableText: Colors.purple, // Default link color
  style: TextStyle(fontSize: 16, color: Colors.black87),
)
```

## Constructor Parameters

### BeTextMore()

- `text`: Main text content (String)
- `trimLength`: Character limit for Length mode (default: 240)
- `trimLines`: Line limit for Line mode (default: 2)
- `trimMode`: TrimMode.Length or TrimMode.Line (default: Length)
- `trimCollapsedText`: "More" link text (default: 'read more')
- `trimExpandedText`: "Less" link text (default: 'show less')
- `isExpandable`: Enable/disable expansion (default: true)
- `isCollapsed`: External state control (ValueNotifier<bool>?)

### BeTextMore.rich()

- `richData`: Rich text content (TextSpan)
- All other parameters same as above

### Styling Parameters

- `style`: Main text style
- `moreStyle`: "More" link style
- `lessStyle`: "Less" link style
- `delimiter`: Text between content and link (default: '… ')
- `delimiterStyle`: Delimiter text style
- `colorClickableText`: Default clickable text color

### Pre/Post Text

- `preDataText`: Text before main content
- `postDataText`: Text after main content
- `preDataTextStyle`: Prefix text style
- `postDataTextStyle`: Suffix text style
- `richPreData`: Rich prefix text (TextSpan)
- `richPostData`: Rich suffix text (TextSpan)

### Flutter Text Properties

All standard Flutter text properties are supported:

- `textAlign`, `textDirection`, `locale`
- `softWrap`, `overflow`, `textScaler`
- `strutStyle`, `textWidthBasis`, `textHeightBehavior`
- `semanticsLabel`, `selectionColor`

## Performance Considerations

- Built as `LeafRenderObjectWidget` for optimal rendering performance
- Efficient text measurement and layout calculations
- Minimal rebuilds through proper state management
- Memory-efficient gesture recognition

## Accessibility

- Full semantics support for screen readers
- Proper focus management
- Accessible tap targets
- Semantic labels for screen readers

## Migration from Original BeTextMore

The enhanced widget maintains backward compatibility with some parameter name changes:

```dart
// Old
BeTextMore(
  text: 'content',
  maxLines: 3,
  expandText: 'More',
  collapseText: 'Less',
  linkStyle: TextStyle(color: Colors.blue),
)

// New
BeTextMore(
  text: 'content',
  trimLines: 3,
  trimMode: TrimMode.Line,
  trimCollapsedText: 'More',
  trimExpandedText: 'Less',
  moreStyle: TextStyle(color: Colors.blue),
  lessStyle: TextStyle(color: Colors.blue),
)
```

## Examples

See the [example directory](example/be_text_more_example.dart) for comprehensive usage examples including:

- Basic length and line trimming
- Rich text with annotations
- External state control
- Custom styling scenarios
- Pre/post text usage
