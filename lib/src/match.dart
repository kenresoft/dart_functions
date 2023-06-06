/// Matches a string that starts with a digit, followed by 15 digits, or starts with 4, 5, or 6, followed by 16 digits.
/// Here is a breakdown of the regular expression:
/// * `^`: The caret symbol matches the beginning of the string.
/// * `[0-9]`: The character class matches any digit.
/// * `\d{15}`: The sequence of digits matches 15 digits.
/// * `|`: The pipe symbol matches either the preceding expression or the following expression.
/// * `[456]`: The character class matches the digits 4, 5, or 6.
/// * `\d{16}`: The sequence of digits matches 16 digits.
/// * ``: The dollar sign symbol matches the end of the string.
bool matchCard(String input) {
  //RegExp regex = RegExp(r'^[456]\d{15}|[456]\d{16}$');
  RegExp regex = RegExp(r'^[1-3]\d{15}|[456]\d{16}$');
  final match = regex.hasMatch(input);
  return match ? true : false;
}
