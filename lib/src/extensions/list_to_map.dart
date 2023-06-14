extension ListMapExt on List<int> {

  /// * Version 1
  Map<int, int> mapFromList_1() {
    Map<int, int> mp = {};
    int num = 0;
    for (var i = 0; i < length; ++i) {
      var o = this[i];
      mp.update(num, (value) => value, ifAbsent: () => o);
      num++;
    }

    return mp;
  }

  /// * Optimized Version
  /// Creates a map from a list.
  ///
  /// The map will have the same length as the list and will contain the elements of the list as keys and their corresponding indexes as values.

  Map<int, int> mapFromList() {
    Map<int, int> mp = {};
    for (var i = 0; i < length; i++) {
      mp[i] = this[i];
    }
    return mp;
  }
}
