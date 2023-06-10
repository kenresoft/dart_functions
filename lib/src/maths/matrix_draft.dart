import 'package:matrices/matrices.dart' as matrices;

typedef Column = List<double>;

class Matrix extends matrices.Matrix {
  late List<List<double>> data;

  Matrix([this.data = const []]) : super.fromList(data);

  Matrix.singleRow(int column) : super.one(1, column);

  Matrix.singleColumn({required int row}) : super.one(row, 1);

  Matrix get mat => this;

  int get rows => data.length;

  int get columns => data[0].length;

  Column get column1 => data[0];

  Column get column2 => data[1];

  @override
  Matrix get transpose => Matrix(data.map((row) => row.toList().reversed.toList()).toList());

  Matrix get inverse {
    double determinant = this.determinant();
    if (determinant == 0) {
      throw ArgumentError('Matrix is not invertible');
    }
    return Matrix([
      [
        (-data[1][2] * data[2][0] + data[1][0] * data[2][2] - data[1][1] * data[2][1]) / determinant,
        (data[0][2] * data[2][1] - data[0][1] * data[2][2] + data[0][0] * data[2][0]) / determinant,
        (-data[0][1] * data[1][2] + data[0][2] * data[1][1] + data[0][0] * data[1][0]) / determinant,
      ],
      [
        (data[1][2] * data[2][0] - data[1][0] * data[2][2] + data[1][1] * data[2][1]) / determinant,
        (-data[0][2] * data[2][1] + data[0][1] * data[2][2] - data[0][0] * data[2][0]) / determinant,
        (data[0][1] * data[1][2] - data[0][2] * data[1][1] - data[0][0] * data[1][0]) / determinant,
      ],
      [
        (-data[1][1] * data[2][0] + data[1][0] * data[2][1] + data[1][2] * data[2][2]) / determinant,
        (data[0][1] * data[2][2] - data[0][2] * data[2][1] + data[0][0] * data[2][0]) / determinant,
        (-data[0][2] * data[1][0] + data[0][0] * data[1][2] + data[0][1] * data[1][1]) / determinant,
      ],
    ]);
  }

  @override
  Matrix operator *(multi) {
    Matrix result = Matrix();
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < multi.columns; j++) {
        double sum = 0;
        for (int k = 0; k < columns; k++) {
          sum += data[i][k] * multi[k][j];
        }
        result[i][j] = sum;
      }
    }
    return result;
  }

  double determinant() {
    double determinant = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = i; j < rows; j++) {
        if (data[j][i] != 0) {
          determinant += data[j][i] * sign(data, i, j);
        }
      }
    }
    return determinant;
  }

  double sign(List<List<double>> data, int i, int j) {
    if (i == j) {
      return 1;
    } else if ((i + j) % 2 == 1) {
      return -1;
    } else {
      return 1;
    }
  }

  void swapColumns(int column1, int column2) {
    // Check if the column indexes are valid
    if (column1 < 0 || column1 >= mat.columns || column2 < 0 || column2 >= mat.columns) {
      throw ArgumentError('Invalid column index');
    }

    // Swap the columns
    for (int i = 0; i < mat.rows; i++) {
      double temp = mat[i][column1];
      mat[i][column1] = mat[i][column2];
      mat[i][column2] = temp;
    }
  }
}