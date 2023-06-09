import 'dart:math';

import 'matrix.dart';

class CubicRegression {
  const CubicRegression(this.matrix);

  final Matrix matrix;

  predict(var testX) {
    Column c1 = matrix.column1;
    Column c2 = matrix.column1.map((e) => e * e).toList();
    Column c3 = c2.map((e) => e * (sqrt(e))).toList();

    Matrix x = Matrix.singleColumn(matrix.rows)
      ..addColumn(c1, 1)
      ..addColumn(c2, 2)
      ..addColumn(c3, 3);

    Matrix y = Matrix.singleColumn(matrix.rows)..setColumn(matrix.column1, 0);

    Matrix step1 = x.transpose;
    Matrix step2 = step1 * x;
    Matrix step3 = step2.inverse;
    Matrix step4 = step3 * step1 * y;

    double a = step4[0][0];
    double b = step4[1][0];
    double c = step4[2][0];
    double d = step4[3][0];

    double yPredict = a + (b * testX) + (c * pow(testX, 2)) + (d * pow(testX, 3));

    return yPredict;
  }
}
