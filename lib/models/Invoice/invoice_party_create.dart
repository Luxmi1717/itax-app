// To parse this JSON data, do
//
//     final invoicePartyCreateModel = invoicePartyCreateModelFromJson(jsonString);

import 'dart:convert';

InvoicePartyCreateModel invoicePartyCreateModelFromJson(String str) => InvoicePartyCreateModel.fromJson(json.decode(str));

String invoicePartyCreateModelToJson(InvoicePartyCreateModel data) => json.encode(data.toJson());

class InvoicePartyCreateModel {
  bool success;
  Party party;

  InvoicePartyCreateModel({
    required this.success,
    required this.party,
  });

  factory InvoicePartyCreateModel.fromJson(Map<String, dynamic> json) => InvoicePartyCreateModel(
    success: json["success"],
    party: Party.fromJson(json["party"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "party": party.toJson(),
  };
}

class Party {
  String id;
  String partyName;
  String type;
  String gstin;
  String pan;
  dynamic tan;
  String upi;
  String email;
  String phone;
  String address;
  String bankName;
  String bankAccountNumber;
  String bankIfsc;
  String bankBranch;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Party({
    required this.id,
    required this.partyName,
    required this.type,
    required this.gstin,
    required this.pan,
    required this.tan,
    required this.upi,
    required this.email,
    required this.phone,
    required this.address,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankIfsc,
    required this.bankBranch,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Party.fromJson(Map<String, dynamic> json) => Party(
    id: json["id"],
    partyName: json["partyName"],
    type: json["type"],
    gstin: json["gstin"],
    pan: json["pan"],
    tan: json["tan"],
    upi: json["upi"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    bankName: json["bankName"],
    bankAccountNumber: json["bankAccountNumber"],
    bankIfsc: json["bankIfsc"],
    bankBranch: json["bankBranch"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "partyName": partyName,
    "type": type,
    "gstin": gstin,
    "pan": pan,
    "tan": tan,
    "upi": upi,
    "email": email,
    "phone": phone,
    "address": address,
    "bankName": bankName,
    "bankAccountNumber": bankAccountNumber,
    "bankIfsc": bankIfsc,
    "bankBranch": bankBranch,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}