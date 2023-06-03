extension Str on List {
  String joint([String separator = ""]) {
    if (isEmpty) {
      return "";
    }
    final StringBuffer buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      if (i > 0) {
        buffer.write(separator);
      }
      buffer.write(this[i]);
    }
    return buffer.toString();
  }
}
