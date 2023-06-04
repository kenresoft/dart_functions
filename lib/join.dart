extension StringExt<T> on List<T> {
  String joinFix([String separator = "", String prefix = "", String suffix = ""]) {
    if (isEmpty) {
      return "";
    }
    final StringBuffer buffer = StringBuffer();
    buffer.write(prefix);
    for (var i = 0; i < length; i++) {
      if (i > 0) {
        buffer.write(separator);
      }
      buffer.write(this[i]);
    }
    buffer.write(suffix);
    return buffer.toString();
  }
}
