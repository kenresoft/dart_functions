import 'package:matrices/matrices.dart' as matrices;

class Matrix extends matrices.Matrix {
  late List<List<double>> data;

  Matrix([this.data = const []]) : super.fromList(data);

  Matrix.singleRow(int column) : super.one(1, column);

  Matrix.singleColumn({required int row}) : super.one(row, 1);

  Matrix get mat => Matrix(matrix);

  int get rows => matrix.length;

  int get columns => matrix[0].length;

  Column get column1 => column(0);

  Column get column2 => column(1);

  @override
  Matrix get transpose => Matrix(super.transpose.matrix);

  Matrix get inverse {
    return Matrix(super.square.inverse.matrix);
  }

  @override
  Matrix operator *(multi) {
    return Matrix((super * multi).matrix);
  }

  void swapRows(int row1, int row2) {
    // Check if the row indexes are valid
    if (row1 < 0 || row1 >= mat.rows || row2 < 0 || row2 >= mat.rows) {
      throw ArgumentError('Invalid row index');
    }

    // Swap the rows
    for (int i = 0; i < mat.columns; i++) {
      double temp = mat[row1][i];
      mat[row1][i] = mat[row2][i];
      mat[row2][i] = temp;
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

typedef Column = List<double>;

