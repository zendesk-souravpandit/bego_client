/// files contains key value pair class which will be used by ui component's
/// key is for server for request
/// value is for user diaplay fields
/// S -> String
/// I -> Integer
/// Display -> always integer
/// -1 sets default value or which don't come from
library;

abstract class KV {
  KV._(this.key, this.value, this.display);
  final dynamic key;
  final dynamic value;
  final String display;
}

/// [BeKVIS]
/// [key] is Integer
/// [value] is String
/// [display] is String
class BeKVIS implements KV {
  BeKVIS({required this.key, required this.value});
  @override
  final int key;

  @override
  final String? value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVIS && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// [BeKVSI]
/// [value] is Integer
/// [key] is String
/// [display] is String
class BeKVSI implements KV {
  BeKVSI({required this.key, this.value = 0});
  @override
  final String key;

  @override
  final int value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVSI && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

// /// [KVII] Key is Integer and value is String
class BeKVII implements KV {
  BeKVII({required this.key, this.value = 0});

  @override
  final int key;

  @override
  final int value;

  @override
  String get display => value.toString();
}

/// [BeKVSS] Key is Integer and value is String
class BeKVSS implements KV {
  BeKVSS({required this.key, this.value = 'None'});

  @override
  final String key;

  @override
  final String value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVSS && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// [BeKVISS] Key is Integer and value is String
class BeKVISS implements KV {
  BeKVISS({required this.key, required this.value, required this.otherValue});

  @override
  final int key;

  @override
  final String value;

  final String otherValue;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVISS && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// [BeKVIIS] Key is Integer and value is String
class BeKVIIS implements KV {
  BeKVIIS({required this.key, required this.value, required this.otherValue});

  @override
  final int key;

  @override
  final String value;

  final String otherValue;

  @override
  String get display => value.toString();
}

/// [BeKVSSS] Key is Integer and value is String
class BeKVSSS implements KV {
  BeKVSSS({required this.key, required this.value, required this.otherValue});

  @override
  final String key;

  @override
  final String value;

  final String otherValue;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVSSS && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// SSD - S=> key S=> value (display) D=>dynamic data (extra value)
/// [BeKVSSD] Key is Integer and value is String
class BeKVSSD implements KV {
  BeKVSSD({required this.key, required this.value, required this.data});

  @override
  final String key;

  @override
  final String value;

  final dynamic data;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVSSD && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// SSD - S=> key S=> value (display) D=>dynamic data (extra value)
/// [BeKVSSD] Key is Integer and value is String
class BeKVSD<T> implements KV {
  BeKVSD({required this.key, required this.value, required this.data});

  @override
  final String key;

  @override
  final String value;

  final T data;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKVSSD && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}
