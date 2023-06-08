/*
import 'dart:collection';

class HybridHashMap2<K, V> extends HashMap<K, V> {
  final List<K> _keys = [];

  @override
  void add(K key, V value) {
    super.add(key, value);
    _keys.add(key);
  }

  @override
  V remove(K key) {
    _keys.remove(key);
    return super.remove(key);
  }

  @override
  Iterable<K> get keys => _keys;
}
*/
