import 'dart:math';

import 'matrix.dart';

///
/// **Description:**
///
/// The `CubicRegression` class implements a cubic regression model. The model takes one argument:
///
/// * `matrix`: A matrix that contains the training data. The matrix should have two columns. The first column should contain the independent variable, and the second column should contain the dependent variable.
///
/// The model works by first calculating the least squares solution for the coefficients of the cubic polynomial. The least squares solution is calculated using a technique called matrix inversion. The model then uses the coefficients to calculate the predicted value for a given independent variable.
///
/// **Usage:**
///
/// To use the `CubicRegression` class, simply instantiate it with the training data and then call the `predict()` method to get the predicted value for a given independent variable. For example:
///
///
/// dart
/// CubicRegression model = new CubicRegression(trainingData);
/// double predictedValue = model.predict(testX);
///
///
/// **Limitations:**
///
/// The `CubicRegression` class is a simple model and as such, it has some limitations. First, it assumes that the data is linear, which may not always be the case. Second, it is sensitive to outliers, which can cause the model to make inaccurate predictions. Finally, it does not take into account any other factors that may affect the value of the dependent variable, such as seasonality or trends.
///
/// **Improvements:**
///
/// There are a number of ways to improve the `CubicRegression` class. First, you could use a more sophisticated model, such as a neural network. Second, you could use a technique called data cleaning to remove outliers from the dataset. Finally, you could add features to the model to account for other factors that may affect the value of the dependent variable.
class CubicRegression {
  const CubicRegression(this.matrix);

  final Matrix matrix;

  /// Returns the predicted value for the given testX.
  double predict(var testX) {
    /// Calculate the first column of the design matrix.
    Column c1 = matrix.column1;

    /// Calculate the second column of the design matrix.
    Column c2 = matrix.column1.map((e) => e * e).toList();

    /// Calculate the third column of the design matrix.
    Column c3 = c2.map((e) => e * (sqrt(e))).toList();

    /// Create the design matrix.
    Matrix x = Matrix.singleColumn(row: matrix.rows)
      ..addColumn(c1, 1)
      ..addColumn(c2, 2)
      ..addColumn(c3, 3);

    /// Create the response vector.
    Matrix y = Matrix.singleColumn(row: matrix.rows)..setColumn(matrix.column2, 0);

    /// Calculate the least squares solution.
    Matrix step1 = x.transpose;
    Matrix step2 = step1 * x;
    Matrix step3 = step2.inverse;
    Matrix step4 = step3 * step1 * y;

    /// Extract the coefficients.
    double a = step4[0][0];
    double b = step4[1][0];
    double c = step4[2][0];
    double d = step4[3][0];

    /// Calculate the predicted value.
    double yPredict = a + (b * testX) + (c * pow(testX, 2)) + (d * pow(testX, 3));

    /// Return the predicted value.
    return yPredict;
  }
}
