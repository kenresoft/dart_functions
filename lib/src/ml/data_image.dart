import 'dart:convert';
import 'dart:math';

import 'package:dart_functions/dart_functions.dart';
import 'package:equatable/equatable.dart';

/// A class that represents a dataset.
class DataImage implements Equatable, Comparable<DataImage> {
  /// Creates a new dataset with the given image ID, views, and rating.
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

  /// Creates a new dataset with the given views and rating. The image ID will be null.
  DataImage.dataPoint({
    required this.views,
    required this.rating,
  })  : imageId = null,
        rank = getRank(rating, views);

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

  /// The rank of the dataset.
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
    if (rating != other.rating) {
      return (rating - other.rating).toInt();
    }
    return (views - other.views).toInt();
    //return this - other;
  }

  /// Subtracts the given dataset from this dataset.
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

  /// Raises this dataset to the given power.
  factory DataImage.power(DataImage dataset, int exponent) {
    return DataImage.getWithRank(
      imageId: dataset.imageId,
      rating: pow(dataset.rating, exponent).toDouble(),
      views: pow(dataset.views, exponent).toDouble(),
    );
  }

  /// Creates a dataset from the given JSON object.
  factory DataImage.fromJson(Map<String, dynamic> json) {
    return DataImage(
      imageId: json['image_id'] as int,
      views: json['views'] as double,
      rating: json['rating'] as double,
    );
  }

  /// Converts this dataset to JSON.
  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'views': views,
      'rating': rating,
    };
  }

  static Map<String, dynamic> toJsonList(Dataset dataset) {
    Map<String, dynamic> map = {};

    map = {
      'dataImage': [
        for (int i = 0; i < dataset.dataImage!.length; i++)
          {
            'image_id': dataset.dataImage![i].imageId,
            'views': dataset.dataImage![i].views,
            'rating': dataset.dataImage![i].rating,
          }
      ]
    };
    return map;
  }

  @override
  List<Object?> get props => [imageId, views, rating, rank];

  @override
  bool? get stringify => false;

  /// Generates a sample dataset of 1000 datasets.
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

  static Dataset fromList(List list) {
    List<DataImage> dataImageList = [];
    for (int i = 0; i < list.length; i++) {
      DataImage newImage = DataImage.getWithRank(
        imageId: i + 1,
        views: list[i][0],
        rating: list[i][1],
      );
      dataImageList.add(newImage);
    }
    return Dataset(dataImage: dataImageList);
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

/// Calculates the rank of a dataset.
double getRank(double rating, double views) {
  return rating + (5 * views);
}
