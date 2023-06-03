extension ListExtension2 on List<int> {
  Map<int, int> mapFromList() {
    Map<int, int> mp = {};
    int num = 0;
    for (var i = 0; i < length; ++i) {
      var o = this[i];
      mp.update(num, (value) => value, ifAbsent: () => o);
      num++;
    }

    return mp;
  }

  /// * Corrected
  Map<int, int> mapFromList2() {
    Map<int, int> mp = {};
    for (var i = 0; i < length; i++) {
      mp[i] = this[i];
    }
    return mp;
  }
}
