import 'dart:convert';

InvoiceGetByIdModel invoiceGetByIdModelFromJson(String str) => InvoiceGetByIdModel.fromJson(json.decode(str));

String invoiceGetByIdModelToJson(InvoiceGetByIdModel data) => json.encode(data.toJson());

class InvoiceGetByIdModel {
  String id;
  int invoiceNumber;
  String type;
  String partyId;
  String phone;
  String partyName;
  int totalAmount;
  int totalGst;
  String stateOfSupply;
  int cgst;
  int sgst;
  int igst;
  int utgst;
  String details;
  String extraDetails;
  String modeOfPayment;
  bool credit;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  InvoiceGetByIdModel({
    required this.id,
    required this.invoiceNumber,
    required this.type,
    required this.partyId,
    required this.phone,
    required this.partyName,
    required this.totalAmount,
    required this.totalGst,
    required this.stateOfSupply,
    required this.cgst,
    required this.sgst,
    required this.igst,
    required this.utgst,
    required this.details,
    required this.extraDetails,
    required this.modeOfPayment,
    required this.credit,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InvoiceGetByIdModel.fromJson(Map<String, dynamic> json) =>
      InvoiceGetByIdModel(
        id: json["id"],
        invoiceNumber: json["invoiceNumber"],
        type: json["type"],
        partyId: json["partyId"],
        phone: json["phone"],
        partyName: json["partyName"],
        totalAmount: json["totalAmount"],
        totalGst: json["totalGst"],
        stateOfSupply: json["stateOfSupply"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        igst: json["igst"],
        utgst: json["utgst"],
        details: json["details"],
        extraDetails: json["extraDetails"],
        modeOfPayment: json["modeOfPayment"],
        credit: json["credit"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "invoiceNumber": invoiceNumber,
        "type": type,
        "partyId": partyId,
        "phone": phone,
        "partyName": partyName,
        "totalAmount": totalAmount,
        "totalGst": totalGst,
        "stateOfSupply": stateOfSupply,
        "cgst": cgst,
        "sgst": sgst,
        "igst": igst,
        "utgst": utgst,
        "details": details,
        "extraDetails": extraDetails,
        "modeOfPayment": modeOfPayment,
        "credit": credit,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}