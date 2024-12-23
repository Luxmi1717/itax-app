// To parse this JSON data, do
//
//     final capitalGainRespons = capitalGainResponsFromJson(jsonString);

import 'dart:convert';

CapitalGain1 capitalGainFromJson(String str) => CapitalGain1.fromJson(json.decode(str));

String capitalGainToJson(CapitalGain1 data) => json.encode(data.toJson());

class CapitalGain1 {
  CapitalGain1({
    required this.assets,
    required this.buyDate,
    required this.sellDate,
    required this.buyPrice,
    required this.sellPrice,
  });

  String assets;
  DateTime buyDate;
  DateTime sellDate;
  int buyPrice;
  int sellPrice;

  factory CapitalGain1.fromJson(Map<String, dynamic> json) => CapitalGain1(
    assets: json["assets"],
    buyDate: DateTime.parse(json["buyDate"]),
    sellDate: DateTime.parse(json["sellDate"]),
    buyPrice: json["buyPrice"],
    sellPrice: json["sellPrice"],
  );

  Map<String, dynamic> toJson() => {
    "assets": assets,
    "buyDate": "${buyDate.year.toString().padLeft(4, '0')}-${buyDate.month.toString().padLeft(2, '0')}-${buyDate.day.toString().padLeft(2, '0')}",
    "sellDate": "${sellDate.year.toString().padLeft(4, '0')}-${sellDate.month.toString().padLeft(2, '0')}-${sellDate.day.toString().padLeft(2, '0')}",
    "buyPrice": buyPrice,
    "sellPrice": sellPrice,
  };
}

// To parse this JSON data, do
//
//     final capitalGainRespons = capitalGainResponsFromJson(jsonString);





CapitalGainRespons capitalGainResponsFromJson(String str) => CapitalGainRespons.fromJson(json.decode(str));

String capitalGainResponsToJson(CapitalGainRespons data) => json.encode(data.toJson());

class CapitalGainRespons {
  bool success;
  String results;

  CapitalGainRespons({
    required this.success,
    required this.results,
  });

  factory CapitalGainRespons.fromJson(Map<String, dynamic> json) => CapitalGainRespons(
    success: json["success"],
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "results": results,
  };
}

