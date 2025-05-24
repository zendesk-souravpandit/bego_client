// ignore_for_file: avoid_setters_without_getters, always_put_control_body_on_new_line, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeTextMore extends LeafRenderObjectWidget {
  const BeTextMore({
    required this.text,
    super.key,
    this.maxLines = 3,
    this.style = const TextStyle(fontSize: 14),
    this.linkStyle = const TextStyle(color: Colors.blue),
    this.expandText = 'More',
    this.collapseText = 'Less',
  });
  final String text;
  final int maxLines;
  final TextStyle style;
  final TextStyle linkStyle;
  final String expandText;
  final String collapseText;

  @override
  RenderObject createRenderObject(final BuildContext context) => RenderExpandableText(
    text: text,
    maxLines: maxLines,
    style: style,
    linkStyle: linkStyle,
    expandText: expandText,
    collapseText: collapseText,
    textDirection: Directionality.of(context),
  );

  @override
  void updateRenderObject(final BuildContext context, final RenderExpandableText renderObject) {
    renderObject
      ..text = text
      ..maxLines = maxLines
      ..style = style
      ..linkStyle = linkStyle
      ..expandText = expandText
      ..collapseText = collapseText
      ..textDirection = Directionality.of(context);
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(IntProperty('maxLines', maxLines))
      ..add(DiagnosticsProperty<TextStyle>('style', style))
      ..add(DiagnosticsProperty<TextStyle>('linkStyle', linkStyle))
      ..add(StringProperty('expandText', expandText))
      ..add(StringProperty('collapseText', collapseText));
  }
}

class RenderExpandableText extends RenderBox {
  RenderExpandableText({
    required final String text,
    required final int maxLines,
    required final TextStyle style,
    required final TextStyle linkStyle,
    required final String expandText,
    required final String collapseText,
    required final TextDirection textDirection,
  }) : _text = text,
       _maxLines = maxLines,
       _style = style,
       _linkStyle = linkStyle,
       _expandText = expandText,
       _collapseText = collapseText,
       _textDirection = textDirection {
    _updateTextPainter();
  }

  String _text;
  int _maxLines;
  TextStyle _style;
  TextStyle _linkStyle;
  String _expandText;
  String _collapseText;
  TextDirection _textDirection;
  bool _isExpanded = false;
  bool _needsLink = false;
  late TextPainter _textPainter;
  late TextSpan _combinedSpan;
  late Rect _linkRect;

  set text(final String value) {
    if (_text == value) return;
    _text = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  set maxLines(final int value) {
    if (_maxLines == value) return;
    _maxLines = value;
    markNeedsLayout();
  }

  set style(final TextStyle value) {
    if (_style == value) return;
    _style = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  set linkStyle(final TextStyle value) {
    if (_linkStyle == value) return;
    _linkStyle = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  set expandText(final String value) {
    if (_expandText == value) return;
    _expandText = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  set collapseText(final String value) {
    if (_collapseText == value) return;
    _collapseText = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  set textDirection(final TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    _updateTextPainter();
    markNeedsLayout();
  }

  void _updateTextPainter() {
    final linkText = _isExpanded ? _collapseText : _expandText;

    _combinedSpan = TextSpan(
      children: [
        TextSpan(text: _text, style: _style),
        if (_needsLink || _isExpanded) TextSpan(text: ' $linkText', style: _linkStyle),
      ],
    );

    _textPainter = TextPainter(
      text: _combinedSpan,
      textDirection: _textDirection,
      maxLines: _isExpanded ? null : _maxLines,
      ellipsis: _isExpanded ? null : '... $linkText',
    );
  }

  @override
  void performLayout() {
    final constraints = this.constraints;
    final maxWidth = constraints.maxWidth;

    // Check if text fits without link
    final testPainter = TextPainter(
      text: TextSpan(text: _text, style: _style),
      textDirection: _textDirection,
      maxLines: _maxLines,
    )..layout(maxWidth: maxWidth);
    _needsLink = testPainter.didExceedMaxLines;

    // Layout actual text with link
    _updateTextPainter();
    _textPainter.layout(maxWidth: maxWidth);

    // Calculate link rectangle for hit testing
    final linkText = _isExpanded ? _collapseText : _expandText;
    final linkOffset = _textPainter.getOffsetForCaret(
      TextPosition(offset: _combinedSpan.toPlainText().indexOf(linkText)),
      Rect.zero,
    );
    final linkWidth = _textPainter.width;
    final linkHeight = _textPainter.preferredLineHeight;
    _linkRect = Rect.fromLTWH(linkOffset.dx, linkOffset.dy, linkWidth, linkHeight);

    // Set final size
    size = constraints.constrain(_textPainter.size);
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    _textPainter.paint(context.canvas, offset);
  }

  @override
  bool hitTestSelf(final Offset position) => true;

  @override
  void handleEvent(final PointerEvent event, covariant final BoxHitTestEntry entry) {
    if (event is PointerUpEvent && _needsLink) {
      final localPosition = event.localPosition;
      if (_linkRect.contains(localPosition)) {
        _isExpanded = !_isExpanded;
        _updateTextPainter();
        markNeedsLayout();
        markNeedsPaint();
      }
    }
  }

  @override
  void describeSemanticsConfiguration(final SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config
      ..label = _text
      ..textDirection = _textDirection
      ..onTap = () {
        if (_needsLink) {
          _isExpanded = !_isExpanded;
          _updateTextPainter();
          markNeedsLayout();
          markNeedsPaint();
        }
      };
  }
}
