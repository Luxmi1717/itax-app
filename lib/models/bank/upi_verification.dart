// To parse this JSON data, do
//
//     final upiVerificationModel = upiVerificationModelFromJson(jsonString);

import 'dart:convert';

UpiVerificationModel upiVerificationModelFromJson(String str) => UpiVerificationModel.fromJson(json.decode(str));

String upiVerificationModelToJson(UpiVerificationModel data) => json.encode(data.toJson());

class UpiVerificationModel {
  UpiVerificationModel({
    required this.code,
    required this.timestamp,
    required this.transactionId,
    required this.data,
  });

  int code;
  int timestamp;
  String transactionId;
  Data data;

  factory UpiVerificationModel.fromJson(Map<String, dynamic> json) => UpiVerificationModel(
    code: json["code"],
    timestamp: json["timestamp"],
    transactionId: json["transaction_id"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "timestamp": timestamp,
    "transaction_id": transactionId,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.accountExists,
    required this.nameAtBank,
  });

  bool accountExists;
  String nameAtBank;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountExists: json["account_exists"],
    nameAtBank: json["name_at_bank"],
  );

  Map<String, dynamic> toJson() => {
    "account_exists": accountExists,
    "name_at_bank": nameAtBank,
  };
}
