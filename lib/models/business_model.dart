import 'dart:convert';

BusinessModel businessModelFromJson(String str) => BusinessModel.fromJson(json.decode(str));

String businessModelToJson(BusinessModel data) => json.encode(data.toJson());

class BusinessModel {
  String status;
  String message;
  Result result;

  BusinessModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  int id;
  int resultUserId;
  String businessName;
  String bankAccountNo;
  String companyPanNo;
  String companyTanNo;
  String msmeNo;
  String gstNo;
  String bandDetails;
  String incorporateCertificate;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic userId;

  Result({
    required this.id,
    required this.resultUserId,
    required this.businessName,
    required this.bankAccountNo,
    required this.companyPanNo,
    required this.companyTanNo,
    required this.msmeNo,
    required this.gstNo,
    required this.bandDetails,
    required this.incorporateCertificate,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    resultUserId: json["user_id"],
    businessName: json["businessName"],
    bankAccountNo: json["bankAccountNo"],
    companyPanNo: json["companyPanNo"],
    companyTanNo: json["companyTanNo"],
    msmeNo: json["msmeNo"],
    gstNo: json["gstNo"],
    bandDetails: json["bandDetails"],
    incorporateCertificate: json["incorporateCertificate"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    userId: json["UserId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": resultUserId,
    "businessName": businessName,
    "bankAccountNo": bankAccountNo,
    "companyPanNo": companyPanNo,
    "companyTanNo": companyTanNo,
    "msmeNo": msmeNo,
    "gstNo": gstNo,
    "bandDetails": bandDetails,
    "incorporateCertificate": incorporateCertificate,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "UserId": userId,
  };
}
BusinessModelValue businessModelValueFromJson(String str) => BusinessModelValue.fromJson(json.decode(str));

String businessModelValueToJson(BusinessModelValue data) => json.encode(data.toJson());

class BusinessModelValue {
  String businessName;
  String companyPanNo;
  String companyTanNo;
  String msmeNo;
  String gstNo;
  String bankDetails;
  String incorporateCertificate;
  String bankAccountNo;

  BusinessModelValue({
    required this.businessName,
    required this.companyPanNo,
    required this.companyTanNo,
    required this.msmeNo,
    required this.gstNo,
    required this.bankDetails,
    required this.incorporateCertificate,
    required this.bankAccountNo,
  });

  factory BusinessModelValue.fromJson(Map<String, dynamic> json) => BusinessModelValue(
    businessName: json["businessName"],
    companyPanNo: json["companyPanNo"],
    companyTanNo: json["companyTanNo"],
    msmeNo: json["msmeNo"],
    gstNo: json["gstNo"],
    bankDetails: json["bankDetails"],
    incorporateCertificate: json["incorporateCertificate"],
    bankAccountNo: json["bankAccountNo"],
  );

  Map<String, dynamic> toJson() => {
    "businessName": businessName,
    "companyPanNo": companyPanNo,
    "companyTanNo": companyTanNo,
    "msmeNo": msmeNo,
    "gstNo": gstNo,
    "bankDetails": bankDetails,
    "incorporateCertificate": incorporateCertificate,
    "bankAccountNo": bankAccountNo,
  };
}