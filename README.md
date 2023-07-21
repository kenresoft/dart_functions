
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

The functions in this repository are well-documented and easy to use. They can be integrated into your Flutter apps with just a few lines of code.

#### Benefits of using this repository:

- Save time and effort by using pre-written, well-tested functions.
- Enhance the functionality of your Flutter apps with a wide range of features.
- Make your Flutter apps more modular and reusable.

#### Get started:

- Clone the repository to your local machine.
- Explore the different categories of functions.
- Read the documentation for each function.
- Integrate the functions into your Flutter apps.
  
## Related projects

* [payment_card](https://github.com/kenresoft/payment_card)
* [extensionresoft](https://github.com/kenresoft/extensionresoft) - (private repository)
* [image_recommendation](https://github.com/kenresoft/image_recommendation)

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

---

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


| **Function**          | **Description**                                         | **Output**                                                                   |
|-----------------------|---------------------------------------------------------|------------------------------------------------------------------------------|
| `euclideanDistance()` | Calculates the Euclidean distance between two datasets. | A double value representing the Euclidean distance between the two datasets. |
| `sortDistanceList()`  | Sorts a list of distances by their values.              | A sorted list of distances.                                                  |
| `kNearestNeighbors()` | Finds the k nearest neighbors of a given dataset.       | A list of the k nearest neighbors of the given dataset.                      |
| `recommendData()`     | Recommends data to a user based on their interests.     | A map of the number of times each neighbor has been recommended.             |

Here is a table that summarizes the input and output of each function:


| **Function**          | **Input**                  | **Output**                                                                   |
|-----------------------|----------------------------|------------------------------------------------------------------------------|
| `euclideanDistance()` | Two datasets               | A double value representing the Euclidean distance between the two datasets. |
| `sortDistanceList()`  | A list of distances        | A sorted list of distances.                                                  |
| `kNearestNeighbors()` | A dataset and an integer k | A list of the k nearest neighbors of the given dataset.                      |
| `recommendData()`     | A dataset and an integer k | A map of the number of times each neighbor has been recommended.             |

---

### 4. runTime.dart

This measures the execution time of a block of code. The function takes two parameters: a function that represents the block of code to be timed, and a function that will be called with the duration of the execution time.

The function works by first getting the current time. Then, it calls the block of code to be timed. Finally, it gets the current time again and calculates the difference between the two times. The difference is then passed to the second parameter as the duration of the execution time.

The code can be used to measure the execution time of different parts of a project. This can be helpful for identifying performance bottlenecks and optimizing the code.

For example, you could use the code to measure the execution time of a function that is called frequently in your project. If the execution time of the function is high, you could then optimize the function to improve its performance.

Here is an example of how the code could be used:

```
void main() {
  runTime(() {
    // Do something that takes some time.
  }, (duration) {
    print('The execution time was ${duration}');
  });
}
```

This code would measure the execution time of the `doSomething()` function and print the duration to the console.

---

### 5. scope.dart

The `let()` extension is a generic extension that takes a function as a parameter. The function is called with the receiver of the extension as its argument. The extension then returns the result of the function, or `null` if the function returns `null`.

The `let()` extension can be used to execute a function on a value and then return the result of the function. However, the `let()` extension in the code you provided has an additional check to ensure that the receiver of the extension is not `null`. If the receiver of the extension is `null`, the extension simply returns `null`.

Here is an example of how the `let()` extension can be used:

```
String capitalize(String str) {
  return str.let((it) => it[0].toUpperCase() + it.substring(1));
}

void main() {
  var str = 'hello';
  print(capitalize(str)); // Hello
}
```

In the example code, the `let()` extension is used to capitalize the first letter of a string. The `capitalize()` function takes a string as its argument and returns a new string with the first letter capitalized. The `let()` extension is then used to call the `capitalize()` function on the `str` variable. The result of the `capitalize()` function is then returned by the `let()` extension.

The `let` scope function is a powerful tool that can be used to simplify code and prevent NullPointerExceptions.

Here is a table of the benefits of using the `let` scope function:


| Benefit                                                                 | Description                                                                                                                                                                 |
|-------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Prevents NullPointerExceptions {same thing as using dart 3`?` operator} | The`let` function ensures that the object passed to it is not null before executing the expression.                                                                         |
| Simplifies code                                                         | The`let` function can be used to simplify code by eliminating the need to write multiple lines of code. It helps to execute a block of code within the context of an object |
| Makes code more readable                                                | The`let` function can make code more readable by grouping related code together.                                                                                            |

## Change Log

The Change log can be viewed here.
[Change Log](CHANGELOG.md)

### Contributing

This project is open source and contributions are welcome.
If you find a bug or have an improvement, please open an issue or submit a pull request.

Thank you for using Dart Functions!
