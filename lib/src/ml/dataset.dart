import 'dart:math';

import 'package:dart_functions/src/maths/matrix.dart';
import 'package:equatable/equatable.dart';

/// A class that represents a dataset.
class Dataset implements Equatable, Comparable<Dataset> {
  /// Creates a new dataset with the given image ID, views, and rating.
  const Dataset({
    this.imageId,
    required this.views,
    required this.rating,
    this.rank,
  });

  Dataset.getWithRank({
    this.imageId,
    required this.views,
    required this.rating,
  }) : rank = getRank(rating, views);

  /// Creates a new dataset with the given views and rating. The image ID will be null.
  Dataset.dataPoint({
    required this.views,
    required this.rating,
  })  : imageId = null,
        rank = getRank(rating, views);

  /// The image ID.
  final int? imageId;

  /// The number of views.
  final double views;

  /// The rating.
  final double rating;

  /// The rank of the dataset.
  ///
  /// The rank is calculated by adding the rating and the number of views.
  final double? rank;

  @override
  String toString() {
    return 'Dataset{imageId: $imageId, views: $views, rating: $rating, rank: $rank}';
  }

  @override
  int compareTo(Dataset other) {
    if (rating != other.rating) {
      return (rating - other.rating).toInt();
    }
    return (views - other.views).toInt();
    //return this - other;
  }

  /// Subtracts the given dataset from this dataset.
  Dataset operator -(Dataset other) {
    return Dataset.getWithRank(
      imageId: imageId,
      rating: rating - other.rating,
      views: views - other.views,
    );
  }

  /*int operator -(Dataset other) {
    if (rating != other.rating) {
      return (rating - other.rating).toInt();
    }
    return (views - other.views).toInt();
  }*/

  /// Raises this dataset to the given power.
  factory Dataset.power(Dataset dataset, int exponent) {
    return Dataset.getWithRank(
      imageId: dataset.imageId,
      rating: pow(dataset.rating, exponent).toDouble(),
      views: pow(dataset.views, exponent).toDouble(),
    );
  }

  /// Creates a dataset from the given JSON object.
  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      imageId: json['image_id'] as int,
      views: json['views'] as double,
      rating: json['rating'] as double,
    );
  }

  /// Converts this dataset to JSON.
/*  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'views': views,
      'rating': rating,
    };
  }*/

  Map<String, dynamic> toJsonList(List list) {
    Map<String, dynamic> map = {};

    map = {
      'dataset': [
        for (int i = 0; i < list.length; i++)
          ({
            'image_id': list[i].imageId,
            'views': list[i].views,
            'rating': list[i].rating,
          })
      ]
    };
    return map;
  }

  @override
  List<Object?> get props => [imageId, views, rating, rank];

  @override
  bool? get stringify => false;

  /// Generates a sample dataset of 1000 datasets.
  static List<Dataset> sample() {
    List<Dataset> list = [];
    for (int i = 0; i < 1000; i++) {
      Dataset newImage = Dataset.getWithRank(
        imageId: i + 1,
        views: ((pow(i, 3) + 5 * i + 3) * 10),
        rating: (pow(i, 2) + 2 * i + 1) * 0.5,
      );
      list.add(newImage);
    }
    return list;
  }

  static List<Dataset> fromList(List l) {
    List<Dataset> list = [];
    for (int i = 0; i < l.length; i++) {
      Dataset newImage = Dataset.getWithRank(
        imageId: i + 1,
        views: l[i][0],
        rating: l[i][1],
      );
      list.add(newImage);
    }
    return list;
  }

  /// Converts a list of datasets to a matrix.
  static Matrix toMatrix(List<Dataset> datasets) {
    List<List<double>> matrix = [];
    for (Dataset dataset in datasets) {
      List<double> row = [dataset.views, dataset.rating, dataset.rank!];
      matrix.add(row);
    }
    return Matrix(matrix);
  }
}

/// Calculates the rank of a dataset.
double getRank(double rating, double views) {
  return rating + (5 * views);
}
