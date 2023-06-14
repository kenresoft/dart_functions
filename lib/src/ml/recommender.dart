import 'dart:math';

import 'package:dart_functions/dart_functions.dart';

class Recommender {
  ///
  /// How the recommender works:
  ///
  /// 1. The `euclideanDistance()` function calculates the Euclidean distance between two datasets.
  /// The Euclidean distance is a measure of how similar two datasets are.
  /// 2. The `sortDistanceList()` function sorts a list of distances by their values.
  /// This allows us to find the k nearest neighbors of a given dataset.
  /// 3. The `kNearestNeighbors()` function finds the k nearest neighbors of a given dataset.
  /// The k nearest neighbors are the datasets that are most similar to the given dataset.
  /// 4. The `recommendData()` function recommends data to a user based on their interests.
  /// The function works by first finding the k nearest neighbors of the user's dataset.
  /// The function then counts the occurrence of each neighbor.
  /// The function returns the dataset with the highest occurrence count.
  Recommender({required this.trainDataset});

  final Dataset trainDataset;

  /// Calculates the Euclidean distance between two datasets.
  double euclideanDistance(DataImage row1, DataImage row2) {
    num distance = pow((row1.views - row2.views), 2) + pow((row1.rating - row2.rating), 2) + pow((row1.rank! - row2.rank!), 2);
    return sqrt(distance.toInt());
  }

  /// Sorts a list of distances by their values.
  List sortDistanceList(List distance) {
    distance.sort((a, b) => a[1].compareTo(b[1]));
    return distance;
  }

  /// Finds the k nearest neighbors of a given dataset.
  List<DataImage> kNearestNeighbors(List<DataImage> trainDataset, DataImage testDatapoint, int neighbours) {
    List distances = []; // item -- Dataset & double
    for (var i = 0; i < trainDataset.length; i++) {
      var trainRow = trainDataset[i];
      double dist = euclideanDistance(testDatapoint, trainRow);
      distances.add([trainRow, dist]);
    }

    ///sorting the while comparing the euclidean of the test_row and the train data
    var sortedDistance = sortDistanceList(distances);
    var neighbors = <DataImage>[];
    for (var i = 0; i < neighbours; i++) {
      neighbors.add(sortedDistance[i][0]);
      print("Neighbours: ${sortedDistance[i][0]}");
    }
//List<Dataset> neighbors = distances.take(neighbours).map((distance) => trainDataset[distances.indexOf(distance)]).toList();
    return neighbors;
  }

  /// Recommends data to a user based on their interests.
  dynamic recommendData(DataImage testDatapoint, int neighbors) {
    /// Calculate the distances between the testDatapoint and all the data points in the trainDataset.
    List distances = [];
    for (DataImage datapoint in trainDataset.dataImage!) {
      distances.add([datapoint, DataImage.power(datapoint - testDatapoint, 2)]);
    }
    sortDistanceList(distances);

    var nearestNeighbors = <DataImage>[];
    for (var i = 0; i < neighbors; i++) {
      nearestNeighbors.add(distances[i][0]);
      print("Neighbours: ${distances[i][0]}");
    }

    /// Count the occurrence of each neighbor.
    Map countOccurrence = nearestNeighbors.fold({}, (Map map, DataImage neighbor) {
      map[neighbor.rank] = (map[neighbor.rank] ?? 0) + 1;
      return map;
    });

    /// Return the countOccurrence.
    return countOccurrence;
  }
}
