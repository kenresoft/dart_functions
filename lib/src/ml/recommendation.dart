import 'package:dart_functions/dart_functions.dart';

import 'recommender.dart';

class Recommendation {
  late Dataset _data;
  late CubicRegression _model;
  late Matrix _matrix;
  late double _prediction;
  late Map _recommendation;

  //Matrix get matrix => _matrix;

  //double get prediction => _prediction;

  //Map get recommendation => _recommendation;

  void train({required Dataset dataset, required ResultCallback matrix}) {
    _data = dataset;
    _matrix = DataImage.toMatrix(_data);
    _model = CubicRegression(_matrix);
    matrix(_matrix);
  }

  void predict({required double views, required ResultCallback onPredicted}) {
    _prediction = _model.predict(views);
    onPredicted(_prediction);
  }

  void recommend({required DataImage testDatapoint, required int count, required ResultCallback onRecommended}) {
    _recommendation = Recommender(trainDataset: _data).recommendData(testDatapoint, count);
    onRecommended(_recommendation);
  }
}

typedef ResultCallback = void Function(dynamic result);
