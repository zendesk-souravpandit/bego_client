import 'package:becore/modal.dart';
import 'package:json_annotation/json_annotation.dart';

class KeyValueSSConverter implements JsonConverter<KeyValueSS?, Map<String, String>?> {
  const KeyValueSSConverter();

  @override
  KeyValueSS? fromJson(final Map<String, String>? json) {
    if (json == null) return null;
    return KeyValueSS.fromJson(json);
  }

  @override
  Map<String, String>? toJson(final KeyValueSS? object) {
    final map = object?.toJson();
    return map?.map((final key, final value) => MapEntry(key, value.toString()));
  }
}
