import 'package:matrices/matrices.dart' as matrices;

class Matrix extends matrices.Matrix {
  Matrix([this.data = const []]) : super.fromList(data);

  late List<List<double>> data;

  // Matrix.singleRow(int column) : data = [];
  //
  // Matrix.singleColumn({required int row}) : data = [];

  Matrix.singleRow(int column) : super.one(1, column);

  Matrix.singleColumn({required int row}) : super.one(row, 1);

  Matrix get mat => Matrix(data);

  int get rows => data.length;

  int get columns => data[0].length;

  Column get column1 => data[0];

  Column get column2 => data[1];

  @override
  Matrix get transpose => Matrix(data.map((row) => row.toList().reversed.toList()).toList());

  Matrix get inverse {
    if (rows != columns) {
      throw ArgumentError('Matrix is not invertible');
    }

    double determinant = this.determinant();
    if (determinant == 0) {
      throw ArgumentError('Matrix is singular');
    }

    return Matrix(
      [
        [
          (data[1][1] * data[2][2]) - (data[1][2] * data[2][1]),
          (data[0][2] * data[2][1]) - (data[0][1] * data[2][2]),
          (data[0][1] * data[1][2]) - (data[0][2] * data[1][1]),
        ],
        [
          (data[1][2] * data[2][0]) - (data[1][0] * data[2][2]),
          (data[0][0] * data[2][2]) - (data[0][2] * data[2][0]),
          (data[0][2] * data[1][0]) - (data[0][0] * data[1][2]),
        ],
        [
          (data[1][0] * data[2][1]) - (data[1][1] * data[2][0]),
          (data[0][1] * data[2][0]) - (data[0][0] * data[2][1]),
          (data[0][0] * data[1][1]) - (data[0][1] * data[1][0]),
        ],
      ],
    );
  }

  @override
  Matrix operator *(multi) {
    Matrix result = Matrix.identity(rows);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        for (int k = 0; k < columns; k++) {
          result.data[i][j] += data[i][k] * multi.data[k][j];
        }
      }
    }
    return result;
  }

  double determinant() {
    double result = 0;
    for (int i = 0; i < rows; i++) {
      result += data[0][i] * cofactor(i);
    }
    return result;
  }

  double cofactor(int row) {
    double result = 1;
    for (int i = 0; i < rows; i++) {
      if (i != row) {
        result *= data[i][row] * sign(i, row);
      }
    }
    return result;
  }

  int sign(int a, int b) {
    if ((a + b) % 2 == 0) {
      return 1;
    } else {
      return -1;
    }
  }

  static Matrix identity(int size) {
    //Matrix
    return Matrix();
  }
}

typedef Column = List<double>;
