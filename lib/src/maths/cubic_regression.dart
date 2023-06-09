import 'dart:math';

import 'package:matrices/matrices.dart' as matrices;

class CubicRegression {
  const CubicRegression(this.dataset);

  final matrices.Matrix dataset;

  predict(var testX) {
    var c1 = dataset.column(0);
    var c2 = dataset.column(0).map((e) => e * e).toList();
    var c3 = c2.map((e) => e * (sqrt(e))).toList();

    var x = matrices.Matrix.one(dataset.rowCount, 1)
      ..addColumn(c1, 1)
      ..addColumn(c2, 2)
      ..addColumn(c3, 3);

    var y = matrices.Matrix.one(dataset.rowCount, 1)..setColumn(dataset.column(1), 0);

    var step1 = x.transpose;
    var step2 = matrices.SquareMatrix.fromList((step1 * x).matrix);
    var step3 = step2.inverse;
    var step4 = step3 * step1 * y;

    var a = step4[0][0];
    var b = step4[1][0];
    var c = step4[2][0];
    var d = step4[3][0];

    var yPredict = a + (b * testX) + (c * pow(testX, 2)) + (d * pow(testX, 3));

    return yPredict;
  }
}
