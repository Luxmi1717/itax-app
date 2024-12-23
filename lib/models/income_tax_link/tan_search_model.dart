// To parse this JSON data, do
//
//     final tanSearchModel = tanSearchModelFromJson(jsonString);

import 'dart:convert';

TanSearchModel tanSearchModelFromJson(String str) => TanSearchModel.fromJson(json.decode(str));

String tanSearchModelToJson(TanSearchModel data) => json.encode(data.toJson());

class TanSearchModel {
  bool success;
  Data data;

  TanSearchModel({
    required this.success,
    required this.data,
  });

  factory TanSearchModel.fromJson(Map<String, dynamic> json) => TanSearchModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Header header;
  List<dynamic> messages;
  List<dynamic> errors;
  String nameOrgn;
  String addLine1;
  String addLine2;
  String addLine3;
  String addLine5;
  int stateCd;
  int pin;
  String phoneNum;
  int dtTanAllotment;
  String emailId1;

  Data({
    required this.header,
    required this.messages,
    required this.errors,
    required this.nameOrgn,
    required this.addLine1,
    required this.addLine2,
    required this.addLine3,
    required this.addLine5,
    required this.stateCd,
    required this.pin,
    required this.phoneNum,
    required this.dtTanAllotment,
    required this.emailId1,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    header: Header.fromJson(json["header"]),
    messages: List<dynamic>.from(json["messages"].map((x) => x)),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    nameOrgn: json["nameOrgn"],
    addLine1: json["addLine1"],
    addLine2: json["addLine2"],
    addLine3: json["addLine3"],
    addLine5: json["addLine5"],
    stateCd: json["stateCd"],
    pin: json["pin"],
    phoneNum: json["phoneNum"],
    dtTanAllotment: json["dtTanAllotment"],
    emailId1: json["emailId1"],
  );

  Map<String, dynamic> toJson() => {
    "header": header.toJson(),
    "messages": List<dynamic>.from(messages.map((x) => x)),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "nameOrgn": nameOrgn,
    "addLine1": addLine1,
    "addLine2": addLine2,
    "addLine3": addLine3,
    "addLine5": addLine5,
    "stateCd": stateCd,
    "pin": pin,
    "phoneNum": phoneNum,
    "dtTanAllotment": dtTanAllotment,
    "emailId1": emailId1,
  };
}

class Header {
  Header();

  factory Header.fromJson(Map<String, dynamic> json) => Header(
  );

  Map<String, dynamic> toJson() => {
  };
}
