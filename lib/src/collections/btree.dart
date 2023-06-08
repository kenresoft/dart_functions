import 'dart:collection';

class BTree<K, V> extends IterableBase<BTreeEntry<K, V>> {
  final Map<K, BTreeEntry<K, V>> _entries = {};

  void add(K key, V value) {
    _entries[key] = BTreeEntry(key, value);
  }

  V? remove(K key) {
    return _entries.remove(key)?.value;
  }

  Iterable<K> get keys => _entries.keys;

  Iterable<BTreeEntry<K, V>> get values => _entries.values;

  BTreeEntry<K, V>? operator [](K key) => _entries[key];
  void operator []=(K key, V value) => add(key, value);
  //bool contains(K key) => _entries.containsKey(key);

  @override
  int get length => _entries.length;

  @override
  Iterator<BTreeEntry<K, V>> get iterator => _entries.values.iterator;
}

class BTreeEntry<K, V> {
  final K key;
  final V value;

  BTreeEntry(this.key, this.value);
}
