extension ListExtension2 on List<int> {

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
  Map<int, int> mapFromList() {
    Map<int, int> mp = {};
    for (var i = 0; i < length; i++) {
      mp[i] = this[i];
    }
    return mp;
  }
}
