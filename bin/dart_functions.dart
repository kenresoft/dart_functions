import 'package:dart_functions/dart_functions.dart';

void main(List<String> arguments) {
  arguments = ['Multiply', 'Dart', 'Function'];
  //print('Result: ${arguments.multiply4(times: 2, sort: true)}');

  List<int> list = [2, 4, 6, 8, 10];

  final object = list.mapFromList_1();

  var ob = ["Welcome", "to", "Dart"].joinFix_2(separator: " ", prefix: "_", suffix: "_", applyToEach: true);

  //print(ob);

  print('');

  //print(spacedDigits('4547548', 3));

  List<List<double>> dataset_ = [
    /*[1, 2, 11],
    [1, 4, 21],
    [2, 6, 32],
    [2, 6, 32],
    [2, 8, 42],
    [3, 9, 48],
    [3, 9, 48],
    [5, 10, 55],*/
    [5, 1000],
    [4.5, 1000],
    [4, 500],
    [3.5, 200],
    [3, 100],
    [2.5, 50],
    [1, 1],
  ];

  List<List<double>> dataset = [
    [1000, 10],
    [500, 9],
    [200, 8],
    [100, 7],
    [50, 6],
    [25, 5],
    [10, 4],
    [5, 3],
    [2, 2],
    [1, 1],
    [950, 9.5],
    [450, 9],
    [150, 8],
    [75, 7],
    [37, 6],
    [18, 5],
    [9, 4],
    [4, 3],
    [2, 2],
    [1, 1],
    [900, 9.5],
    [400, 9],
    [100, 8],
    [50, 7],
    [25, 6],
    [10, 5],
    [5, 4],
    [2, 3],
    [1, 2],
    [1, 1],
    [850, 9.5],
    [350, 9],
    [125, 8],
    [62, 7],
    [31, 6],
    [16, 5],
    [8, 4],
    [4, 3],
    [2, 2],
    [1, 1],
    [800, 9.5],
    [300, 9],
    [100, 8],
    [50, 7],
    [25, 6],
    [10, 5],
    [5, 4],
    [2, 3],
    [1, 2],
    [1, 1],
    [750, 9.5],
    [250, 9],
    [125, 8],
    [62, 7],
    [31, 6],
    [16, 5],
    [8, 4],
    [4, 3],
    [2, 2],
    [1, 1],
  ];

  var r = Recommendation();
  r.train(dataset: DataImage.fromList(dataset), matrix: (result) {});
  r.predict(views: 1000, onPredicted: print);
  r.recommend(testDatapoint: DataImage.dataPoint(views: 12, rating: 10.0), count: 4, onRecommended: print);

  print('');
  //print(Dataset.sample());
  //print(DataImage.fromList(dataset).toJson());
  //print('');
  //print(DataImage.toJsonList(DataImage.fromList(dataset)));

  /*  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  36,
  37,
  38,
  39,
  40,
  41,
  42,
  43,
  44,
  45,
  46,
  47,
  48,
  49,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  58,
  59,
  60,*/

  print(forecast(1000, dataset));

  //var matrix = Matrix(dataset_)..swapColumns(0, 1);
}
