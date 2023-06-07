# dart_functions

A collection of multi-versioned dart functions. 
Contains implementations and re-implementations of functions in different versions and variants.

## Project type

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

### Included functions

* multiply
* mapFromList
* joinFix
* spacedDigits
* matchCard

## Related projects

* [payment_card](https://github.com/kenresoft/payment_card)
* [extensionresoft](https://github.com/kenresoft/extensionresoft) - (private repository)

## Change Log

### 1.0.0

- Initial version.
- Added three functions:
    * `multiply.dart`
    * `list_to_map.dart`
    * `join.dart`

### 1.0.1

- Moved library codes to `lib/src/` and exported them through `lib/dart_functions.dart`

### 1.0.2

- Added `space.dart` which is a helper function to format an input card number.
    - By default, uses 3 or 4 as the number divisor depending on the input length.
    - Returns the input with spaces inserted between each digit.
- Added `match.dart` which helps to validate the card number if it is valid or not.

___

The Change log can be viewed here.
[Change Log](CHANGELOG.md)