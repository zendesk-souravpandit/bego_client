import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

void main(List<String> arguments) {
  final inputDir = Directory(arguments.first);
  final outputDir = Directory(arguments[1]);
  final List<FileSystemEntity> directoryEntities = inputDir.listSync(followLinks: false).toList();

  for (final entity in directoryEntities) {
    if (entity is File && entity.path.endsWith('_icons.json')) {
      final Map<String, dynamic> fontConfig = json.decode(entity.readAsStringSync()) as Map<String, dynamic>;
      // ignore: avoid_dynamic_calls
      final fontFamilyName = fontConfig['preferences']['fontPref']['metadata']['fontFamily'].toString();

      final List<dynamic> icons = fontConfig['icons'] as List<dynamic>;
      final buffer =
          StringBuffer()
            ..writeAll([
              '',
              "import 'package:flutter/widgets.dart';",
              "import 'package:bego_ui/bego_icon.dart';",
              '',
              '// NB: DO NOT EDIT! This file is auto-generated. See utils/gen_icons.dart',
              '',
              'class IconDetails {',
              'const IconDetails(this.data, this.name);',
              'final IconData data;',
              'final String name;',
              '}',
            ], '\n',)
            ..writeln('const begoIcons = <IconDetails>[');

      for (int i = 0; i < icons.length; i++) {
        final Map<String, dynamic> icon = icons[i] as Map<String, dynamic>;

        // ignore: avoid_dynamic_calls
        final glyphName = convertGlyphName(icon['properties']['name'].toString());
        buffer.writeln("    IconDetails($fontFamilyName.$glyphName, '$glyphName'),");
      }

      buffer.writeln('];');

      File(join(outputDir.path, dartFileName)).writeAsStringSync(buffer.toString());
    }
  }
}

String convertGlyphName(String name) {
  String out = name.replaceAll(_glyphNameRegex, '_');
  for (final r in dartReserved) {
    if (out == r) {
      out = '${out}_icon';
      break;
    }
  }

  return out;
}

final _glyphNameRegex = RegExp('[^A-Za-z0-9_]');
const dartReserved = [
  'abstract',
  'deferred',
  'if',
  'super',
  'as ',
  'do',
  'implements',
  'switch',
  'assert',
  'dynamic',
  'import',
  'sync',
  'async',
  'else',
  'in',
  'this',
  'enum',
  'is',
  'throw',
  'await',
  'export',
  'library',
  'true',
  'break',
  'external',
  'new',
  'try',
  'case',
  'extends',
  'null',
  'typedef',
  'catch',
  'factory',
  'operator',
  'var',
  'class',
  'false',
  'part',
  'void',
  'const',
  'final',
  'rethrow',
  'while',
  'continue',
  'finally',
  'return',
  'with',
  'covariant',
  'for',
  'set',
  'yield',
  'default',
  'get',
  'static',
  'yield',
];
const dartFileName = 'icons_list.dart';
