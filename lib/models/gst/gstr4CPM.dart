// To parse this JSON data, do
//
//     final gstr4CpModel = gstr4CpModelFromJson(jsonString);

import 'dart:convert';

Gstr4CpModel gstr4CpModelFromJson(String str) => Gstr4CpModel.fromJson(json.decode(str));

String gstr4CpModelToJson(Gstr4CpModel data) => json.encode(data.toJson());

class Gstr4CpModel {
  String transactionId;
  int code;
  Data data;
  int timestamp;

  Gstr4CpModel({
    required this.transactionId,
    required this.code,
    required this.data,
    required this.timestamp,
  });

  factory Gstr4CpModel.fromJson(Map<String, dynamic> json) => Gstr4CpModel(
    transactionId: json["transaction_id"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "code": code,
    "data": data.toJson(),
    "timestamp": timestamp,
  };
}

class Data {
  String referenceId;

  Data({
    required this.referenceId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    referenceId: json["reference_id"],
  );

  Map<String, dynamic> toJson() => {
    "reference_id": referenceId,
  };
}
