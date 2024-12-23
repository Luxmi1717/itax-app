// To parse this JSON data, do
//
//     final pincodeByInfoModel = pincodeByInfoModelFromJson(jsonString);

import 'dart:convert';

PincodeByInfoModel pincodeByInfoModelFromJson(String str) => PincodeByInfoModel.fromJson(json.decode(str));

String pincodeByInfoModelToJson(PincodeByInfoModel data) => json.encode(data.toJson());

class PincodeByInfoModel {
  bool success;
  List<Datum> data;

  PincodeByInfoModel({
    required this.success,
    required this.data,
  });

  factory PincodeByInfoModel.fromJson(Map<String, dynamic> json) => PincodeByInfoModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String officeName;
  int pincode;
  String taluk;
  String districtName;
  String stateName;

  Datum({
    required this.officeName,
    required this.pincode,
    required this.taluk,
    required this.districtName,
    required this.stateName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    officeName: json["officeName"],
    pincode: json["pincode"],
    taluk: json["taluk"],
    districtName: json["districtName"],
    stateName: json["stateName"],
  );

  Map<String, dynamic> toJson() => {
    "officeName": officeName,
    "pincode": pincode,
    "taluk": taluk,
    "districtName": districtName,
    "stateName": stateName,
  };
}