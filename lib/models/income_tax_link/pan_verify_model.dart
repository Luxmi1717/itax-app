// To parse this JSON data, do
//
//     final panVerifyModel = panVerifyModelFromJson(jsonString);

import 'dart:convert';

PanVerifyModel panVerifyModelFromJson(String str) => PanVerifyModel.fromJson(json.decode(str));

String panVerifyModelToJson(PanVerifyModel data) => json.encode(data.toJson());

class PanVerifyModel {
  bool success;
  Data data;

  PanVerifyModel({
    required this.success,
    required this.data,
  });

  factory PanVerifyModel.fromJson(Map<String, dynamic> json) => PanVerifyModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String pan;
  String lastName;
  String fullName;
  String status;
  String aadhaarSeedingStatus;
  String category;
  String lastUpdated;

  Data({
    required this.pan,
    required this.lastName,
    required this.fullName,
    required this.status,
    required this.aadhaarSeedingStatus,
    required this.category,
    required this.lastUpdated,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pan: json["pan"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    status: json["status"],
    aadhaarSeedingStatus: json["aadhaar_seeding_status"],
    category: json["category"],
    lastUpdated: json["last_updated"],
  );

  Map<String, dynamic> toJson() => {
    "pan": pan,
    "last_name": lastName,
    "full_name": fullName,
    "status": status,
    "aadhaar_seeding_status": aadhaarSeedingStatus,
    "category": category,
    "last_updated": lastUpdated,
  };
}