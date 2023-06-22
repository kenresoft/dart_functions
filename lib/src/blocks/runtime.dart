void runTime(Function() block, Function(Duration duration) timeTaken) {
  final start = DateTime.now();
  block();
  final end = DateTime.now();
  timeTaken(end.difference(start));
}
