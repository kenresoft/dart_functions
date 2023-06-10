import 'package:matrices/matrices.dart' as matrices;

/// A class that represents a matrix.
class Matrix extends matrices.Matrix {
  /// The data of the matrix.
  late List<List<double>> data;

  /// Creates a new matrix with the given data.
  ///
  /// The data must be a list of lists of doubles.
  Matrix([this.data = const []]) : super.fromList(data);

  /// Creates a new matrix with a single row.
  ///
  /// The column must be a positive integer.
  Matrix.singleRow(int column) : super.one(1, column);

  /// Creates a new matrix with a single column.
  ///
  /// The row must be a positive integer.
  Matrix.singleColumn({required int row}) : super.one(row, 1);

  /// The data of the matrix as a list of lists.
  Matrix get mat => Matrix(matrix);

  /// The number of rows in the matrix.
  int get rows => data.length;

  /// The number of columns in the matrix.
  int get columns => data[0].length;

  /// This method returns the transpose of the matrix.
  ///
  /// The transpose of a matrix is a new matrix that has the rows and columns swapped.
  @override
  Matrix get transpose => Matrix(super.transpose.matrix);

  /// This method returns the inverse of the matrix.
  ///
  /// The inverse of a matrix is a new matrix that, when multiplied by the original matrix,
  /// results in the identity matrix.
  ///
  /// The identity matrix is a square matrix with all of its diagonal elements equal to 1
  /// and all of its off-diagonal elements equal to 0.
  Matrix get inverse {
    return Matrix(super.square.inverse.matrix);
  }

  /// The first column of the matrix.
  Column get column1 => column(0);

  /// The second column of the matrix.
  Column get column2 => column(1);

  @override

  /// Multiplies this matrix by another matrix.
  ///
  /// The other matrix must have the same number of columns as this matrix has rows.
  Matrix operator *(multi) {
    return Matrix((super * multi).matrix);
  }

  /// Swaps the rows of the matrix at the given indexes.
  ///
  /// The row indexes must be valid.
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

  /// Swaps the columns of the matrix at the given indexes.
  ///
  /// The column indexes must be valid.
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
