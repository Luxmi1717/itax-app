// To parse this JSON data, do
//
//     final postOfficeMisModel = postOfficeMisModelFromJson(jsonString);

import 'dart:convert';

PostOfficeMisModel postOfficeMisModelFromJson(String str) => PostOfficeMisModel.fromJson(json.decode(str));

String postOfficeMisModelToJson(PostOfficeMisModel data) => json.encode(data.toJson());

class PostOfficeMisModel {
  bool success;
  Results results;

  PostOfficeMisModel({
    required this.success,
    required this.results,
  });

  factory PostOfficeMisModel.fromJson(Map<String, dynamic> json) => PostOfficeMisModel(
    success: json["success"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "results": results.toJson(),
  };
}

class Results {
  String status;
  double monthlyIncome;

  Results({
    required this.status,
    required this.monthlyIncome,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    status: json["status"],
    monthlyIncome: json["monthlyIncome"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "monthlyIncome": monthlyIncome,
  };
}
