// lib/src/utils/validation.dart
class BeValidationUtils {
  static bool isPasswordValid(final String password) => password.length >= 8;

  static bool isPhoneNumberValid(final String phoneNumber) {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
