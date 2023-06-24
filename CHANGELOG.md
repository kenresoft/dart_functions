## 1.0.0

- Initial version.
- Added three functions:
  * `multiply.dart`
    > creates a list of the given type that is multiplied by the given number.
  * `list_to_map.dart`
    > creates a map from a list.
  * `join.dart`
    > joins the elements of a list with a separator.

## 1.0.1

- Moved library codes to `lib/src/` and exported them through `lib/dart_functions.dart`
- Refactored and fixed bugs in functions.

## 1.0.2

- Added `space.dart` which is a helper function to format an input card number.
  - By default, uses 3 or 4 as the number divisor depending on the input length.
  - Returns the input with spaces inserted between each digit.
- Added `match.dart` which helps to validate the card number if it is valid or not.

## 1.0.3

- Analyzed and compared the performance of different data structures - `map`, `hashmap`, `linked hashmap`, `hybrid_map` and `btree`.
- Added math library with the introduction of linear algebra.
- Implemented machine learning recommendation algorithms and models.
- Created a sample data generator class (`dataset.dart`) for training of the ML models.

## 1.0.4

- Added `scope.dart` 
  - use the `let` extension if you want to make your code more concise and readable.
- Added `wrap.dart`
