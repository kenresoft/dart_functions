import 'dart:math';

double forecast(int year, List<List<double>> dataset) {
  /// Calculate the sum of y for coefficientA.
  double sum = 0;
  for (var row in dataset) {
    sum += row[1];
  }

  /// Calculate the mid element to subtract from year in each iteration.
  double midElement = dataset[dataset.length ~/ 2][0];

  /// Calculate the sum of xy for coefficientB.
  double xy = 0;
  for (var row in dataset) {
    xy += (row[0] - midElement) * row[1];
  }

  /// Calculate the sum of x^2 for coefficientB.
  double xSquare = 0;
  for (var row in dataset) {
    xSquare += pow(row[0] - midElement, 2);
  }

  /// Calculate the coefficient A.
  double a = sum / dataset.length;

  /// Calculate the coefficient B.
  double b = xy / xSquare;

  /// Calculate the forecasted value.
  double y = a + (b * (year - midElement));

  return y;
}
