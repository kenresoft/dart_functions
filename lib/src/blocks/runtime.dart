runTime(Function() block, Function(Duration duration) timeTaken) {
  final start2 = DateTime.now();
  block();
  final end2 = DateTime.now();
  timeTaken(end2.difference(start2));
}