import 'package:beui/text.dart';
import 'package:flutter/widgets.dart';

class BeEmptyPage extends StatelessWidget {
  const BeEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BeText.displayLarge("Empty Page");
  }
}
