// lib/src/utils/string.dart
class BeStringUtils {
  static bool isNullOrEmpty(final String? value) => value == null || value.isEmpty;

  static bool isEmail(final String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value);
  }

  static String capitalize(final String value) {
    if (isNullOrEmpty(value)) {
      return value;
    }
    return value[0].toUpperCase() + value.substring(1);
  }
}
