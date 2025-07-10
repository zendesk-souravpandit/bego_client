/// Used to send diagnostic signals.
///
/// Default implementation is `null` and doing nothing, to handle need
/// to set custom [skippingItemCallback]
class GridPadDiagnosticLogger {
  factory GridPadDiagnosticLogger() {
    return _instance;
  }

  GridPadDiagnosticLogger._internal();
  static final GridPadDiagnosticLogger _instance = GridPadDiagnosticLogger._internal();

  /// Called when item has been skipped due to out the grid bounds.
  SkippingItemCallback? skippingItemCallback;

  ///Send skipped item signal [message] to [skippingItemCallback] callback.
  void onItemSkipped(final String message) {
    skippingItemCallback?.call(message);
  }
}

typedef SkippingItemCallback = void Function(String message);
