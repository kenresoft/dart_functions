import 'package:dart_functions/dart_functions.dart';
import 'package:dart_functions/src/ml/recommendation.dart';
import 'package:dart_functions/src/space.dart';

import 'package:dart_functions/src/ml/forecast.dart';

void main(List<String> arguments) {
  arguments = ['Multiply', 'Dart', 'Function'];
  //print('Result: ${arguments.multiply4(times: 2, sort: true)}');

  List<int> list = [2, 4, 6, 8, 10];

  final object = list.mapFromList_1();

  var ob = ["Welcome", "to", "Dart"].joinFix_2(separator: " ", prefix: "_", suffix: "_", applyToEach: true);

  //print(ob);

  print('');

  //print(spacedDigits('4547548', 3));

/*  List dataset = [
    [2011, 80],
    [2012, 90],
    [2013, 92],
    [2014, 83],
    [2015, 94],
    [2016, 99],
    [2017, 92]
  ];

  print(straightLineForecast(2017, dataset));*/
  var r = Recommendation();
  print(r.dataset);
  print('');
  print(r.recommend());
}
