import 'dart:async';

import 'package:flutter/widgets.dart';

mixin AfterLayout<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) onFirstFrame(context);
    });
  }

  FutureOr<void> onFirstFrame(BuildContext context);
}
