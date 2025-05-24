import 'dart:math';

class BeMathUtils {
  static double roundToDecimalPlaces(final double value, final int decimalPlaces) {
    final mod = pow(10, decimalPlaces);
    return (value * mod).round() / mod;
  }

  // static String formatCurrency(double value) {
  //   return NumberFormat.currency(symbol: '\$').format(value);
  // }
}
