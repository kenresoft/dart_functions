import 'dart:collection';

import 'package:dart_functions/src/blocks/runtime.dart';
import 'package:dart_functions/src/collections/btree.dart';
import 'package:dart_functions/src/collections/hybrid_map.dart';

void main() {
  // Create a HashMap and a LinkedHashMap
  HashMap<String, int> hashMap = HashMap<String, int>();
  LinkedHashMap<String, int> linkedHashMap = LinkedHashMap<String, int>();
  HybridMap<String, int> hybridMap = HybridMap<String, int>();
  BTree<String, int> bTree = BTree<String, int>();

  // Add 1000000 elements to each map
  runTime(() {
    for (int i = 0; i < 1000000; i++) {
      hashMap['key$i'] = i;
      linkedHashMap['key$i'] = i;
      hybridMap['key$i'] = i;
      bTree['key$i'] = i;
    }
  }, (duration) => print('INSERT time Map: ${duration.inMilliseconds}ms'));

  print('--------------------------');

  runTime(() {
    for (int i = 0; i < 1000000; i++) {
      hashMap['key$i'];
    }
  }, (duration) => print('Lookup time HashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 0; i < 1000000; i++) {
      linkedHashMap['key$i'];
    }
  }, (duration) => print('Lookup time linkedHashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 0; i < 1000000; i++) {
      hybridMap['key$i'];
    }
  }, (duration) => print('Lookup time hybridMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 0; i < 1000000; i++) {
      bTree['key$i'];
    }
  }, (duration) => print('Lookup time bTree: ${duration.inMilliseconds}ms'));

  ///--------------------------

  print('--------------------------');

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      hashMap['key$i'] = i;
    }
  }, (duration) => print('Insert time HashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      linkedHashMap['key$i'] = i;
    }
  }, (duration) => print('Insert time linkedHashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      hybridMap['key$i'] = i;
    }
  }, (duration) => print('Insert time hybridMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      bTree['key$i'] = i;
    }
  }, (duration) => print('Insert time bTree: ${duration.inMilliseconds}ms'));

  print('--------------------------');

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      hashMap.remove('key$i');
    }
  }, (duration) => print('Remove time HashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      linkedHashMap.remove('key$i');
    }
  }, (duration) => print('Remove time linkedHashMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      hybridMap.remove('key$i');
    }
  }, (duration) => print('Remove time hybridMap: ${duration.inMilliseconds}ms'));

  runTime(() {
    for (int i = 1000000; i < 2000000; i++) {
      bTree.remove('key$i');
    }
  }, (duration) => print('Remove time bTree: ${duration.inMilliseconds}ms'));

  ///--------------------------
}
