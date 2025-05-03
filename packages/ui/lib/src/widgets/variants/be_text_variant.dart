import 'package:flutter/material.dart' show FontWeight;

enum BeTextWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800),
  black(FontWeight.w900);

  const BeTextWeight(this.value);
  final FontWeight value;
}

// enum AppVariant {
//   // Common variants
//   primary(
//     textColor: Colors.blue.shade700,
//     backgroundColor: Colors.blue.shade50,
//     fillColor: Colors.blue.shade50,
//     iconColor: Colors.blue.shade600,
//   ),
//   secondary(
//     textColor: Colors.purple.shade700,
//     backgroundColor: Colors.purple.shade50,
//     fillColor: Colors.white,
//     borderColor: Colors.grey.shade300,
//     iconColor: Colors.purple.shade600,
//   ),
//   success(
//     textColor: Colors.green.shade700,
//     backgroundColor: Colors.green.shade50,
//     fillColor: Colors.green.shade50,
//     iconColor: Colors.green.shade600,
//   ),
//   error(
//     textColor: Colors.red.shade700,
//     backgroundColor: Colors.red.shade50,
//     fillColor: Colors.red.shade50,
//     iconColor: Colors.red.shade600,
//   ),
//   warning(
//     textColor: Colors.orange.shade800,
//     backgroundColor: Colors.orange.shade50,
//     fillColor: Colors.orange.shade50,
//     iconColor: Colors.orange.shade700,
//   ),
//   disabled(
//     textColor: Colors.grey.shade400,
//     backgroundColor: Colors.grey.shade100,
//     fillColor: Colors.grey.shade100,
//     iconColor: Colors.grey.shade500,
//   ),
//   dark(
//     textColor: Colors.white,
//     backgroundColor: Colors.grey.shade800,
//     fillColor: Colors.grey.shade800,
//     iconColor: Colors.grey.shade400,
//   );

//   final Color textColor;
//   final Color backgroundColor;
//   final Color? fillColor;
//   final Color? borderColor;
//   final Color? iconColor;
//   final Color? focusColor;

//   const AppVariant({
//     required this.textColor,
//     required this.backgroundColor,
//     this.fillColor,
//     this.borderColor,
//     this.iconColor,
//     this.focusColor,
//   });
// }
enum BeTextVariant { none, normal, primary, tertiary, secandory, error }

// extension GetTextVariantColor on BeTextVariant {
//   (Color, Color) variantColor(BeColor color) {
//     Color textColor;
//     Color backgroundColor;
//     switch (this) {
//       default:
//         textColor = color.textPrimary;
//         backgroundColor = ColorUtils.
//         createColorSwatchLevel(color.textPrimary,
//         isDarkMode: color.isDark);
//         return (textColor, backgroundColor);
//     }
//   }
// }
