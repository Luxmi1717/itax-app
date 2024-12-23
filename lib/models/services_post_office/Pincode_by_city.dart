// To parse this JSON data, do
//
//     final pinByCityModel = pinByCityModelFromJson(jsonString);

import 'dart:convert';

PinByCityModel pinByCityModelFromJson(String str) => PinByCityModel.fromJson(json.decode(str));

String pinByCityModelToJson(PinByCityModel data) => json.encode(data.toJson());

class PinByCityModel {
  bool success;
  List<Datum> data;

  PinByCityModel({
    required this.success,
    required this.data,
  });

  factory PinByCityModel.fromJson(Map<String, dynamic> json) => PinByCityModel(
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