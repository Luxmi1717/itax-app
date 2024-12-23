// To parse this JSON data, do
//
//     final gstOpt = gstOptFromJson(jsonString);



// To parse this JSON data, do
//
//     final generateOpt = generateOptFromJson(jsonString);

import 'dart:convert';

GenerateOpt generateOptFromJson(String str) => GenerateOpt.fromJson(json.decode(str));

String generateOptToJson(GenerateOpt data) => json.encode(data.toJson());

class GenerateOpt {
  GenerateOpt({
    required this.gstin,
    required this.gstPortalUsername,
  });

  String gstin;
  String gstPortalUsername;

  factory GenerateOpt.fromJson(Map<String, dynamic> json) => GenerateOpt(
    gstin: json["gstin"],
    gstPortalUsername: json["gst_portal_username"],
  );

  Map<String, dynamic> toJson() => {
    "gstin": gstin,
    "gst_portal_username": gstPortalUsername,
  };
}


GstOpt gstOptFromJson(String str) => GstOpt.fromJson(json.decode(str));

String gstOptToJson(GstOpt data) => json.encode(data.toJson());

class GstOpt {
  bool success;
  Data data;

  GstOpt({
    required this.success,
    required this.data,
  });

  factory GstOpt.fromJson(Map<String, dynamic> json) => GstOpt(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String statusCd;
  String message;

  Data({
    required this.statusCd,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    statusCd: json["status_cd"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_cd": statusCd,
    "message": message,
  };
}



GstOptVerify gstOptVerifyFromJson(String str) => GstOptVerify.fromJson(json.decode(str));

String gstOptVerifyToJson(GstOptVerify data) => json.encode(data.toJson());

class GstOptVerify {
  bool success;
  String message;

  GstOptVerify({
    required this.success,
    required this.message,
  });

  factory GstOptVerify.fromJson(Map<String, dynamic> json) => GstOptVerify(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}