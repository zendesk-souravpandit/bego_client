import 'dart:convert';

import 'package:beui/text.dart';
import 'package:flutter/widgets.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, this.data});
  final dynamic data;
  @override
  Widget build(final BuildContext context) {
    final String jsonString = jsonEncode(data);

    return BeText.displayLarge('Loading Page + $jsonString');
  }
}
