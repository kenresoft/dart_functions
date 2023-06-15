import 'package:dart_functions/dart_functions.dart';

import 'recommender.dart';

/// The `Recommendation` class provides methods for training, predicting, and recommending data.
class Recommendation {
  /// The dataset used to train the model.
  late Dataset? _data;

  /// The model used to predict and recommend data.
  late CubicRegression? _model;

  /// The matrix representation of the dataset.
  late Matrix? _matrix;

  /// The predicted value.
  late double? _prediction;

  /// The recommended data.
  late Map? _recommendation;

  /// Gets the matrix representation of the dataset.
  ///
  /// Throws an `StateError` if the dataset has not been trained.
  Matrix? get matrix {
    if (_matrix == null) {
      throw StateError('The dataset has not been trained.');
    }

    return _matrix;
  }

  /// Gets the predicted value.
  ///
  /// Throws an `StateError` if the model has not been trained.
  double? get prediction {
    if (_prediction == null) {
      throw StateError('The model has not been trained.');
    }

    return _prediction;
  }

  /// Gets the recommended data.
  ///
  /// Throws an `StateError` if the model has not been trained.
  Map? get recommendation {
    if (_recommendation == null) {
      throw StateError('The model has not been trained.');
    }

    return _recommendation;
  }

  /// Trains the model using the specified dataset.
  ///
  /// The `matrix` callback will be called with the matrix representation of the dataset.
  void train({required Dataset dataset, required ResultCallback matrix}) {
    _data = dataset;
    _matrix = DataImage.toMatrix(_data!);
    _model = CubicRegression(_matrix!);
    matrix(_matrix);
  }

  /// Predicts the value for the specified number of views.
  ///
  /// The `onPredicted` callback will be called with the predicted value.
  void predict({required double views, required ResultCallback onPredicted}) {
    _prediction = _model?.predict(views);
    onPredicted(_prediction);
  }

  /// Recommends the specified number of data points.
  ///
  /// The `onRecommended` callback will be called with the recommended data points.
  void recommend({required DataImage testDatapoint, required int count, required ResultCallback onRecommended}) {
    _recommendation = Recommender(trainDataset: _data!).recommendData(testDatapoint, count);
    onRecommended(_recommendation);
  }
}

/// A callback that accepts a dynamic result.
typedef ResultCallback = void Function(dynamic result);
