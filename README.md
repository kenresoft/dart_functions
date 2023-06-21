# dart_functions

A collection of multi-versioned dart functions.
Contains implementations and re-implementations of functions in different versions and variants.

## Project type

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and an example unit test in `test/`.

### Features

* A wide variety of functions to choose from
* Functions are well-documented and easy to use
* Functions are organized into logical categories
* Functions can be integrated into any Dart/Flutter application

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

| Argument      | Behavior                                                                                                                                                     |
|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `separator`   | The string that will be used to separate the elements of the list.                                                                                           |
| `prefix`      | The string that will be prepended to each element of the list.                                                                                               |
| `suffix`      | The string that will be appended to each element of the list.                                                                                                |
| `applyToEach` | A Boolean value that indicates whether the prefix and suffix should be applied to each element of the list.                                                  |
| Return value  | A string that contains the elements of the list, separated by the separator and with the prefix and suffix applied to each element, if`applyToEach` is true. |

### 2. Dataset.dart

To convert Dataset(List of DataImages) to JSON, you can do the following:

> Recommended way

```dart
List<List<double>> dataset = [];
var dataset = DataImage.fromList(dataset);
var json = DataImage.fromList(dataset).toJson();
```

> Alternatively, this is also possible:

```dart
List<List<double>> dataset = [];
var dataset = DataImage.fromList(dataset);
var json = DataImage.toJsonList(DataImage.fromList(dataset));
```

---


### 3. recommender.dart

#### Explanation

Here is a table explanation of the recommender.

**Function** | **Description** | **Output**
---|---|---|
`euclideanDistance()` | Calculates the Euclidean distance between two datasets. | A double value representing the Euclidean distance between the two datasets.
`sortDistanceList()` | Sorts a list of distances by their values. | A sorted list of distances.
`kNearestNeighbors()` | Finds the k nearest neighbors of a given dataset. | A list of the k nearest neighbors of the given dataset.
`recommendData()` | Recommends data to a user based on their interests. | A map of the number of times each neighbor has been recommended.


Here is a table that summarizes the input and output of each function:


**Function** | **Input** | **Output**
---|---|---|
`euclideanDistance()` | Two datasets | A double value representing the Euclidean distance between the two datasets.
`sortDistanceList()` | A list of distances | A sorted list of distances.
`kNearestNeighbors()` | A dataset and an integer k | A list of the k nearest neighbors of the given dataset.
`recommendData()` | A dataset and an integer k | A map of the number of times each neighbor has been recommended.

## Change Log

The Change log can be viewed here.
[Change Log](CHANGELOG.md)

### Contributing

This project is open source and contributions are welcome.
If you find a bug or have an improvement, please open an issue or submit a pull request.

Thank you for using Dart Functions!

