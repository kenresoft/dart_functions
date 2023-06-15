import 'dart:collection';

class BTree<K, V> extends IterableBase<BTreeEntry<K, V>> {
  final Map<K, BTreeEntry<K, V>> _entries = {};

// Adds a new entry to the tree.
  void add(K key, V value) {
    _entries[key] = BTreeEntry(key, value);
  }

// Removes the entry with the specified key from the tree.
  V? remove(K key) {
    return _entries.remove(key)?.value;
  }

// Returns an iterable that contains the keys of all the entries in the tree.
  Iterable<K> get keys => _entries.keys;

// Returns an iterable that contains the values of all the entries in the tree.
  Iterable<BTreeEntry<K, V>> get values => _entries.values;

// Returns the entry with the specified key, or null if no such entry exists.
  BTreeEntry<K, V>? operator [](K key) => _entries[key];

// Adds a new entry to the tree with the specified key and value, or updates the value of an existing entry if it already exists.
  void operator []=(K key, V value) => add(key, value);

// Returns true if the tree contains an entry with the specified key, false otherwise.
// bool contains(K key) => _entries.containsKey(key);

// Returns the number of entries in the tree.
  @override
  int get length => _entries.length;

// Returns an iterator that can be used to iterate over the entries in the tree.
  @override
  Iterator<BTreeEntry<K, V>> get iterator => _entries.values.iterator;
}

// This class represents a single entry in a binary tree.
class BTreeEntry<K, V> {
// The key of the entry.
  final K key;

// The value of the entry.
  final V value;

// Constructs a new entry with the specified key and value.
  BTreeEntry(this.key, this.value);
}
