import 'package:dart_functions/src/maths/cubic_regression.dart';
import 'package:dart_functions/src/maths/matrix.dart';

import 'dataset.dart';
import 'recommender.dart';

class Recommendation {
  late List<Dataset> _data;
  late CubicRegression _model;
  late Matrix _matrix;
  late double _prediction;
  late Map _recommendation;

  Matrix get matrix => _matrix;

  double get prediction => _prediction;

  Map get recommendation => _recommendation;

  void train({required List<Dataset> dataset}) {
    _data = dataset;
    _matrix = Dataset.toMatrix(_data);
    _model = CubicRegression(_matrix);
  }

  void predict({required double views}) {
    _prediction = _model.predict(views);
  }

  void recommend({required Dataset testDatapoint, required int count}) {
    _recommendation = Recommender(trainDataset: _data).recommendData(testDatapoint, count);
  }
}
