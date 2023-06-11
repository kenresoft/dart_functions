import 'dart:math';

import 'package:dart_functions/src/ml/dataset.dart';

double euclideanDistance(Dataset row1, Dataset row2) {
  num distance = pow((row1.views - row2.views), 2) + pow((row1.rating - row2.rating), 2) + pow((row1.rank! - row2.rank!), 2);
  return sqrt(distance.toInt());
}

List sortDistanceList(List distance) {
  //sorts while comparing two items of list
  //compares the distance hence [1] where it access the distance
  //distance.sort((a, b) => a[1] - b[1]);
  distance.sort((a, b) => a[1].compareTo(b[1]));
  return distance;
}

List<Dataset> kNearestNeighbors(List<Dataset> trainDataset, Dataset testDatapoint, int neighbours) {
  List distances = []; // item -- Dataset & double
  for (var i = 0; i < trainDataset.length - 1; i++) {
    var trainRow = trainDataset[i];
    double dist = euclideanDistance(testDatapoint, trainRow);
    distances.add([trainRow, dist]);
  }
  //sorting the while comparing the euclidean of the test_row and the train data
  var sortedDistance = sortDistanceList(distances);
  var neighbors = <Dataset>[];
  for (var i = 0; i < neighbours; i++) {
    neighbors.add(sortedDistance[i][0]);
    print("Neighbours: ${sortedDistance[i][0]}");
  }
  //List<Dataset> neighbors = distances.take(neighbours).map((distance) => trainDataset[distances.indexOf(distance)]).toList();
  return neighbors;
}

/*dynamic knn(List<Dataset> trainDataset, Dataset testDatapoint, int neighbors) {
  List<Dataset> kNeighbors = kNearestNeighbors(trainDataset, testDatapoint, neighbors);
  Map<num, int> countOccurrence = {};
  for (var neighbor in kNeighbors) {
    countOccurrence[neighbor.rank] = (countOccurrence[neighbor.rank] ??= 0) + 1;
  }
  return countOccurrence;
}*/

/*dynamic knn(List<Dataset> trainDataset, Dataset testDatapoint, int neighbors) {
  List<Dataset> kNeighbors = kNearestNeighbors(trainDataset, testDatapoint, neighbors);
  Map<num, int> countOccurrence = kNeighbors.fold(Map.fromEntries([]), (Map<num, int> acc, Dataset neighbor) {
    acc[neighbor.rank] = (acc[neighbor.rank] ?? 0) + 1;
    return acc;
  });
  return countOccurrence;
}*/

dynamic knn(List<Dataset> trainDataset, Dataset testDatapoint, int neighbors) {
  // Calculate the distances between the testDatapoint and all the data points in the trainDataset.
  List distances = [];
  for (Dataset datapoint in trainDataset) {
    distances.add([datapoint, (datapoint - testDatapoint).power(2)]);
  }
  sortDistanceList(distances);

  // Sort the distances and select the k nearest neighbors.
  //List<Dataset> nearestNeighbors = distances.take(neighbors).map((distance) => trainDataset[distances.indexOf(distance)]).toList();
  ////var sortedDistance = sortDistanceList(distances);
  var nearestNeighbors = <Dataset>[];
  for (var i = 0; i < neighbors; i++) {
    nearestNeighbors.add(distances[i][0]);
    print("Neighbours: ${distances[i][0]}");
  }

  //List<Dataset> nearestNeighbors = kNearestNeighbors(trainDataset, testDatapoint, neighbors);

  // Count the occurrence of each neighbor.
  Map countOccurrence = nearestNeighbors.fold({}, (Map map, Dataset neighbor) {
    map[neighbor.rank] = (map[neighbor.rank] ?? 0) + 1;
    return map;
  });

  // Return the countOccurrence.
  return countOccurrence;
}
