import 'package:dart_functions/src/extensions/join.dart';
import 'package:dart_functions/src/extensions/list_to_map.dart';
import 'package:dart_functions/src/maths/cubic_regression.dart';
import 'package:matrices/matrices.dart';
//import 'package:dart_functions/src/maths/matrix.dart';
import 'package:dart_functions/src/ml/ml_knn.dart';
import 'package:dart_functions/src/ml/recommendation.dart';

void main(List<String> arguments) {
  arguments = ['Multiply', 'Dart', 'Function'];
  //print('Result: ${arguments.multiply4(times: 2, sort: true)}');

  List<int> list = [2, 4, 6, 8, 10];

  final object = list.mapFromList_1();

  var ob = ["Welcome", "to", "Dart"].joinFix_2(separator: " ", prefix: "_", suffix: "_", applyToEach: true);

  //print(ob);

  print('');

  //print(spacedDigits('4547548', 3));

  List<List<double>> dataset = [
    /*[1, 2, 11],
    [1, 4, 21],
    [2, 6, 32],
    [2, 6, 32],
    [2, 8, 42],
    [3, 9, 48],
    [3, 9, 48],
    [5, 10, 55],*/
    //[5, 1000],
    [4.5, 900],
    [4, 500],
    [3.5, 200],
    [3, 100],
    [2.5, 50],
    //[0, 1],
  ];

  //print(straightLineForecast(2017, dataset));*/

/*  var k = mlKnn(dataset, [5, 0], 4);
  //var kn = k.recommend([6,6]);
  print(k);*/

/*  var r = Recommendation();
  //print(r.dataset);
  print('');
  print(r.recommend());*/

  var d = CubicRegression(Matrix.fromList(dataset));
  print(d.predict(3.5));
}
