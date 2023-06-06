import 'match.dart';

/// Read more about these functions here:
///
/// [Payment card number division with a space as the separator.](https://gist.github.com/kenresoft/bc91291c6d1d06826002939c38f5498a)
///
// This code is written in Dart programming language

// This function takes a string input and returns the number of divisions that can be made
// in the string based on its length. A division is made by adding a space character after
// every n characters, where n is the number of divisions.
int divisions(String input) {
  int divisions = 0;

  // Check if the length of the input string is divisible by 3 or 4
  for (var j = 3; j <= 4; ++j) {
    if (input.length % j == 0) {
      // If the length is divisible by 3 or 4, set the number of divisions to that value
      return divisions = j;
    }
  }
  // If the length is not divisible by 3 or 4, the number of divisions remains 0
  return divisions;
}

int divisionsWithRemainder(String input) {
  int divisions = 0;

  for (var j = 3; j <= 4; ++j) {
    divisions = 4;
    if (input.length % j == 2) {
      return divisions = j;
    }
  }
  return divisions;
}

/// * The `spacedDigits()` function takes two arguments: the input string and the divisor. The divisor is optional. If the divisor is not provided, then the function will use the number of digits in the input string as the divisor.
///
/// * The `spacedDigits()` function works by first calling the `space()` function to get a string with spaces inserted between each digit of the input string. If the divisor is provided, then the `space()` function will use the divisor to determine how many spaces to insert between each digit.
///
/// * The `spacedDigits()` function then returns the string with spaces inserted between each digit.
///
/// Here is a breakdown of the steps that the `spacedDigits()` function takes:
///
/// 1. Get the number of digits in the input string.
/// 2. If the divisor is not provided, then uses 3 or 4 as the divisor depending on the input length.
/// 3. Call the `space()` function to get a string with spaces inserted between each digit of the input string.
/// 4. Return the string with spaces inserted between each digit.
///
/// Here is an example of how to use the `spacedDigits()` function:
///
/// ```
/// String input = "123456789";
/// String spacedOutput = spacedDigits(input, 2);
/// print(spacedOutput); // "12 34 56 78 9"
/// ```
///
/// In this example, the `spacedDigits()` function is used to get a string with spaces inserted between each digit of the input string.
/// The output of the function is the string "12 34 56 78 9".
String spacedDigits(String input, int? div) {
  int count = 0;
  String spacedOutput = '';
// This is more efficient, as it avoids the need to create a new function for each call to the spacedDigits function.
  final int divs = divisions(input);

  if (matchCard(input)) {
    if (div != null) {
      return space(input, () => div);
    }

    if (space(input, () => divs) == input) {
      for (var i = 0; i < input.length; i++) {
        if (count == divisionsWithRemainder(input)) {
          spacedOutput += ' ';
          count = 0;
        }
        spacedOutput += input[i];
        count += 1;
      }
    } else {
      spacedOutput = space(
        input,
        () => divisions(input),
      );
    }
    return spacedOutput.trim();
  } else {
    return 'Invalid card number';
  }
}

// This function takes a string input and adds spaces after every n characters, where n
// is the number of divisions calculated by the divisions() function.
String space(String input, int Function() div) {
  int count = 0;
  String spacedOutput = '';

  // Loop through each character in the input string
  for (var i = 0; i < input.length; i++) {
    if (count == div()) {
      // If the count is equal to the number of divisions, add a space character
      spacedOutput += ' ';
      count = 0;
    }
    // Add the current character to the output string
    spacedOutput += input[i];
    count += 1;
  }
  // Remove any leading or trailing spaces and return the spaced output string
  return spacedOutput.trim();
}
