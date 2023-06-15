import 'dart:convert';
import 'dart:math';

import 'package:dart_functions/dart_functions.dart';
import 'package:equatable/equatable.dart';

/// A class that represents a `dataImage`.
class DataImage implements Equatable, Comparable<DataImage> {
  /// Creates a new `dataImage` with the given image ID, views, and rating.
  const DataImage({
    this.imageId,
    required this.views,
    required this.rating,
    this.rank,
  });

  DataImage.getWithRank({
    this.imageId,
    required this.views,
    required this.rating,
  }) : rank = getRank(rating, views);

  /// Creates a new `dataImage` with the given views and rating. The image ID will be null.
  DataImage.dataPoint({
    required this.views,
    required this.rating,
  })  : imageId = null,
        rank = getRank(rating, views);

  /// Creates a copy of the `DataImage` object with the specified changes.
  DataImage copyWith({
    int? imageId,
    double? views,
    double? rating,
  }) =>
      DataImage(
        imageId: imageId ?? this.imageId,
        views: views ?? this.views,
        rating: rating ?? this.rating,
      );

  /// The image ID.
  final int? imageId;

  /// The number of views.
  final double views;

  /// The rating.
  final double rating;

  /// The rank of the `dataImage`.
  ///
  /// The rank is calculated by adding the rating and the number of views.
  final double? rank;

  DataImage dataImageFromJson(String str) => DataImage.fromJson(json.decode(str));

  String dataImageToJson(DataImage data) => json.encode(data.toJson());

  @override
  String toString() {
    return 'Dataset{imageId: $imageId, views: $views, rating: $rating, rank: $rank}';
  }

  @override
  int compareTo(DataImage other) {
    // Check if the ratings are different.
    if (rating != other.rating) {
      // Return the difference between the ratings, converted to an integer.
      return (rating - other.rating).toInt();
    }

    // Check if the views are different.
    if (views != other.views) {
      // Return the difference between the views, converted to an integer.
      return (views - other.views).toInt();
      //return this - other;
    }

    // The ratings and views are equal. Return 0.
    return 0;
  }

  /// Subtracts the given `dataImage` from this `dataImage`.
  DataImage operator -(DataImage other) {
    return DataImage.getWithRank(
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

  /// Raises this `dataImage` to the given power.
  factory DataImage.power(DataImage dataset, int exponent) {
    return DataImage.getWithRank(
      imageId: dataset.imageId,
      rating: pow(dataset.rating, exponent).toDouble(),
      views: pow(dataset.views, exponent).toDouble(),
    );
  }

  /// Creates a `dataImage` from the given JSON object.
  factory DataImage.fromJson(Map<String, dynamic> json) {
    return DataImage(
      imageId: json['image_id'] as int,
      views: json['views'] as double,
      rating: json['rating'] as double,
    );
  }

  /// Converts this `dataImage` to JSON.
  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'views': views,
      'rating': rating,
    };
  }

  /// Convert a Dataset object to a JSON list.
  static Map<String, dynamic> toJsonList(Dataset dataset) {
    // Create an empty map.
    Map<String, dynamic> map = {};
    // Get the dataImage property from the dataset object.
    List<DataImage> dataImage = dataset.dataImage!;

    map = {
      'dataImage': [
        // Iterate through the list of dataImage objects.
        for (int i = 0; i < dataset.dataImage!.length; i++)
          // Create a JSON object for the current dataImage object.
          {
            'image_id': dataImage[i].imageId,
            'views': dataImage[i].views,
            'rating': dataImage[i].rating,
          }
      ]
    };
    // Return the map.
    return map;
  }

  @override
  List<Object?> get props => [imageId, views, rating, rank];

  @override
  bool? get stringify => false;

  /// Generates a sample dataset of 1000 dataImages.
  static Dataset sample() {
    List<DataImage> list = [];
    for (int i = 0; i < 1000; i++) {
      DataImage newImage = DataImage.getWithRank(
        imageId: i + 1,
        views: ((pow(i, 3) + 5 * i + 3) * 10),
        rating: (pow(i, 2) + 2 * i + 1) * 0.5,
      );
      list.add(newImage);
    }
    return Dataset(dataImage: list);
  }

  /// Create a Dataset object from a list of DataImage objects
  static Dataset fromList(List list) {
    // Create a new List object to store the DataImage objects.
    List<DataImage> dataImageList = [];

    // Iterate through the list of DataImage objects.
    for (int i = 0; i < list.length; i++) {
      // Create a new DataImage object.
      DataImage newImage = DataImage.getWithRank(
        imageId: i + 1,
        views: list[i][0],
        rating: list[i][1],
      );

      // Add the new DataImage object to the dataImageList list.
      dataImageList.add(newImage);
    }

    // Create a new Dataset object.
    Dataset dataset = Dataset(dataImage: dataImageList);

    // Return the Dataset object.
    return dataset;
  }

  /// Converts a list of datasets to a matrix.
  static Matrix toMatrix(Dataset datasets) {
    List<List<double>> matrix = [];
    for (DataImage dataset in datasets.dataImage!) {
      List<double> row = [dataset.views, dataset.rating, dataset.rank!];
      matrix.add(row);
    }
    return Matrix(matrix);
  }
}

/// Calculates the rank of a `dataImage`.
double getRank(double rating, double views) {
  return rating + (5 * views);
}
