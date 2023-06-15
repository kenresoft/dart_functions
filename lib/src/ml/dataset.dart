import 'dart:convert';

import 'package:dart_functions/dart_functions.dart';

/// Converts a JSON string to a `Dataset` object.
Dataset datasetFromJson(String str) => Dataset.fromJson(json.decode(str));

/// Converts a `Dataset` object to a JSON string.
String datasetToJson(Dataset data) => json.encode(data.toJson());

/// A class that represents a dataset of data images.
class Dataset {
  /// Creates a new `Dataset` object with the specified data images.
  Dataset({List<DataImage>? dataImage}) {
    _dataImage = dataImage;
  }

  /// Creates a new `Dataset` object from a JSON object.
  Dataset.fromJson(dynamic json) {
    if (json['dataImage'] != null) {
      _dataImage = [];
      json['dataImage'].forEach((v) {
        _dataImage?.add(DataImage.fromJson(v));
      });
    }
  }

  /// The list of data images in the dataset.
  List<DataImage>? _dataImage;

  /// Creates a copy of the `Dataset` object with the specified changes.
  Dataset copyWith({List<DataImage>? dataImage}) {
    return Dataset(
      dataImage: dataImage ?? _dataImage,
    );
  }

  /// Gets the list of data images in the dataset.
  List<DataImage>? get dataImage => _dataImage;

  /// Converts the `Dataset` object to a JSON object.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataImage != null) {
      map['dataImage'] = _dataImage?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
