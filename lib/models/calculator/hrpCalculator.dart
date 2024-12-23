// To parse this JSON data, do
//
//     final hrpCalModel = hrpCalModelFromJson(jsonString);

import 'dart:convert';

HraCalResponse hraCalResponseFromJson(String str) => HraCalResponse.fromJson(json.decode(str));

String hraCalResponseToJson(HraCalResponse data) => json.encode(data.toJson());

class HraCalResponse {
  HraCalResponse({required this.success, required this.results,});

  bool success;
  Results results;

  factory HraCalResponse.fromJson(Map<String, dynamic> json) => HraCalResponse(
    success: json["success"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "results": results.toJson(),
  };
}

class Results {
  Results({
    required this.status,
    required this.hraExempted,
  });

  String status;
  int hraExempted;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    status: json["status"],
    hraExempted: json["hraExempted"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "hraExempted": hraExempted,
  };
}

HraCal hraCalFromJson(String str) => HraCal.fromJson(json.decode(str));

String hraCalToJson(HraCal data) => json.encode(data.toJson());

class HraCal {
  HraCal({
    required this.basic,
    required this.hra,
    required this.rentPaid,
    required this.allowances,
    required this.metroCity,
  });

  int basic;
  int hra;
  int rentPaid;
  int allowances;
  bool metroCity;

  factory HraCal.fromJson(Map<String, dynamic> json) => HraCal(
    basic: json["basic"],
    hra: json["hra"],
    rentPaid: json["rentPaid"],
    allowances: json["allowances"],
    metroCity: json["metroCity"],
  );

  Map<String, dynamic> toJson() => {
    "basic": basic,
    "hra": hra,
    "rentPaid": rentPaid,
    "allowances": allowances,
    "metroCity": metroCity,
  };
}
