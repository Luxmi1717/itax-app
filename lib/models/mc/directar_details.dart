// To parse this JSON data, do
//
//     final directDetailsModel = directDetailsModelFromJson(jsonString);

import 'dart:convert';

DirectDetailsModel directDetailsModelFromJson(String str) => DirectDetailsModel.fromJson(json.decode(str));

String directDetailsModelToJson(DirectDetailsModel data) => json.encode(data.toJson());

class DirectDetailsModel {
  DirectDetailsModel({
    required this.success,
    required this.results,
  });

  bool success;
  Results results;

  factory DirectDetailsModel.fromJson(Map<String, dynamic> json) => DirectDetailsModel(
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
    required this.transactionId,
    required this.code,
    required this.data,
    required this.timestamp,
  });

  String transactionId;
  int code;
  Data data;
  int timestamp;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    transactionId: json["transaction_id"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "code": code,
    "data": data.toJson(),
    "timestamp": timestamp,
  };
}

class Data {
  Data({
    required this.llpData,
    required this.companyData,
    required this.directorData,
  });

  List<dynamic> llpData;
  List<CompanyDatum> companyData;
  DirectorData directorData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    llpData: List<dynamic>.from(json["llp_data"].map((x) => x)),
    companyData: List<CompanyDatum>.from(json["company_data"].map((x) => CompanyDatum.fromJson(x))),
    directorData: DirectorData.fromJson(json["director_data"]),
  );

  Map<String, dynamic> toJson() => {
    "llp_data": List<dynamic>.from(llpData.map((x) => x)),
    "company_data": List<dynamic>.from(companyData.map((x) => x.toJson())),
    "director_data": directorData.toJson(),
  };
}

class CompanyDatum {
  CompanyDatum({
    required this.endDate,
    required this.activeCompliance,
    required this.companyName,
    required this.beginDate,
    required this.cinFcrn,
  });

  String endDate;
  String activeCompliance;
  String companyName;
  String beginDate;
  String cinFcrn;

  factory CompanyDatum.fromJson(Map<String, dynamic> json) => CompanyDatum(
    endDate: json["end_date"],
    activeCompliance: json["active_compliance"],
    companyName: json["company_name"],
    beginDate: json["begin_date"],
    cinFcrn: json["cin/fcrn"],
  );

  Map<String, dynamic> toJson() => {
    "end_date": endDate,
    "active_compliance": activeCompliance,
    "company_name": companyName,
    "begin_date": beginDate,
    "cin/fcrn": cinFcrn,
  };
}

class DirectorData {
  DirectorData({
    required this.din,
    required this.name,
  });

  String din;
  String name;

  factory DirectorData.fromJson(Map<String, dynamic> json) => DirectorData(
    din: json["din"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "din": din,
    "name": name,
  };
}