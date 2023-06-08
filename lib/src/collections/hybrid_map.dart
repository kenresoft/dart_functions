class HybridMap<K, V> {
  final List<K> _keys = [];
  final Map<K, V> _values = {};

  void add(K key, V value) {
    _keys.add(key);
    _values[key] = value;
  }

  V? remove(K key) {
    //_keys.remove(key);
    return _values.remove(key);
  }

  Iterable<K> get keys => _keys;
  Iterable<V> get values => _values.values;

  V? operator [](K key) => _values[key];
  void operator []=(K key, V value) => add(key, value);

  bool containsKey(K key) => _values.containsKey(key);
  bool containsValue(V value) => _values.containsValue(value);

  int get length => _values.length;

  void clear() {
    _keys.clear();
    _values.clear();
  }
}
