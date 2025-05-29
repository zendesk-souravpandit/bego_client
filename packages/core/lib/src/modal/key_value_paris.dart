/// Represents a generic key-value pair for UI/server communication.
/// - [key]: Sent to the server.
/// - [value]: Raw value (e.g., for logic).
/// - [display]: Text shown to the user.
abstract class KeyValuePair {
  KeyValuePair._(this.key, this.value, this.display);
  final dynamic key;
  final dynamic value;
  final String display;
}

/// [KeyValueIS]: Key=int, Value=String.
class KeyValueIS implements KeyValuePair {
  KeyValueIS({required this.key, required this.value});
  @override
  final int key;
  @override
  final String value;
  @override
  String get display => value.toString();

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueIS && runtimeType == other.runtimeType && key == other.key;
  @override
  int get hashCode => key.hashCode;
}

/// [KeyValueSI]: Key=String, Value=int.
class KeyValueSI implements KeyValuePair {
  KeyValueSI({required this.key, this.value = 0});
  @override
  final String key;
  @override
  final int value;
  @override
  String get display => value.toString();

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueSI && runtimeType == other.runtimeType && key == other.key;
  @override
  int get hashCode => key.hashCode;
}

/// [KeyValueII]: Key=int, Value=int.
class KeyValueII implements KeyValuePair {
  KeyValueII({required this.key, this.value = 0});
  @override
  final int key;
  @override
  final int value;
  @override
  String get display => value.toString();
}

/// [KeyValueSS]: Key=String, Value=String.

class KeyValueSS implements KeyValuePair {
  KeyValueSS({required this.key, this.value = 'None'});

  /// Creates a KeyValueSS from a JSON map.
  factory KeyValueSS.fromJson(final Map<String, dynamic> json) {
    return KeyValueSS(key: json['key'] as String, value: json['value'] as String? ?? 'None');
  }

  @override
  final String key;

  @override
  final String value;

  @override
  String get display => value;

  /// Converts KeyValueSS to JSON map.
  Map<String, dynamic> toJson() => {'key': key, 'value': value};

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueSS && runtimeType == other.runtimeType && key == other.key;

  @override
  int get hashCode => key.hashCode;
}

/// [KeyValueISS]: Key=int, Value=String + extra String.
class KeyValueISS implements KeyValuePair {
  KeyValueISS({required this.key, required this.value, required this.extraValue});
  @override
  final int key;
  @override
  final String value;

  final String extraValue;
  @override
  String get display => value;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueISS && runtimeType == other.runtimeType && key == other.key;
  @override
  int get hashCode => key.hashCode;
}

/// [KeyValueSSD]: Key=String, Value=String + dynamic data.
class KeyValueSSD implements KeyValuePair {
  KeyValueSSD({required this.key, required this.value, required this.data});
  @override
  final String key;
  @override
  final String value;
  final dynamic data;
  @override
  String get display => value;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueSSD && runtimeType == other.runtimeType && key == other.key;
  @override
  int get hashCode => key.hashCode;
}

/// Generic version: [KeyValueSD<T>]: Key=String, Value=String + typed data.
class KeyValueSD<T> implements KeyValuePair {
  KeyValueSD({required this.key, required this.value, required this.data});
  @override
  final String key;
  @override
  final String value;
  final T data;
  @override
  String get display => value;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) || other is KeyValueSD && runtimeType == other.runtimeType && key == other.key;
  @override
  int get hashCode => key.hashCode;
}
