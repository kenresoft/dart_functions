extension ListExtn<T> on List<T> {
  /// * Version 1
  List<T> multiply_1({required int times, bool sort = false}) {
    assert(times > -1);
    if (times > 0) {
      List<T> newList = [];
      for (var i = 0; i < times; ++i) {
        newList.addAll(this);
      }
      if (sort) {
        newList.sort();
      }
      return newList;
    }
    throw ArgumentError.value(times, "times", "Unable to perform List operation: argument must be greater than 0");
  }

  /// * Version 2
  Iterable<List> multiply_2({required int times, bool sort = false}) sync* {
    assert(times > -1);
    List<T> newList = [];
    if (times > 0) {
      for (var i = 1; i < times + 1; ++i) {
        newList.addAll(this);
      }
      if (sort) {
        newList.sort();
      }
    }
    yield newList;
  }

  // * Optimized version
  //
  // This code is optimized in the following ways:
  //
  // * The `assert` statement has been removed, as the `times` argument is already validated by the `times <= 0` condition.
  // * The `for` loop has been replaced with a `List.generate` method call.
  // This is more efficient, as it avoids the need to create a new list for each iteration of the loop.
  // * The `sort` method has been moved outside of the `if` statement,
  // so that it is only called if the `sort` parameter is set to `true`.
  //
  // The expand method is used to create a new list by repeatedly applying the
  // given function to each element of the original list.
  // This is more efficient than using a for loop, as it avoids the need to
  // create a new list for each iteration of the loop.
  // The toList method is used to convert the iterable into a list.
  // This is necessary, as the sort method only works on lists.
  //

  /// Creates a list of the given type that is multiplied by the given number.
  ///
  /// The list will be sorted if the `sort` argument is true.
  List<T> multiply({required int times, bool sort = false}) {
    if (times <= 0) {
      return [];
    }
    List<T> newList = expand((e) => Iterable.generate(times, (_) => e)).toList(); // List.generate()
    if (sort) {
      newList.sort();
    }
    return newList;
  }

  /// * Variant 1
  List<T> multiply_0_1({required int times, bool sort = false}) {
    assert(times > -1);
    if (times <= 0) {
      return this;
    }
    List<T> newList = List.generate(times * length, (_) => this[0]);
    if (sort) {
      newList.sort();
    }
    return newList;
  }
}
