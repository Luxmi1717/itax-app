// To parse this JSON data, do
//
//     final compoundInterest = compoundInterestFromJson(jsonString);

import 'dart:convert';

CompoundInterest compoundInterestFromJson(String str) => CompoundInterest.fromJson(json.decode(str));

String compoundInterestToJson(CompoundInterest data) => json.encode(data.toJson());

class CompoundInterest {
  CompoundInterest({
     this.success,
    required this.results,
  });

  bool? success;
  Results results;

  factory CompoundInterest.fromJson(Map<String, dynamic> json) => CompoundInterest(
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
    required this.principle,
    required this.interestEarned,
    required this.yearWiseInterest,
    required this.monthlyCalculation,
  });

  String status;
  int principle;
  int interestEarned;
  List<MonthlyCalculation> yearWiseInterest;
  List<MonthlyCalculation> monthlyCalculation;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    status: json["status"],
    principle: json["principle"],
    interestEarned: json["interestEarned"],
    yearWiseInterest: List<MonthlyCalculation>.from(json["yearWiseInterest"].map((x) => MonthlyCalculation.fromJson(x))),
    monthlyCalculation: List<MonthlyCalculation>.from(json["monthlyCalculation"].map((x) => MonthlyCalculation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "principle": principle,
    "interestEarned": interestEarned,
    "yearWiseInterest": List<dynamic>.from(yearWiseInterest.map((x) => x.toJson())),
    "monthlyCalculation": List<dynamic>.from(monthlyCalculation.map((x) => x.toJson())),
  };
}

class MonthlyCalculation {
  MonthlyCalculation({
    this.month,
    required this.openingBalance,
    required this.interestEarned,
    required this.closingBalance,
    this.year,
  });

  int? month;
  int openingBalance;
  int interestEarned;
  int closingBalance;
  int? year;

  factory MonthlyCalculation.fromJson(Map<String, dynamic> json) => MonthlyCalculation(
    month: json["month"],
    openingBalance: json["opening_balance"],
    interestEarned: json["interest_earned"],
    closingBalance: json["closing_balance"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "opening_balance": openingBalance,
    "interest_earned": interestEarned,
    "closing_balance": closingBalance,
    "year": year,
  };
}