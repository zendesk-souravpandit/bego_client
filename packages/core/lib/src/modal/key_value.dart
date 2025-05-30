// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'key_value.freezed.dart';
// part 'key_value.g.dart';

// typedef KeyValueIS = KeyValuePair<int, String>;
// typedef KeyValueSI = KeyValuePair<String, int>;
// typedef KeyValueII = KeyValuePair<int, int>;
// typedef KeyValueSS = KeyValuePair<String, String>;
// typedef KeyValueSSS = KeyValueTriple<String, String, String>;
// typedef KeyValueKKM = KeyValueTriple<String, String, Map<String, KeyValuePair<String, String>>>;

// abstract class KeyValue<K, V> {
//   K get key;
//   V get value;
//   String? get display;
// }

// @Freezed(genericArgumentFactories: true, fromJson: true, toJson: true)
// abstract class KeyValuePair<K, V> with _$KeyValuePair<K, V> implements KeyValue<K, V> {
//   const factory KeyValuePair({required final K key, required final V value, final String? display}) = _KeyValuePair;

//   factory KeyValuePair.fromJson(
//     final Map<String, dynamic> json,
//     final K Function(dynamic) fromJsonK,
//     final V Function(dynamic) fromJsonV,
//   ) => _$KeyValuePairFromJson(json, fromJsonK, fromJsonV);
// }

// @Freezed(genericArgumentFactories: true)
// abstract class KeyValueTriple<K, V, W> with _$KeyValueTriple<K, V, W> implements KeyValue<K, V> {
//   const factory KeyValueTriple({
//     required final K key,
//     required final V value,
//     required final W other,
//     final String? display,
//   }) = _KeyValueTriple;

//   factory KeyValueTriple.fromJson(
//     final Map<String, dynamic> json,
//     final K Function(dynamic) fromJsonK,
//     final V Function(dynamic) fromJsonV,
//     final W Function(dynamic) fromJsonW,
//   ) => _$KeyValueTripleFromJson(json, fromJsonK, fromJsonV, fromJsonW);
// }

// extension KeyValuePairDisplay<K, V> on KeyValuePair<K, V> {
//   String get display {
//     return switch (this) {
//       KeyValueSI(key: _, value: final v, display: final d) => d ?? v.toString(),
//       KeyValueII(key: _, value: final v, display: final d) => d ?? v.toString(),
//       KeyValueIS(key: _, value: final v, display: final d) => d ?? v,
//       KeyValueSS(key: _, value: final v, display: final d) => d ?? v,
//       KeyValuePair(display: final display) => display ?? 'None',
//     };
//   }
// }

// extension KeyValueTripleDisplay<K, V, W> on KeyValueTriple<K, V, W> {
//   String get display {
//     return switch (this) {
//       KeyValueSSS(key: _, value: final v, display: final d) => d ?? v.toString(),
//       KeyValueKKM(key: _, value: final v, display: final d) => d ?? v.toString(),

//       KeyValueTriple(display: final display) => display ?? 'None',
//     };
//   }
// }
