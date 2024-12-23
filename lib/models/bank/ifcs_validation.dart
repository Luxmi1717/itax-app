// To parse this JSON data, do
//
//     final ifcsValidationModel = ifcsValidationModelFromJson(jsonString);

import 'dart:convert';

IfcsValidationModel ifcsValidationModelFromJson(String str) => IfcsValidationModel.fromJson(json.decode(str));

String ifcsValidationModelToJson(IfcsValidationModel data) => json.encode(data.toJson());

class IfcsValidationModel {
  IfcsValidationModel({
    required this.data,
  });

  Data data;

  factory IfcsValidationModel.fromJson(Map<String, dynamic> json) => IfcsValidationModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.micr,
    required this.branch,
    required this.address,
    required this.state,
    required this.contact,
    required this.upi,
    required this.rtgs,
    required this.city,
    required this.centre,
    required this.district,
    required this.neft,
    required this.imps,
    this.swift,
    required this.iso3166,
    required this.bank,
    required this.bankcode,
    required this.ifsc,
  });

  String micr;
  String branch;
  String address;
  String state;
  String contact;
  bool upi;
  bool rtgs;
  String city;
  String centre;
  String district;
  bool neft;
  bool imps;
  dynamic swift;
  String iso3166;
  String bank;
  String bankcode;
  String ifsc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    micr: json["MICR"].toString(),
    branch: json["BRANCH"],
    address: json["ADDRESS"],
    state: json["STATE"],
    contact: json["CONTACT"],
    upi: json["UPI"],
    rtgs: json["RTGS"],
    city: json["CITY"],
    centre: json["CENTRE"],
    district: json["DISTRICT"],
    neft: json["NEFT"],
    imps: json["IMPS"],
    swift: json["SWIFT"],
    iso3166: json["ISO3166"],
    bank: json["BANK"],
    bankcode: json["BANKCODE"],
    ifsc: json["IFSC"],
  );

  Map<String, dynamic> toJson() => {
    "MICR": micr,
    "BRANCH": branch,
    "ADDRESS": address,
    "STATE": state,
    "CONTACT": contact,
    "UPI": upi,
    "RTGS": rtgs,
    "CITY": city,
    "CENTRE": centre,
    "DISTRICT": district,
    "NEFT": neft,
    "IMPS": imps,
    "SWIFT": swift,
    "ISO3166": iso3166,
    "BANK": bank,
    "BANKCODE": bankcode,
    "IFSC": ifsc,
  };
}