abstract class BeSection {
  /// Unique identifier for this section, used for equality and hashing.
  Object get viewId;

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;
    if (other is! BeSection) return false;
    return other.viewId == viewId;
  }

  @override
  int get hashCode => viewId.hashCode;
}
