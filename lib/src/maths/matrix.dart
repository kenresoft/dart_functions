import 'package:matrices/matrices.dart' as matrices;

class Matrix extends matrices.Matrix {
  late List<List<double>> data;

  //Matrix() : super();

  Matrix(this.data) : super.fromList(data);

  Matrix.singleRow(int column) : super.one(1, column);

  Matrix.singleColumn(int row) : super.one(row, 1);

  List<List<double>> get mat => super.matrix;

  int get rows => mat.length;

  int get columns => mat[0].length;

  Column get column1 => column(1);

  Column get column2 => column(2);

/*  double operator [](int row, int column) {
    return data[row][column];
  }*/

/*  @override
  Matrix operator *(Matrix other) {
    assert(columns == other.rows);
    Matrix result = Matrix(List.generate(rows, (_) => List.generate(other.columns, (_) => 0.0)));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < other.columns; j++) {
        for (int k = 0; k < columns; k++) {
          result[i][j] += data[i][k] * other[k][j];
        }
      }
    }
    return result;
  }*/

  @override
  Matrix operator *(multi) {
    return Matrix((super * multi).matrix);
  }

  @override
  Matrix get transpose => Matrix(super.transpose.matrix);

  /*Matrix get inverse {
    assert(rows == columns);
    Matrix augmentedMatrix = Matrix([...data, ...List.generate(rows, (_) => List.generate(1, (_) => 1.0))]);
    for (int i = 0; i < rows; i++) {
      for (int j = i + 1; j < rows; j++) {
        if (augmentedMatrix[i][i].abs() < augmentedMatrix[j][i].abs()) {
          augmentedMatrix.swapRows(i, j);
        }
      }
      double pivot = augmentedMatrix[i][i];
      for (int j = i; j < rows + 1; j++) {
        augmentedMatrix[i][j] /= pivot;
      }
      for (int j = 0; j < rows; j++) {
        if (i != j) {
          double factor = augmentedMatrix[j][i];
          for (int k = i; k < rows + 1; k++) {
            augmentedMatrix[j][k] -= factor * augmentedMatrix[i][k];
          }
        }
      }
    }
    List<List<double>> result = [];
    for (int i = 0; i < rows; i++) {
      result.add(augmentedMatrix[i].sublist(0, columns));
    }
    return Matrix(result);
  }*/

  Matrix get inverse {
    return Matrix(super.square.inverse.matrix);
  }

  void swapRows(int row1, int row2) {
    List<double> temp = data[row1];
    data[row1] = data[row2];
    data[row2] = temp;
  }
}

/*class Colum extends matrices.Matrix {
  late Column col;

  Colum(this.col) {}

  List<List<double>> get mat => super.matrix;

  Colum.fromList(int column) {
    Matrix matrix = Matrix(mat);
    matrix.column(column);
  }
}*/

typedef Column = List<double>;
