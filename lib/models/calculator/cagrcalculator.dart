// To parse this JSON data, do
//
//     final cagrCalculatorModel = cagrCalculatorModelFromJson(jsonString);

import 'dart:convert';

CagrCalculatorModel cagrCalculatorModelFromJson(String str) => CagrCalculatorModel.fromJson(json.decode(str));

String cagrCalculatorModelToJson(CagrCalculatorModel data) => json.encode(data.toJson());

class CagrCalculatorModel {
  bool success;
  String results;

  CagrCalculatorModel({
    required this.success,
    required this.results,
  });

  factory CagrCalculatorModel.fromJson(Map<String, dynamic> json) => CagrCalculatorModel(
    success: json["success"],
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "results": results,
  };
}

