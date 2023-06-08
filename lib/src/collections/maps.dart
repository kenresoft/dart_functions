import 'dart:collection';

void main() {
  // Create a Map
  Map<String, int> map = {'a': 1, 'b': 2, 'c': 3};

  // Iterate over the keys
  for (String key in map.keys) {
    print(key);
  }

  // Iterate over the values
  for (int value in map.values) {
    print(value);
  }

  // Get the value for a key
  int? value = map['a'];
  print(value);

  // Add a new key-value pair to the map
  map['d'] = 4;

  // Remove a key-value pair from the map
  //map.remove('b');

  // Check if a key exists in the map
  bool exists = map.containsKey('a');
  print(exists);

  // Get the size of the map
  int size = map.length;
  print(size);

  print('-------------------');

  // Create a HashMap
  HashMap<String, int> hashMap = HashMap<String, int>.from(map);

  // Iterate over the keys of the HashMap
  for (String key in hashMap.keys) {
    print(key);
  }

  // Iterate over the values of the HashMap
  for (int value in hashMap.values) {
    print(value);
  }

  // Get the value for a key in the HashMap
  int? value2 = hashMap['a'];
  print(value2);

  // Add a new key-value pair to the HashMap
  hashMap['e'] = 5;

  // Remove a key-value pair from the HashMap
  //hashMap.remove('b');

  // Check if a key exists in the HashMap
  bool exists2 = hashMap.containsKey('a');
  print(exists2);

  // Get the size of the HashMap
  int size2 = hashMap.length;
  print(size2);

  print('-------------------');

  // Create a LinkedHashMap
  LinkedHashMap<String, int> linkedHashMap = LinkedHashMap<String, int>.from(map);

  // Iterate over the keys of the LinkedHashMap
  for (String key in linkedHashMap.keys) {
    print(key);
  }

  // Iterate over the values of the LinkedHashMap
  for (int value in linkedHashMap.values) {
    print(value);
  }

  // Get the value for a key in the LinkedHashMap
  int? value3 = linkedHashMap['a'];
  print(value3);

  // Add a new key-value pair to the LinkedHashMap
  linkedHashMap['f'] = 6;

  // Remove a key-value pair from the LinkedHashMap
  //linkedHashMap.remove('b');

  // Check if a key exists in the LinkedHashMap
  bool exists3 = linkedHashMap.containsKey('a');
  print(exists3);

  // Get the size of the LinkedHashMap
  int size3 = linkedHashMap.length;
  print(size3);

  print('-------------------');

  hashMap.forEach((key, value) {
    print((key, value));
  });


  print('-------------------');

  linkedHashMap.forEach((key, value) {
    print((key, value));
  });
}
