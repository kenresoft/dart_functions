## 1.0.0

- Initial version.
- Added three functions:
    * `multiply.dart`
    * `list_to_map.dart`
    * `join.dart`

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