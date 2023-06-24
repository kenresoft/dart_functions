extension Wrap on String {
  String wrap(int end, [int start = 0]) {
    try {
      return substring(start, end);
    } catch (e) {
      return this;
    }
  }
}

extension Wrap2 on String {
  String wrap2({int? characterLimit}) {
    var cache = '';
    try {
      if (characterLimit != null) {
        for (var i = 0; i < characterLimit; ++i) {
          cache += this[i];
        }
      }
    } catch (e) {
      return this;
    }
    return cache;
  }
}