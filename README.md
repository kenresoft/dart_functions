# dart_functions

A collection of multi-versioned dart functions.
Contains implementations and re-implementations of functions in different versions and variants.

## Project type

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

### Included functions/classes

* multiply
* mapFromList
* joinFix
* spacedDigits
* matchCard
* runtime
* hybridMap
* btree
* matrix
* regressions
* recommender
* dataset

## Related projects

* [payment_card](https://github.com/kenresoft/payment_card)
* [extensionresoft](https://github.com/kenresoft/extensionresoft) - (private repository)

## Usage/examples

### 1. join.dart

```dart

List<String> strings = ["Hello", "World"];

String joinedStrings = strings.joinFix(separator: ", ");

print(joinedStrings); // Hello, World

String joinedStringsWithPrefixAndSuffix = strings.joinFix(
  separator: ", ",
  prefix: "(",
  suffix: ")",
  applyToEach: true,
);

print(joinedStringsWithPrefixAndSuffix); // (Hello, World)

```

#### Explanation

Here is a table that summarizes the behavior of the `joinFix()` function:

| Argument      | Behavior                                                                                                                                                      |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `separator`   | The string that will be used to separate the elements of the list.                                                                                            |
| `prefix`      | The string that will be prepended to each element of the list.                                                                                                |
| `suffix`      | The string that will be appended to each element of the list.                                                                                                 |
| `applyToEach` | A Boolean value that indicates whether the prefix and suffix should be applied to each element of the list.                                                   |
| Return value  | A string that contains the elements of the list, separated by the separator and with the prefix and suffix applied to each element, if `applyToEach` is true. |


---

## Change Log

The Change log can be viewed here.
[Change Log](CHANGELOG.md)