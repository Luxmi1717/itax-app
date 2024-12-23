// To parse this JSON data, do
//
//
//    final gstRespones = gstResponesFromJson(jsonString);

import 'dart:convert';

GstCalcu gstCalcuFromJson(String str) => GstCalcu.fromJson(json.decode(str));

String gstCalcuToJson(GstCalcu data) => json.encode(data.toJson());

class GstCalcu {
  GstCalcu({
    required this.amount,
    required this.gstRate,
    required this.type,
  });

  int amount;
  int gstRate;
  String type;

  factory GstCalcu.fromJson(Map<String, dynamic> json) => GstCalcu(
    amount: json["amount"],
    gstRate: json["gstRate"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "gstRate": gstRate,
    "type": type,
  };
}

//
//     final gstRespones = gstResponesFromJson(jsonString);



GstRespones gstResponesFromJson(String str) => GstRespones.fromJson(json.decode(str));

String gstResponesToJson(GstRespones data) => json.encode(data.toJson());

class GstRespones {
  bool success;
  Results results;

  GstRespones({
    required this.success,
    required this.results,
  });

  factory GstRespones.fromJson(Map<String, dynamic> json) => GstRespones(
    success: json["success"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "results": results.toJson(),
  };
}

class Results {
  String status;
  String finalAmount;
  String gstAmount;
  String amount;
  String gstType;
  String gstRate;

  Results({
    required this.status,
    required this.finalAmount,
    required this.gstAmount,
    required this.amount,
    required this.gstType,
    required this.gstRate,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    status: json["status"],
    finalAmount: json["finalAmount"],
    gstAmount: json["gstAmount"],
    amount: json["amount"],
    gstType: json["gstType"],
    gstRate: json["gstRate"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "finalAmount": finalAmount,
    "gstAmount": gstAmount,
    "amount": amount,
    "gstType": gstType,
    "gstRate": gstRate,
  };
}
