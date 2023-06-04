extension StringExt<T> on List {
  String joinFix({
    String separator = "",
    String prefix = "",
    String suffix = "",
    bool applyToEach = false,
  }) {
    if (isEmpty) {
      return "";
    }
    final StringBuffer buffer = StringBuffer();
    !applyToEach ? buffer.write(prefix) : null;
    for (var i = 0; i < length; i++) {
      if (i > 0) {
        buffer.write(separator);
      }
      applyToEach ? buffer.write(prefix + this[i] + suffix) : buffer.write(this[i]);
    }
    !applyToEach ? buffer.write(suffix) : null;
    return buffer.toString();
  }

  /// * version 2
  String joinFix_2({
    String separator = "",
    String prefix = "",
    String suffix = "",
    bool applyToEach = false,
  }) {
    if (isEmpty) {
      return "";
    }
    final StringBuffer buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      if (i > 0) {
        buffer.write(separator);
      }
      if (applyToEach) {
        buffer.write(prefix + this[i] + suffix);
      } else {
        buffer.write(this[i]);
      }
    }
    return buffer.toString();
  }
}
