/// A hybrid map that stores keys in a list and values in a map.
class HybridMap<K, V> {
  /// The list that stores the keys.
  final List<K> _keys = [];

  /// The map that stores the values.
  final Map<K, V> _values = {};

  /// Adds a new entry to the map.
  ///
  /// * `key`: The key of the entry.
  /// * `value`: The value of the entry.
  void add(K key, V value) {
    _keys.add(key);
    _values[key] = value;
  }

  /// Removes the entry with the specified key from the map.
  ///
  /// * `key`: The key of the entry to remove.
  ///
  /// Returns the value of the removed entry, or `null` if no such entry exists.
  V? remove(K key) {
    //_keys.remove(key);
    return _values.remove(key);
  }

  /// Returns an iterable that contains the keys of the map.
  ///
  /// The keys are returned in the order in which they were added to the map.
  Iterable<K> get keys => _keys;

  /// Returns an iterable that contains the values of the map.
  ///
  /// The values are returned in the order in which their corresponding keys were added to the map.
  Iterable<V> get values => _values.values;

  /// Returns the value of the entry with the specified key, or `null` if no such entry exists.
  ///
  /// * `key`: The key of the entry to retrieve.
  V? operator [](K key) => _values[key];

  /// Adds a new entry to the map with the specified key and value, or updates the value of an existing entry if it already exists.
  ///
  /// * `key`: The key of the entry to add or update.
  /// * `value`: The value of the entry to add or update.
  void operator []=(K key, V value) => add(key, value);

  /// Returns `true` if the map contains an entry with the specified key, `false` otherwise.
  ///
  /// * `key`: The key to check for.
  bool containsKey(K key) => _values.containsKey(key);

  /// Returns `true` if the map contains an entry with the specified value, `false` otherwise.
  ///
  /// * `value`: The value to check for.
  bool containsValue(V value) => _values.containsValue(value);

  /// Returns the number of entries in the map.
  int get length => _values.length;

  /// Clears the map.
  void clear() {
    _keys.clear();
    _values.clear();
  }
}
