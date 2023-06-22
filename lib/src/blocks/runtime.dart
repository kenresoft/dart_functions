/// This measures the execution time of a block of code. 
/// The function takes two parameters: a function that represents the block of code to be timed, 
/// and a function that will be called with the duration of the execution time. 

void runTime(Function() block, Function(Duration duration) timeTaken) {
  final start = DateTime.now();
  block();
  final end = DateTime.now();
  timeTaken(end.difference(start));
}
