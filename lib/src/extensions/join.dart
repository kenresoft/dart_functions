extension StringExt<T> on List {
  /// Joins the elements of a list with a separator.
  ///
  /// The prefix and suffix will be prepended and appended to each element, respectively, if `applyToEach` is true.
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

/// 1. The `joinFix()` function takes four arguments: the separator, the prefix, the suffix,
/// and a Boolean value that indicates whether the prefix and suffix should be applied to each element.
/// 2. If the list is empty, the function returns an empty string.
/// 3. Otherwise, the function creates a new `StringBuffer` object.
/// 4. If the `applyToEach` argument is false, the function prepends the prefix to
/// the `StringBuffer` object and appends the suffix to the `StringBuffer` object.
/// 5. The function iterates through the list and adds each element to the `StringBuffer` object,
/// separated by the separator.
/// 6. If the `applyToEach` argument is true, the function prepends the prefix to each
/// element in the list and appends the suffix to each element in the list before adding
/// them to the `StringBuffer` object.
/// 7. The function returns the contents of the `StringBuffer` object as a string.
