import 'dart:convert';

import 'package:dart_functions/dart_functions.dart';

Dataset datasetFromJson(String str) => Dataset.fromJson(json.decode(str));

String datasetToJson(Dataset data) => json.encode(data.toJson());

class Dataset {
  Dataset({List<DataImage>? dataImage}) {
    _dataImage = dataImage;
  }

  Dataset.fromJson(dynamic json) {
    if (json['dataImage'] != null) {
      _dataImage = [];
      json['dataImage'].forEach((v) {
        _dataImage?.add(DataImage.fromJson(v));
      });
    }
  }

  List<DataImage>? _dataImage;

  Dataset copyWith({List<DataImage>? dataImage}) {
    return Dataset(
      dataImage: dataImage ?? _dataImage,
    );
  }

  List<DataImage>? get dataImage => _dataImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataImage != null) {
      map['dataImage'] = _dataImage?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
